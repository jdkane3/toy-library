
<%@ page import="org.example.Toy" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'toy.label', default: 'Toy')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'toy.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'toy.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="price" title="${message(code: 'toy.price.label', default: 'Price')}" />
                        
                            <th><g:message code="toy.manufacturer.label" default="Manufacturer" /></th>
                        
                            <g:sortableColumn property="minAge" title="${message(code: 'toy.minAge.label', default: 'Min Age')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${toyInstanceList}" status="i" var="toyInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${toyInstance.id}">${fieldValue(bean: toyInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: toyInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: toyInstance, field: "price")}</td>
                        
                            <td>${fieldValue(bean: toyInstance, field: "manufacturer")}</td>
                        
                            <td>${fieldValue(bean: toyInstance, field: "minAge")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${toyInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
