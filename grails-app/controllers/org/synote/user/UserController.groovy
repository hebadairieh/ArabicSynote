package org.synote.user

import grails.plugins.springsecurity.Secured
import org.synote.user.UserRole
import org.synote.annotation.ResourceAnnotation;
import org.synote.permission.ResourcePermission
import org.synote.permission.PermissionValue
import org.synote.resource.compound.*
import org.synote.resource.single.text.TagResource
import grails.converters.*
import org.synote.resource.ResourceService
import org.synote.resource.compound.WebVTTService
import org.synote.user.group.UserGroup
import org.synote.user.group.UserGroupMember
import org.synote.user.group.UserGroupService

class UserController {

	def securityService
	def resourceService
	def webVTTService
	def userGroupService

	@Secured(['ROLE_ADMIN','ROLE_NORMAL'])
	def index = {
		//Do nothing
	}

	/*
	 * Used for linked data dereferencing
	 */
	def show = {
		def userInstance = User.get(params.id?.toLong())
		if (!userInstance || securityService.isAdmin(userInstance)) {
			flash.error = "Cannot find user"
			redirect(action: "index")
		}
		else {
			render (view:'show',model:[userInstance: userInstance])
		}
		return
	}
	
	@Secured(['ROLE_ADMIN','ROLE_NORMAL'])
	def showUserProfile = {
		def userInstance = securityService.getLoggedUser()
		if (!userInstance) {
			flash.error = "Cannot find the logged in user."
			redirect(action: "index")
		}
		else {
			userInstance = User.get(userInstance.id)
			render (view:'showUserProfile',model:[userInstance: userInstance])
		}
		return
	}

	@Secured(['ROLE_ADMIN','ROLE_NORMAL'])
	def changePassword=
	{
		//Do nothing
	}

	@Secured(['ROLE_ADMIN','ROLE_NORMAL'])
	def handleChangePassword=
	{
		def user = securityService.getLoggedUser()
		user=User.get(user.id)

		if(!params.oldPassword)
		{
			flash.error ="Please input your old password"
			redirect(action: 'changePassword')
			return
		}

		if(!params.newPassword)
		{
			flash.error ="Please input your new password"
			redirect(action: 'changePassword')
			return
		}

		if(!params.confirmNewPassword)
		{
			flash.error="Please confirm your new password"
			redirect(action: 'changePassword')
			return
		}

		if(securityService.encodePassword(user.userName, params.oldPassword) != user.password)
		{
			flash.error="The old password is not correct!"
			redirect(action:'changePassword')
			return
		}

		if(!params.newPassword.equals(params.confirmNewPassword))
		{
			flash.error="The new passworld and new confirmed password do not match!"
			redirect(action:'changePassword')
			return
		}

		if (params.newPassword.size() > 0)
		{
			user.password = securityService.encodePassword(user.userName, params.newPassword)
			user.confirmedPassword = securityService.encodePassword(user.userName, params.confirmNewPassword)
		}

		//Because we are using Acegi. When you get UserDomain: springSecurityService.userDomain(),
		//the user object is actually locked. So we need to use another way around
		if (user.hasErrors() || !user.merge(flush:true))
		{
			securityService.getLoggedUser().properties = user.peroperties
			render(view: 'changePassword', model: [user: user])
			return
		}

		flash.message = "Your password has been successfully changed."
		redirect(action:'index')
		return
	}

	@Secured(['ROLE_ADMIN','ROLE_NORMAL'])
	def editUserProfile =
	{
		def user = securityService.getLoggedUser()
		return [user: user]
	}

	@Secured(['ROLE_ADMIN','ROLE_NORMAL'])
	def handleEditUserProfile =
	{

		def user = securityService.getLoggedUser()
		user = User.get(user.id)

		user.properties = params

		if (user.hasErrors() || !user.merge())
		{
			securityService.getLoggedUser().properties = user.properties
			render(view: 'editUserProfile', model: [user: user])
			return
		}

		flash.message = "Your basic information has been successfuly updated"
		redirect(action: index)
		return
	}

