package admineventos

import org.springframework.transaction.annotation.Transactional

class TestingController {

    def index() { 
        render "bien!"
        def parametros = [max:10, offset:1, sort:"nombre"]
        println Usuario.list(parametros)
    }
    
    def pruebaNoTransaccion(){
        def usuario = new Usuario([nombre:"Luis", correo:"usuarioFalso@gmail.com"])
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
        def usuario = new Usuario([nombre:"Ana", correo:"usuarioFalso@gmail.com"])
        if(!usuario.save()){    
            render "Ocurrio un error"
        }
        def lugar = new Lugar(nombre: "LugarDummie2")
        lugar.save()
        render "Prueba No transacccional"
        
    }
    
    def parametroInteligente(Usuario usuarioInstance)
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
