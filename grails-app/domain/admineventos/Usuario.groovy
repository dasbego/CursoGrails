package admineventos

class Usuario {
    String nombre
    String correo
    static hasMany = [tareas:Tarea, eventos:Evento]
    
    static constraints = {
        nombre unique:true, blank:false, nullable : false, minSize:5
        correo email:true
    }
    
    String toString(){
        "${nombre}"
    }
}
