<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Spring MVC03/Main</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>  
  <script type="text/javascript">
  </script>
</head>
<body>



<div class="container">
  <jsp:include page="../common/header.jsp"/> 
  <h2>Spring MVC03</h2>
  <div class="panel panel-default">
    <div class="panel-heading">Heading</div>
    <div class="panel-body">Content</div>
    <div class="panel-footer">스피링1탄_인프런(홍길동)</div>
  </div>
</div>


</body>
</html>