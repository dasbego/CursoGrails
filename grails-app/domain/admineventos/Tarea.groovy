package admineventos

class Tarea {
    String nombre
    String status
    
    static belongsTo = [responsable:Usuario , evento:Evento]
    static constraints = {
        nombre blank:false, nullable : false
        status inList:["Completada", "Pendiente", "Cancelada", "Progreso"]
    }
    
    String toString(){
        "${nombre} (${status})"
    }
}
