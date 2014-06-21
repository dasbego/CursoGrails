<%@ page import="admineventos.Evento" %>



<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="evento.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${eventoInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="evento.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${eventoInstance?.descripcion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'precio', 'error')} required">
	<label for="precio">
		<g:message code="evento.precio.label" default="Precio" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="precio" value="${fieldValue(bean: eventoInstance, field: 'precio')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="evento.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${eventoInstance?.fecha}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'lugar', 'error')} required">
	<label for="lugar">
		<g:message code="evento.lugar.label" default="Lugar" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="lugar" name="lugar.id" from="${admineventos.Lugar.list()}" optionKey="id" required="" value="${eventoInstance?.lugar?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'responsable', 'error')} required">
	<label for="responsable">
		<g:message code="evento.responsable.label" default="Responsable" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="responsable" name="responsable.id" from="${admineventos.Usuario.list()}" optionKey="id" required="" value="${eventoInstance?.responsable?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'tareas', 'error')} ">
	<label for="tareas">
		<g:message code="evento.tareas.label" default="Tareas" />
		
	</label>
	<g:select name="tareas" from="${admineventos.Tarea.list()}" multiple="multiple" optionKey="id" size="5" value="${eventoInstance?.tareas*.id}" class="many-to-many"/>

</div>