	//Open list my group page
	@Secured(['ROLE_NORMAL'])
	def listGroups = {
		//groups that I am the owner
		def groupListOwner = userGroupService.getMyGroupsAsJSON(params)
		
		//groups that I joined
		def groupListJoined = userGroupService.getMyJoinedGroupsAsJSON(params)
		return [groupListOwner: groupListOwner, groupListJoined: groupListJoined, params:params]
	}
	
	@Secured(['ROLE_NORMAL'])
	def createGroup = {
		return [params:params]
	}
	
	@Secured(['ROLE_NORMAL'])
	def saveGroup = {
		def userGroup = new UserGroup(params)
		
		userGroup.owner = securityService.getLoggedUser()
		
		
		if(userGroup.hasErrors() || !userGroup.save(flush:true))
		{
			render(view: 'createGroup', params:params)
			return
		}
		
		flash.message = "Group ${userGroup.name} was successfully created"
		redirect(action: 'listGroups')
		return
	}
	
	/*
	 * open edit usergroup page
	 */
	@Secured(['ROLE_ADMIN','ROLE_NORMAL'])
	def editGroup = {
		
		def userGroup = UserGroup.get(params.id)
		
		if (!userGroup)
		{
			flash.error = "Group with id ${params.id} not found"
			response.status = 400
			render view:'/error/400'
			return
		}
		
		if (!securityService.isOwnerOrAdmin(userGroup.owner.id))
		{
			flash.error = "Permission denied - cannot edit group with id ${params.id}"
			response.status = 400
			render view:'/error/400'
			return
		}
		
		return [userGroup: userGroup]
	}
	
	@Secured(['ROLE_ADMIN','ROLE_NORMAL'])
	def updateGroup = {
		
		def userGroup = UserGroup.get(params.id)
		def owner= securityService.getLoggedUser();
		
		if (!userGroup)
		{
			flash.error = "Group with id ${params.id} not found"
			response.status = 400
			render view:'/error/400'
			return
		}
		
		//If current logged in user is not the owner
		if (!securityService.isOwnerOrAdmin(userGroup.owner.id))
		{
			flash.error = "Permission denied - cannot update group with id ${params.id}"
			response.status = 400
			render view:'/error/400'
			return
		}
		
		if(!params.name)
		{
			flash.error = "Please input the group name."
			render(controller:'user', view: 'editGroup', model: [userGroup: userGroup])
			return
		}
		
		def oldGroup = UserGroup.findByNameAndOwner(params.name, owner)
		
		if(oldGroup)
		{
			if(oldGroup.id != userGroup.id)
			{
				flash.error = "The owner ${owner} has already got a group with name ${params.name}. Please select another name."
				render(controller:'user', view: 'editGroup', model: [userGroup: userGroup])
				return
			}
		}
		
		userGroup.properties = params
		
		if(userGroup.hasErrors() || !userGroup.save())
		{
			render(controller:'user', view: 'editGroup', model: [userGroup: userGroup])
			return
		}
		
		flash.message = "Group ${userGroup.name} was successfully updated"
		redirect(controller:'user', action: 'listGroups')
		return
	}
	
	@Secured(['ROLE_NORMAL'])
	def addRecordingPermission = {
		def multimediaResource = MultimediaResource.get(params.id?.toLong())
		
		if (!multimediaResource)
		{
			flash.error = "Multimedia with id ${params.id} not found"
			redirect(action: list)
			return
		}
		if (!securityService.isOwnerOrAdmin(multimediaResource.owner.id))
		{
			flash.error = "Permission denied - cannot edit multimedia with id ${params.id}"
			redirect(action: list)
			return
		}
		
		//You can only add to your own group
		def groupList = userGroupService.getMyGroupsAsJSON(params)
		return [groupList: groupList, params:params, multimedia:multimediaResource]
	}

