<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Statement"%>
<%@include file="connect.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int id=Integer.parseInt(request.getParameter("id"));
String sql="";
Statement st=connection.createStatement();
String st1="Yes";
sql="UPDATE srequest SET status='"+st1+"' where id='"+id+"'";
st.executeUpdate(sql);
response.sendRedirect("ViewAllSearchRequest1.jsp");

%>

</body>
</html>