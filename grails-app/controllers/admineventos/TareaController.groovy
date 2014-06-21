package admineventos



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.converters.JSON
import grails.converters.XML

@Transactional(readOnly = true)
class TareaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Tarea.list(params), model:[tareaInstanceCount: Tarea.count()]
    }

    def show(Tarea tareaInstance) {
        respond tareaInstance
    }

    def create() {
        respond new Tarea(params)
    }

    @Transactional
    def save(Tarea tareaInstance) {
        if (tareaInstance == null) {
            notFound()
            return
        }

        if (tareaInstance.hasErrors()) {
            respond tareaInstance.errors, view:'create'
            return
        }

        tareaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tarea.label', default: 'Tarea'), tareaInstance.id])
                redirect tareaInstance
            }
            '*' { respond tareaInstance, [status: CREATED] }
        }
    }

    def edit(Tarea tareaInstance) {
        respond tareaInstance
    }

    @Transactional
    def update(Tarea tareaInstance) {
        if (tareaInstance == null) {
            notFound()
            return
        }

        if (tareaInstance.hasErrors()) {
            respond tareaInstance.errors, view:'edit'
            return
        }

        tareaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Tarea.label', default: 'Tarea'), tareaInstance.id])
                redirect tareaInstance
            }
            '*'{ respond tareaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Tarea tareaInstance) {

        if (tareaInstance == null) {
            notFound()
            return
        }

        tareaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Tarea.label', default: 'Tarea'), tareaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tarea.label', default: 'Tarea'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    
    def tareasEvento(){
        def tareas = []
        if(params?.status){
            tareas = Tarea.findAllByEventoAndStatus(Evento.get(params.id), params.status)
        }else{
            tareas = Tarea.findAllByEvento(Evento.get(params.id))
        }
        
        def resultado = [:]
        resultado['code'] = 'ok'
        resultado['msg'] = 'Tareas Enviadas'
        resultado['tareas'] = tareas
        
        withFormat{
            html {render resultado as JSON}
            json {render resultado as JSON}
            xml {render resultado as XML}
        }
    }
    
    @Transactional
    def actualizaStatus(){
        def tarea = Tarea.get(params?.id)
        tarea.status = params.nuevoStatus
        tarea.save(flush: true)
        render "Tarea actualizada correctamente"
    }
}
