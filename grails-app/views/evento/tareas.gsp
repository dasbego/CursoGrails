<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tareas</title>
        <meta name="layout" content="frontend">
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-xs-3">
                    <h3>Eventos</h3>
                    <ul>
                    <g:each in="${eventos}" var="evento">
                        <li>${evento.nombre}</li>
                    </g:each>
                    </ul>
                </div>
                <div class="col-xs-9">
                    <h3>Tareas</h3>
                    <div id="listaTareas">Lista vacía.</div>
                    <input type="text" id="nuevaTarea" />
                </div>
            </div>
        </div>
        
        <p>${createLink()}</p>
        
        <script>
            //la funcion ready me permite acceder a elementos cuando todo el DOM
            //esta completamente cargado
            $(document).ready(function(){
                $.ajax({
                    url: "${createLink(controller: 'tarea', action: 'tareasEvento')}?id=1"
                }).done(function(listaTareas){
                    console.log(listaTareas);
                    $(listaTareas).each(function(key, value){
                        console.log(value);
                    });
                });
            });
        </script>
        
    </body>
</html>