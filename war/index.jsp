<%@ page import="com.jverrecchia.initializr.builder.mode.Mode,
				com.jverrecchia.initializr.builder.Const,
				com.jverrecchia.initializr.builder.modules.*,
				java.util.List" %>
<!doctype html> 
<html lang="en">
<head>
	<meta charset="utf-8" />
    <title>Initializr - Start your HTML5 project in 15 seconds!</title>
</head>
<body>
<form action="builder">
<input type="hidden" name="print" />

<h1><%= ((Mode)request.getAttribute("mode")).getName() %></h1>
<p><%= ((Mode)request.getAttribute("mode")).getFileName() + "-" + Const.version + ".zip" %></p>

<h1>Modules</h1>
<table>
<%
List<Module> modules = (List<Module>)request.getAttribute("modules");
for (Module currentModule : modules){
    String currentModuleIncompatibilities = "";
    if (currentModule.getIncompatibilities() != null){
    for (String currentIncompatibility : currentModule.getIncompatibilities()){
		currentModuleIncompatibilities += currentIncompatibility + ", ";
    }
    if (currentModule.getIncompatibilities().size() > 1)
	currentModuleIncompatibilities = currentModuleIncompatibilities.substring(0, currentModuleIncompatibilities.length() - 2);
    }
    
	out.print("<tr><td>" + currentModule.getName() + 
		"</td><td>" + currentModule.getId() + "</td><td>"
		+ currentModule.getAuthor() + "</td><td>" + currentModuleIncompatibilities + "</td></tr>");
}
%>
</table>

<br /><input type="submit" />
</form>
</body>
</html>
