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
                        <li><a href="#" onclick="cargaTareas(${evento.id})"> ${evento.nombre}</a></li>
                    </g:each>
                    </ul>
                </div>
                <div class="col-xs-9">
                    <h3>Tareas</h3>
                    <div id="listaTareas">Lista vacía.</div>
                    <hr
                    <sec:ifAllGranted roles="ROLE_ADMIN">
                        <input type="text" id="nuevaTarea" placeholder="Nueva Tarea"/>
                    </sec:ifAllGranted>
                    <sec:ifNotGranted roles="ROLE_ADMIN">
                        <p>No está autorizado para agregar más tareas</p>   
                    </sec:ifNotGranted>
                </div>
            </div>
        </div>
        
        
        <script>
 //La funcion ready permite acceder a elementos cuando todo el DOM
                //Esta completamente cargado
                $(document).ready(function(){
                    cargaTareas(1);
                     
                });
                
                function cargaTareas(idEvento){
                    $.ajax({
                       url:"${createLink(controller: 'tarea', action: 'tareasEvento')}?id="+idEvento
                     }).done(function(listaTareas){

                         if(listaTareas.code=='ok'){
                                
                             // console.log("Mensaje:"+listaTareas.msg);
                              $('#listaTareas').html('');

                              $(listaTareas.tareas).each(function(key,value){
                                  console.log(value.nombre);                                
                                 // $('#listaTareas').append('<p>' + value.nombre + '</p>');
                                  renderTarea(value);
                              });
                              $('#listaTareas').append('<p>' + listaTareas.tareas.length+ ' tareas encontradas </p>');
                         }
                       });
                }
                
                function renderTarea(tarea)
                {
                    
                    var html = '<div>';
                    html += '<select onchange="cambiaStatusTarea(' + tarea.id +',this)">';
                    html += '<option '+estaSeleccionada('Completada', tarea.status)+'>Completada</option>';
                    html += '<option '+estaSeleccionada('Pendiente', tarea.status)+'>Pendiente</option>';
                    html += '<option '+estaSeleccionada('Progreso', tarea.status)+'>Progreso</option>';
                    html += '<option '+estaSeleccionada('Cancelada', tarea.status)+'>Cancelada</option>';
                    html += '</select>';
                    html += tarea.nombre;
                    html += '</div>';
                    $('#listaTareas').append(html);
                }
                
                function estaSeleccionada(status1, status2)
                {
                    if(status1 == status2)
                        return 'selected';
                    return '';
                }
                
                function cambiaStatusTarea(tareaId, campoSelect)
                {
                    //alert('El nuevo estatus de la tarea '+tareaId+' es. '+ $(campoSelect).val());
                    $.ajax({
                        url: '${createLink(controller: 'tarea', action: 'actualizaStatus')}',
                        data: {id: tareaId, nuevoStatus: $(campoSelect).val()}
                    }).success(function(respuesta){
                        alert(respuesta);
                    }).fail( function(){
                        alert('Ocurrio un error en la actualizacion');
                    });
                }
        </script>
        
    </body>
</html>