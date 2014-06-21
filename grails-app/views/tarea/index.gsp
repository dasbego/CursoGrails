
<%@ page import="admineventos.Tarea" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tarea.label', default: 'Tarea')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-tarea" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-tarea" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'tarea.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'tarea.status.label', default: 'Status')}" />
					
						<th><g:message code="tarea.evento.label" default="Evento" /></th>
					
						<th><g:message code="tarea.responsable.label" default="Responsable" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tareaInstanceList}" status="i" var="tareaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tareaInstance.id}">${fieldValue(bean: tareaInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: tareaInstance, field: "status")}</td>
					
						<td>${fieldValue(bean: tareaInstance, field: "evento")}</td>
					
						<td>${fieldValue(bean: tareaInstance, field: "responsable")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tareaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
