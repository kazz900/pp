<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pp</title>
</head>
<body>
<!-- 웰컴 요청(첫페이지 접속)이 오면, main 페이지가 나가도록 요청을 전달함(forwarding)
	첫페이지 요청 url : http://domain/
	예 : http://localhost:8080/first
 -->
<%--  <%
 	RequestDispatcher view = request.getRequestDispatcher("main.do");
 	view.forward(request, response);
 %> --%>
 <jsp:forward page="sociallogin.do" />
</body>
</html>