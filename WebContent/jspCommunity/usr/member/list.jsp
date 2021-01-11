<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.myhome.jspCommunity.dto.Member" %>
<%
List<Member> members = (List<Member>)request.getAttribute("members");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>
</head>
<body>
	<h1>회원 리스트</h1>
	<%
	for (Member member : members) {
	%>
	<div>
		번호 :
		<%=member.id%>
		<br />
		작성일 :
		<%=member.regDate%>
		<br />
		아이디 :
		<%=member.loginId%>
		<br />
		이름 :
		<%=member.name%>
		<br />
		닉네임 :
		<%=member.nickname%>
		<hr />
	</div>
	<%
	}
	%>
</body>
</html>