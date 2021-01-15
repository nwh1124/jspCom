<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.myhome.jspCommunity.dto.Member" %>
<%
List<Member> members = (List<Member>)request.getAttribute("members");
String pageTitle = "회원 목록"; 
%>
<%@ include file="../../part/head.jspf" %>

<h1><%=pageTitle%></h1>
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
	
<%@ include file="../../part/foot.jspf" %>