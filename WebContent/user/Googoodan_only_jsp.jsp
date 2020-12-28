<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Googoodan_only_jsp</title>
</head>
<body>
<%
int dan;
int limit;

dan = request.getParameter("dan") == null ? 1 : Integer.parseInt(request.getParameter("dan"));
limit = request.getParameter("limit") == null ? 9 : Integer.parseInt(request.getParameter("limit"));
%>
<h1>구구단 <%=dan %>단</h1>
<%
for(int i = 1; i <= limit; i++){
%>
<%=dan %> * <%=i %> = <%=dan * i %><br>
<%	
}
%>
</body>
</html>