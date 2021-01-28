<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>

	var alertMsg = `<%= request.getAttribute("alertMsg")%>`.trim();

	if( alertMsg ){
		alert(alertMsg);	
	}

	var alertMsg__tempPw = `<%= request.getAttribute("alertMsg__tempPw")%>`.trim();
	var alertMsg__tempPwN = 0;
	alertMsg__tempPwN = `<%= request.getAttribute("alertMsg__tempPwN")%>`.trim();
	
	if( alertMsg__tempPwN == "1" ){
		alert(alertMsg__tempPw);	
	}
	
	var historyBack = `<%= request.getAttribute("historyBack") %>` == `true`;

	if( historyBack ){
		history.back();
	}

	var replaceUrl = `<%= request.getAttribute("replaceUrl") %>`.trim();

	if( replaceUrl ){
		location.replace(replaceUrl);
	}
	
</script>