	@Secured(['ROLE_NORMAL'])
	def saveRecordingPermission = {
		if (!securityService.isLoggedIn())
		{
			flash.message = "User login required"
			redirect(controller: 'login', action: 'auth')
			return
		}
		
		def userGroup = UserGroup.get(params.groupId)
		
		if (!userGroup)
		{
			flash.error = "Group with id ${params.groupId} not found"
			response.status = 400
			render view:'/error/400'
			return
		}
		
		if (!securityService.isOwnerOrAdmin(userGroup.owner.id))
		{
			flash.error = "Permission denied - cannot add permission to group with id ${params.id}"
			response.status = 400
			render view:'/error/400'
			return
		}
		
		def resource = MultimediaResource.get(params.id?.toLong())
		if(!resource)
		{
			flash.error ="Cannot find resource"
			response.status = 400
			render view:'/error/400'
			return
		}
		
		def perm = params.perm ? PermissionValue.findByVal(params.perm) : PermissionValue.findByVal(0)
		if(!perm)
		{
			flash.error = "The permission is not specified"
			response.status = 400
			render view:'/error/400'
			return
		}
		
		//check if the logged in user is the resource owner
		if (!securityService.isOwnerOrAdmin(resource.owner.id))
		{
			flash.error = "Permission denied - cannot add recording '${resource.title}' to group ${userGroup.name}"
			response.status = 400
			render view:'/error/400'
			return
		}
		
		def permission = new ResourcePermission(group: userGroup, resource: resource, perm: perm)
		if(!permission.validate()) {
			flash.error = "Recording '${resource.title}' has already been in group ${userGroup.name}"
			redirect(action: 'addRecordingPermission', id:params.id)
			return
		}
		if(permission.hasErrors() || !permission.save())
		{
			flash.error = "Cannot add recording '${resource.title}' to group ${userGroup.name}"
			redirect(action: 'addRecordingPermission', id:params.id)
			return
		}
		
		flash.message = "Recording '${resource.title}' was successfully added to group ${userGroup.name}"
		redirect(action: 'addRecordingPermission', id:params.id)
		return
	}
	
	//List my tags
	@Secured(['ROLE_ADMIN','ROLE_NORMAL'])
	def listTags = {

		//Yunjia: it's not valuable to display tag cloud for just one user because it's not very many
		//So we only return the tag
		def user = securityService.getLoggedUser()
		def tagList = [:]
		def resourcetagList = TagResource.findAllByOwner(user)
		resourcetagList.each{tag->
			String term = tag.content?.trim()
			if(term != null && term.length() > 0)
			{
				if(tagList.get(term) == null)
				{
					tagList.put(term, 1)
				}
				else
				{
					tagList[term] = ((int)tagList.get(term))+1
				}
			}
		}

		def tagArray = []

		tagList.sort().each{key,value->
			tagArray << ["text":key,"weight":value]
		}

		return [tags:tagArray]
	}
	
	//List all tags used by all users, return type: xml
	@Secured(['ROLE_ADMIN','ROLE_NORMAL'])
	def listAllTags = {
	   
	   //Yunjia: it's not valuable to display tag cloud for just one user because it's not very many
	   //def user = securityService.getLoggedUser()
	   
	   def tagList = [:]
	   def resourcetagList = TagResource.list()
	   log.debug("tag list size:"+resourcetagList.size());
	   resourcetagList.each{tag->
		   String term = tag.content?.trim()
		   //log.debug("term:"+term)
		   if(term != null)
		   {
			   if(tagList.get(term) == null)
			   {
				   tagList.put(term, 1)
			   }
			   else
			   {
				   tagList[term] = ((int)tagList.get(term))+1
			   }
		   }
	   }
	   
	   log.debug("tag list size:"+tagList.size())
	   
	   def tagArray = []
	   tagList.each{key,value->
		   tagArray << ["text":key,"weight":value]
	   }
	   
	   def topTagArray = tagArray.sort{-it.weight}[0..50]
	  
	   /*return (contentType:"text/xml", encoding:"UTF-8")
	   {
			  synote(action:"listAllTags")
			  {
				   tags()
				   {
					   tagList.each{key,value->
						   tag{
							   text(key)
							   weight(value)
						   }
					   }
				   }
			   }
	   }*/
	   render topTagArray as JSON
	   return
	}

