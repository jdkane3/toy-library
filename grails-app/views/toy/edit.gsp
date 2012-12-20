

<%@ page import="org.example.Toy" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'toy.label', default: 'Toy')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${toyInstance}">
            <div class="errors">
                <g:renderErrors bean="${toyInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${toyInstance?.id}" />
                <g:hiddenField name="version" value="${toyInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="toy.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: toyInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${toyInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="price"><g:message code="toy.price.label" default="Price" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: toyInstance, field: 'price', 'errors')}">
                                    <g:textField name="price" value="${fieldValue(bean: toyInstance, field: 'price')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="manufacturer"><g:message code="toy.manufacturer.label" default="Manufacturer" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: toyInstance, field: 'manufacturer', 'errors')}">
                                    <g:select name="manufacturer.id" from="${org.example.Manufacturer.list()}" optionKey="id" optionValue="name" value="${toyInstance?.manufacturer?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="minAge"><g:message code="toy.minAge.label" default="Min Age" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: toyInstance, field: 'minAge', 'errors')}">
                                    <g:textField name="minAge" value="${toyInstance?.minAge}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
