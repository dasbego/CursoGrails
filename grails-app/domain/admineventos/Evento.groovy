package admineventos

class Evento {
    String nombre
    String descripcion
    Date fecha
    Double precio
    
    static belongsTo = [lugar: Lugar, responsable:User]
    static hasMany = [tareas:Tarea]
    
    static constraints = {
        nombre unique:true, blank:false, nullable : false, minSize:5
        descripcion blank:false, nullable : false, minSize:5
        precio min: 0d
    }
    
    String toString(){
        "${nombre}"
    }
}
