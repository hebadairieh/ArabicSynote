dataSource {
	pooled = true
	driverClassName = "com.mysql.jdbc.Driver"
	dialect = "org.hibernate.dialect.MySQLInnoDBDialect"
	username = "root"
	password = ""
}
hibernate {
    cache.use_second_level_cache=true
    cache.use_query_cache=true
    cache.provider_class='net.sf.ehcache.hibernate.EhCacheProvider'
	//cache.provider_class= 'com.opensymphony.oscache.hibernate.OSCacheProvider'
}
// environment specific settings
environments {
	development {
		dataSource {
			//dbCreate = "create-drop" // one of 'create', 'create-drop','update'
			dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
			dialect = "org.hibernate.dialect.H2Dialect"
			url = "jdbc:mysql://localhost/zft"
			//url= ApplicationHolder.application.metadata['app.database.development.url']
		}
	}
	test {
		dataSource {
//			dbCreate = "create-drop"
			url = "jdbc:mysql://localhost/synote"
		}
	}
	production {
		dataSource {
			//dbCreate = "update"
			//url = "jdbc:mysql://uos-app00408-vs.soton.ac.uk/synote?user=synote&password=synote"
			//url = "jdbc:mysql://uos-app00408-vs.soton.ac.uk/pp_synote?user=synote&password=synote"
			//url="jdbc:mysql://localhost/synote?user=synote&password=synote"
			//url="jdbc:mysql://localhost/synote_r0649_aluiar"
			url="jdbc:mysql://localhost/synote_linkeddata"
			//url = "jdbc:mysql://localhost/synote"
		}
	}
	databasetest {

		dataSource {
			//dbCreate="create-drop"
			//url = "jdbc:mysql://localhost/synote_new"
			url = "jdbc:mysql://localhost/synote"
		}
	}
}