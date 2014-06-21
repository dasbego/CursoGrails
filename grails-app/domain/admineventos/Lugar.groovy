package admineventos

class Lugar {
    String nombre
    static hasMany =[eventos:Evento]
    static constraints = {
        nombre unique:true, blank:false, nullable : false, minSize:5
    }
    
    String toString(){
        "${nombre}"
    }
}
