<%@ page import="admineventos.Lugar" %>



<div class="fieldcontain ${hasErrors(bean: lugarInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="lugar.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${lugarInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: lugarInstance, field: 'eventos', 'error')} ">
	<label for="eventos">
		<g:message code="lugar.eventos.label" default="Eventos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${lugarInstance?.eventos?}" var="e">
    <li><g:link controller="evento" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="evento" action="create" params="['lugar.id': lugarInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'evento.label', default: 'Evento')])}</g:link>
</li>
</ul>


</div>

