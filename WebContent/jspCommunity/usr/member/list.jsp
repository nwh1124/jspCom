<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
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
		<%=member.getId()%>
		<br />
		작성일 :
		<%=member.getRegDate()%>
		<br />
		아이디 :
		<%=member.getLoginId()%>
		<br />
		이름 :
		<%=member.getName()%>
		<br />
		닉네임 :
		<%=member.getNickname()%>
		<hr />
	</div>
	<%
	}
	%>
</body>
</html>