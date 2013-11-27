<%-- 
    Document   : dbconfig
    Created on : Nov 27, 2013, 7:44:48 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>OpenNMS Asset Management:Node</title>
<link rel="stylesheet" type="text/css" href="styles/styleSheet.css">
</head>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<body>
<jsp:include page="styles/header.html" />
<f:view>
<h:form >
<h:messages showDetail="true" />
<h:panelGrid id = "locationinfo" columns = "2" >
<f:facet name = "header">
<h:outputText value = "Database Configuration" style = "font-weight: bold" />
</f:facet >
<h:outputLabel for = "driver" value = "Connection Driver Class: " />
<h:inputText id = "driver" title = "Rack" value = "#{dbconfig.connectionDriverClass}" />
<h:outputLabel for = "url" value = "Connection URL: " />
<h:inputText id = "url" title = "Slot" value = "#{dbconfig.connectionURL}" />
<h:outputLabel for = "user" value = "Connection User Name: " />
<h:inputText id = "user" title = "Region" value = "#{dbconfig.connectionUsername}" />
<h:outputLabel for = "password" value = "Connection User Password: " />
<h:inputText id = "password" title = "Department" value = "#{dbconfig.connectionPassword}" />
<h:outputLabel for = "division" value = "Connection Dialect: " />
<h:inputText id = "division" title = "Division" value = "#{dbconfig.dialect}" />
</h:panelGrid>
<p><hr>
<h:commandButton value="Continue" action="#{dbconfig.save}"/>
<h:commandButton value="Reset" action="#{dbconfig.cancel}"/>
</h:form>
</f:view>
</body>
</html> 