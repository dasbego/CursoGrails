<%@ page import="admineventos.Tarea" %>



<div class="fieldcontain ${hasErrors(bean: tareaInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="tarea.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${tareaInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tareaInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="tarea.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${tareaInstance.constraints.status.inList}" required="" value="${tareaInstance?.status}" valueMessagePrefix="tarea.status"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tareaInstance, field: 'evento', 'error')} required">
	<label for="evento">
		<g:message code="tarea.evento.label" default="Evento" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="evento" name="evento.id" from="${admineventos.Evento.list()}" optionKey="id" required="" value="${tareaInstance?.evento?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tareaInstance, field: 'responsable', 'error')} required">
	<label for="responsable">
		<g:message code="tarea.responsable.label" default="Responsable" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="responsable" name="responsable.id" from="${admineventos.Usuario.list()}" optionKey="id" required="" value="${tareaInstance?.responsable?.id}" class="many-to-one"/>

</div>

