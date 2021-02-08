<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" trimDirectiveWhitespaces="true"%>
<%@ page import="com.myhome.util.Util"%>
<%
Object data = request.getAttribute("data");
response.getWriter().print(Util.getJsonText(data));
%>