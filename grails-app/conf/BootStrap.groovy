import admineventos.*

class BootStrap {

    def init = { servletContext ->
        
        def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: (new Role(authority: 'ROLE_ADMIN').save(flush: true))
        def admin = (User.findByUsername("memo.bego"))
        if(!admin){
            admin = new User(
                username: "memo.bego",
                password: "grails"
            ).save(flush: true)
        }
        
        def usuario = (User.findByUsername("usuario"))
        def usuarioRole = Role.findByAuthority("ROLE_USER")?:
            (new Role(authority: "ROLE_USER").save(flush:true))
        if(!usuario){
            usuario = new User(
                username: "usuario",
                password: "grails"
            ).save(flush: true)
        }
        
        if(!usuario.authorities.contains(usuarioRole)){
                UserRole.create(usuario, usuarioRole, true)
        }
        
        //Valieda qeue el rol de admin este asignado al usuario
        if(!admin.authorities.contains(adminRole)){
            UserRole.create(admin, adminRole, true)
        }
        
        def otroUsuario = (User.findByUsername("otrousuario"))
        if(!otroUsuario){
            otroUsuario = new User(
                username: "otrousuario",
                password: "grails"
            )
            if(!otroUsuario.validate()) {
                println "Hay un error al crear el usuario"
                println otroUsuario.errors.allErrors
            } else {
                otroUsuario.save(flush: true)
            }
        }
        
        if(!otroUsuario.authorities.contains(usuarioRole)){
                UserRole.create(otroUsuario, usuarioRole, true)
        } 
        if(!otroUsuario.authorities.contains(adminRole)){
                UserRole.create(otroUsuario, adminRole, true)
        }
        
        if(!Requestmap.findByUrl('/')) {
            for (String url in [
                  '/', '/index', '/index.gsp', '/**/favicon.ico',
                  '/**/js/**', '/**/css/**', '/**/images/**',
                  '/login', '/login.*', '/login/*',
                  '/logout', '/logout.*', '/logout/*']) {
               new Requestmap(url: url, configAttribute: 'permitAll').save()
            }            
        }
        
        if(!Requestmap.findByUrl('/requestmap/**')){
            new Requestmap(url: '/requestmap/**', configAttribute: 'ROLE_ADMIN').save(flush: true)
        }

    }
    def destroy = {
    }
}
