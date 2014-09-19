package admineventos

class Tarea {
    
    def mailService
    static transients = ['mailService']
    
    String nombre
    String status
    
    static belongsTo = [responsable:User , evento:Evento]
    static constraints = {
        nombre blank:false, nullable : false
        status inList:["Completada", "Pendiente", "Cancelada", "Progreso"]
    }
    
    String toString(){
        "${nombre} (${status})"
    }
    
    def afterUpdate(){
        if(status=='Completada'){
            mailService.sendMail {
                to "gbego91@gmail.com"
                subject "Actualización en tarea!"
                body "La tarea ${nombre} fue completada"
            }
        }
    }
}
