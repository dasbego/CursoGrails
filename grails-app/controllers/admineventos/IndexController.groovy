package admineventos

class IndexController {

    def index() {
        def proximosTresEventos = Evento.list([sort:"fecha", order: "asc", max : 3])        
        def siguientesTresEventos = params?.lugar ? Evento.findAllByLugar(Lugar.get(params.lugar)) :  Evento.list([sort:"fecha"])
        def lugares = Lugar.list()
        println siguientesTresEventos
        [proximosTresEventos :proximosTresEventos, siguientesTresEventos :siguientesTresEventos,
            lugares:lugares,
            lugarEspecifico:params?.lugar
        ]
    }
    
    
    
}
