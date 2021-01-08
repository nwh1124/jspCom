<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%
List<Map<String, Object>> listMap = (List<Map<String, Object>>)request.getAttribute("listMap");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=request.getAttribute("boardCode") %> Board</title>
</head>
<body>
	<h1>게시물 리스트</h1>
	<%
	for (Map<String, Object> memberMap : listMap) {
	%>
	<div>
		번호 :
		<%=memberMap.get("id")%>
		<br />
		작성일 :
		<%=memberMap.get("regDate")%>
		<br />
		제목 :
		<%=memberMap.get("title")%>
		<br />
		내용 :
		<%=memberMap.get("body")%>
		<hr />
	</div>
	<%
	}
	%>
</body>
</html>