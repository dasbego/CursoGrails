import org.codehaus.groovy.grails.orm.hibernate.cfg.GrailsAnnotationConfiguration

dataSource {
    driverClassName = "com.mysql.jdbc.Driver"
    configClass = GrailsAnnotationConfiguration.class
    pooled = true
    dialect = 'org.hibernate.dialect.MySQL5InnoDBDialect'
}

hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}

// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop','update'
            url = "jdbc:mysql://localhost/adminEventos"
            username = "root"
            password = "bego11"
        }
    }

    production {
        dataSource {
        }
    }
}