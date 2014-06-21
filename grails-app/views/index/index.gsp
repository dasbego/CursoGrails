<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        
        <meta name="layout" content="frontend">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sample title</title>
        
        <link rel = "stylesheet" href="http://getbootstrap.com/examples/carousel/carousel.css"></link>
                
    </head>
    <body>
        <!-- Carousel
    ================================================== -->
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
          <!-- Indicators -->
            <ol class="carousel-indicators">
                <g:each var="i" in="${0..<proximosTresEventos.size()}"  >
                    <li data-target="#myCarousel" data-slide-to="${i}" class="${i==0 ? "active": ""}"></li>           
                </g:each>
            </ol>
            
            <div class="carousel-inner">                
                
                <g:set var="num" value="${0}"/>
                
                <g:each in="${proximosTresEventos}" var="evento" >
                    <div class="item ${(num==0) ? "active": ""}">
                     
                        <div class="container">
                            <div class="carousel-caption">
                                <h1  class="alert alert-success">${evento.nombre}</h1>
                                <p>${evento.descripcion}</p>
                                <p><prettytime:display date="${evento.fecha}" /></p>
                                
                                <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
                            </div>
                        </div>
                    </div>
                <g:set var="num" value="${num+1}"/>
                
                </g:each >
            </div>
            <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
        </div><!-- /.carousel -->
        
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <g:each in="${lugares}" var="lugar">
                        <span class="label label-${lugarEspecifico==lugar.id.toString() ? "primary" : "default"}">
                            <a href="${createLink(action:"index", params:[lugar:lugar.id])}" style="color:#ffffff">${lugar.nombre} (${lugar.eventos.size()})
                            </a>
                        </span>&nbsp;
                    </g:each>
                    <br/>
                    <br/>   
                </div>
            </div>
            <div class="row">
                <g:each in="${siguientesTresEventos}" var="evento">
                <div class="col-xs-4" style="height: 120px">
                    <b>${evento.nombre}</b> <br />
                    ${evento.descripcion} <br/>
                    ${evento.lugar} <br/>
                    ${evento.precio}
                </div>
                </g:each>
            </div>
        </div>
        
    </body>
</html>