	@Secured(['ROLE_ADMIN','ROLE_NORMAL'])
	def listRecordings = {
		try
		{
			def multimediaList = resourceService.getMyMultimediaAsJSON(params) as Map
			return [multimediaList:multimediaList, params:params]
		}
		catch(org.hibernate.QueryException qex) //In case the query params not found
		{
			flash.error = qex.getMessage()
			redirect(action:'index')
			return
		}
	}
	
	@Secured(['ROLE_ADMIN','ROLE_NORMAL'])
	def listSynmarks = {
		try
		{
			def synmarksList = resourceService.getMySynmarksAsJSON(params)
			return [synmarksList:synmarksList, params:params]
		}
		catch(org.hibernate.QueryException qex) //In case the query params not found
		{
			flash.error = qex.getMessage()
			redirect(action:'index')
			return
		}
	}
	
	/*
	 * List all my multimedia resource with transcript as JSON, not listing transcript
	 */
	@Secured(['ROLE_ADMIN','ROLE_NORMAL'])
	def listTranscripts = {
		try
		{
			def multimediaList = resourceService.getMyTranscriptsAsJSON(params)
			return [multimediaList:multimediaList, params:params]
		}
		catch(org.hibernate.QueryException qex) //In case the query params not found
		{
			flash.error = qex.getMessage()
			redirect(action:'index')
			return
		}
	}
	
	@Secured(['ROLE_ADMIN','ROLE_NORMAL'])
	def cancel =
	{ redirect(action:'index') }

	def termsAndConditions = {
		//Do nothing
	}

	def userToUser = {
		//Do nothing
	}

	def accessibility = {
		//Do nothing
	}
	
	def contact = {
		//Do nothing	
	}
	
	//Open the help page
	def help= {
		//Do nothing
	}
	
	/* admin only */
	@Secured(['ROLE_ADMIN'])
	def edit = {
		def userInstance = User.get(params.id)
		if (!userInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [userInstance: userInstance]
		}
	}

	@Secured(['ROLE_ADMIN'])
	def update = {
		def userInstance = User.get(params.id)
		if (userInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (userInstance.version > version) {

					userInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [
						message(code: 'user.label', default: 'User')]
					as Object[], "Another user has updated this User while you were editing")
					render(view: "edit", model: [userInstance: userInstance])
					return
				}
			}
			userInstance.properties = params
			if (!userInstance.hasErrors() && userInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
				redirect(action: "show", id: userInstance.id)
			}
			else {
				render(view: "edit", model: [userInstance: userInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
			redirect(action: "list")
		}
	}

	@Secured(['ROLE_ADMIN'])
	def delete = {
		def userInstance = User.get(params.id)
		if (userInstance) {
			try {
				userInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
				redirect(action: "list")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
				redirect(action: "show", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
			redirect(action: "list")
		}
	}
	
	@Secured(['ROLE_ADMIN'])
	def list = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		//UserRole role = UserRole.findByAuthority("ROLE_NORMAL")

		def userInstanceList = User.createCriteria().list(params){
			authorities{ eq("authority","ROLE_NORMAL")	 }
		}
		[userInstanceList: userInstanceList, userInstanceTotal: User.count()]
	}

	@Secured(['ROLE_ADMIN'])
	def create = {
		def userInstance = new User()
		userInstance.properties = params
		return [userInstance: userInstance]
	}

	@Secured(['ROLE_ADMIN'])
	def save = {
		def userInstance = new User(params)
		if (userInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
			redirect(action: "show", id: userInstance.id)
		}
		else {
			render(view: "create", model: [userInstance: userInstance])
		}
	}
}
