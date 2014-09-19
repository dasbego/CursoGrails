package admineventos

import org.springframework.transaction.annotation.Transactional
import grails.plugin.springsecurity.annotation.Secured

class TestingController {

    @Secured(['ROLE_ADMIN'])
    def index() { 
        render "bien!"
    }
    
    def otroMetodo(){
        render "Estamos dentro de otro método"
    }
    
    def otroMetodoAdmin(){
        render "otro metodo Admin"
    }
    
    @Secured(["hasRole('ROLE_USER') and !hasRole('ROLE_ADMIN')"])
    def metodoSoloUsuarios(){
        render "Solo usuarios logueados pueden ver este metodo"
    }
    
    
    def pruebaNoTransaccion(){
        def usuario = new User([nombre:"Luis", correo:"usuarioFalso@gmail.com"])
        if(!usuario.save()){
            render "Ocurrio un error"
        }
        def lugar = new Lugar(nombre: "Centro Social")
        lugar.save()
        render "Prueba No transacccional"
        
    }
    @Transactional
    def pruebaTransaccional()
    {
        def usuario = new User([nombre:"Ana", correo:"usuarioFalso@gmail.com"])
        if(!usuario.save()){    
            render "Ocurrio un error"
        }
        def lugar = new Lugar(nombre: "LugarDummie2")
        lugar.save()
        render "Prueba No transacccional"
        
    }
    
    def parametroInteligente(User usuarioInstance)
    {
        render usuarioInstance
        
    }
    
    def formatosRetorno(){
        withFormat()
        {
            html {render "Esto es HTML"}
            json{ render "Esto es formato JSON"}
            xml{ render "Esto es formato XML"}
        }
    }
    
    def pruebaMail(){
        sendMail {
            to "gbego91@gmail.com"
            subject "Hola desde Grails App"
            body "Funcionando! :) "
        }
        render "prueba de correo"
    }
}
