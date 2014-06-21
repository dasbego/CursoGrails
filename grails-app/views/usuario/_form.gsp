<%@ page import="admineventos.Usuario" %>



<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="usuario.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${usuarioInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'correo', 'error')} required">
	<label for="correo">
		<g:message code="usuario.correo.label" default="Correo" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="correo" required="" value="${usuarioInstance?.correo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'eventos', 'error')} ">
	<label for="eventos">
		<g:message code="usuario.eventos.label" default="Eventos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${usuarioInstance?.eventos?}" var="e">
    <li><g:link controller="evento" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="evento" action="create" params="['usuario.id': usuarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'evento.label', default: 'Evento')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'tareas', 'error')} ">
	<label for="tareas">
		<g:message code="usuario.tareas.label" default="Tareas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${usuarioInstance?.tareas?}" var="t">
    <li><g:link controller="tarea" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="tarea" action="create" params="['usuario.id': usuarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'tarea.label', default: 'Tarea')])}</g:link>
</li>
</ul>


</div>

