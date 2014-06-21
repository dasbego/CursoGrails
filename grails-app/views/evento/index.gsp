
<%@ page import="admineventos.Evento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'evento.label', default: 'Evento')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-evento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-evento" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'evento.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'evento.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="precio" title="${message(code: 'evento.precio.label', default: 'Precio')}" />
					
						<g:sortableColumn property="fecha" title="${message(code: 'evento.fecha.label', default: 'Fecha')}" />
					
						<th><g:message code="evento.lugar.label" default="Lugar" /></th>
					
						<th><g:message code="evento.responsable.label" default="Responsable" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${eventoInstanceList}" status="i" var="eventoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${eventoInstance.id}">${fieldValue(bean: eventoInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: eventoInstance, field: "descripcion")}</td>
					
						<td>${fieldValue(bean: eventoInstance, field: "precio")}</td>
					
						<td><g:formatDate date="${eventoInstance.fecha}" /></td>
					
						<td>${fieldValue(bean: eventoInstance, field: "lugar")}</td>
					
						<td>${fieldValue(bean: eventoInstance, field: "responsable")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${eventoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
