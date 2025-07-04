<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
 
<div class="container">
  <h2>Spring MVC 게시판</h2>
  <div class="panel panel-default">
    <div class="panel-heading">게시판(글쓰기)</div>
    <div class="panel-body">
    <form action="${cpath}/board/register" method="post">
    	<input type="hidden" name="memId" value="${mvo.memId}"/> 
    	<div class="form-group">
    		<label>제목</label> 
    		<input type="text" name="title" class="form-control"/>
    	</div>
    	<div class="form-group">
    		<label>내용</label>
    		<textarea rows="10" name="content" class="form-control"></textarea>
    	</div>
    	<div class="form-group">
    		<label>작성자</label> 
    		<input type="text" name="writer" class="form-control" value="${mvo.memName }" readonly="readonly"/>
    	</div>
    	<button type="submit" class="btn btn-default btn-sm">등록</button>
    	<button type="reset"  class="btn btn-default btn-sm">취소</button>
    </form>
    </div>
    <div class="panel-footer">스프2탄</div>
  </div>
</div>

</body>
</html>