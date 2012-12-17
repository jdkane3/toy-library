

<%@ page import="org.example.Manufacturer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'manufacturer.label', default: 'Manufacturer')}" />
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
            <g:hasErrors bean="${manufacturerInstance}">
            <div class="errors">
                <g:renderErrors bean="${manufacturerInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${manufacturerInstance?.id}" />
                <g:hiddenField name="version" value="${manufacturerInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="manufacturer.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: manufacturerInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${manufacturerInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="toys"><g:message code="manufacturer.toys.label" default="Toys" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: manufacturerInstance, field: 'toys', 'errors')}">
                                    
<ul>
<g:each in="${manufacturerInstance?.toys?}" var="t">
    <li><g:link controller="toy" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="toy" action="create" params="['manufacturer.id': manufacturerInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'toy.label', default: 'Toy')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="website"><g:message code="manufacturer.website.label" default="Website" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: manufacturerInstance, field: 'website', 'errors')}">
                                    <g:textField name="website" value="${manufacturerInstance?.website}" />
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
