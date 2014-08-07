/*
 * Control the visual output of multimedia player according to media fragments info
 */
		
var MediaFragmentController = Base.extend({
	CHECK_PERIOD:1000,
	constructor:function()
	{
		//Do nothing
	},
	//based on the conditions provided by the ua test cases to decide which of the four playback function to call
	start_playback:function()
	{
		//To Working Group: the test cases don't have explanation on how query and hash act differently
		if($.isEmptyObject(mf_json)) //media fragment is not successfully parsed
		{
			//console.log("mf_json entire");
			this.playback_entire();
			return;
		}
		//console.log("1");
		var st, et, unit; //st, et are in seconds
		
		//I just assume that the st and et in query will be rewritted by the information in hash
		
		if(!$.isEmptyObject(mf_json.hash)) // mf_json.hash
		{
			if(!$.isEmptyObject(mf_json.hash.t))
			{
				unit = mf_json.hash.t[0].unit;
			}
		}
		
		if(unit === undefined)
		{
			this.playback_entire();
			return;
		}
		else
		{
			unit = $.trim(unit).toLowerCase();
		}
		//console.log("2");
		if(unit == "npt")
		{
			
			st = mf_json.hash.t[0].start?mf_json.hash.t[0].startNormalized:0;
			et = mf_json.hash.t[0].end?mf_json.hash.t[0].endNormalized:-1; //-1 means no end time is provided
			st = parseFloat(st);
			et = parseFloat(et);
		}
		else if(unit=="smpte" || unit == "smpte-25" || unit == "smpte-30" || unit == "smpte-30-drop")
		{
			st = mf_json.hash.t[0].start?mf_json.hash.t[0].start:0;
			et = mf_json.hash.t[0].end?mf_json.hash.t[0].end:-1;
			
			st = smpteStringToMilisec(st)/1000; //this method is defined in player.util.js
			//console.log("smpte st:"+st);
			if(et != -1)
				et = smpteStringToMilisec(et)/1000;
			//console.log("smpte et:"+et);
			if(et!=-1 && st>et)
			{
				//console.log("entire smpte");
				this.playback_entire();
				return;
			}
		}
		//TODO: get xywh info
		//console.log("3");
		if(unit=="clock")
		{
			//TODO:Not implemented yet
			this.playback_entire();
			return;
		}
		//console.log("st:"+st);
		//console.log("et:"+et);
		//TODO: Use getDuration() method to decide if et > duration
		if(st == 0 && et > st) // st = 0 or not provided, et is prvided
		{
			//console.log("front");
			this.playback_front(et);
			return;
		}
		else if(st > 0 && et > st)
		{
			this.playback_middle(st,et);
			return;
		}
		//else if(st == 0 && et ==-1)
		//{
		//	this.playback_entire();
		//	return;
		//}
		else if(st > 0 && et == -1) //st is provide, but et is not provided
		{
			//console.log("end");
			this.playback_end(st);
			return;
		}
		else
		{
			//console.log("entire last");
			this.playback_entire();
			return;
		}
	},
	stop_playback:function(label)
	{
		$(document).stopTime(label);
		multimedia.pause();
	},
	playback_entire:function()
	{
		multimedia.play(); //Yunjia back
		//Yunjia back:multimedia.initPlayer(factory.isAudio,0);
	},
	//Playback from the start to et 
	playback_front:function(et)
	{
		multimedia.play();
		//Yunjia back:multimedia.initPlayer(factory.isAudio,0);
		$(document).everyTime(this.CHECK_PERIOD,"front",function()
		{
			//var et = mf_json.hash.t[0].end;
			if(multimedia.getPosition() > et*1000)
			{
				ctrler.stop_playback("front");
			}
			//console.log("state:"+multimedia.player.getState());
		});
	},
	//Playback from st to et
	playback_middle:function(st,et)
	{
		//var st = mf_json.hash.t[0].start;
		//multimedia.play();
		//console.log("middle st:"+st);
		//Yunjia back: multimedia.initPlayer(factory.isAudio,st*1000);
		multimedia.playFrom(st*1000);
		$(document).everyTime(this.CHECK_PERIOD,"middle",function()
		{
			//var et = mf_json.hash.t[0].end;
			if(multimedia.getPosition() > et*1000)
			{
				ctrler.stop_playback("middle");
			}
		});
	},
	//Playback from
	playback_end:function(st)
	{
		//var st = mf_json.hash.t[0].start;
		//Yunjia back:multimedia.initPlayer(factory.isAudio,st*1000);
	}
});