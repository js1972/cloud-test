<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Properties"%>
<%@page import="java.util.TreeSet"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>spy</title>
<!-- Bootstrap CSS -->
<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.2.1/css/bootstrap-combined.min.css" rel="stylesheet">
<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css">
</head>
<style type="text/css">
body {
	padding: 40px;
}
</style>
<body>
	<table id="properties" class="table table-striped table-bordered">
		<caption>java system properties</caption>
		<thead>
			<tr>
				<th>key</th>
				<th>value</th>
			</tr>
		</thead>
		<tbody>
			<%
				Properties properties = System.getProperties();
				for (String key : new TreeSet<String>(
						properties.stringPropertyNames())) {
			%>
			<tr>
				<td><%=key%></td>
				<td><%=properties.getProperty(key)%></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
</body>
</html>