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
    <div class="panel-heading">게시판</div>
    <div class="panel-body">
    <form action="${cpath }/board/modify" method="post">
    <table class="table table-boarderd">
    <tr>    <td>번호</td><td><input type="text" name="idx" value="${vo.idx }" readonly="readonly" /></td>    </tr>
    <tr>    <td>제목</td><td><input type="text" name="title" value="${vo.title }" /></td>    </tr>
    <tr>    <td>내용</td><td><textarea rows="10" name="content" class="form-control" >${vo.content }</textarea></td>    </tr>
    <tr>    <td>작성자</td><td><input type="text" name="writer" value="${vo.writer }" /></td>    </tr>
    <tr> 
    <td colspan="2" style="text-align:center;">
        <c:if test="${ !empty mvo &&  mvo.memId eq vo.memId}">
    	<button type="submit" class="btn btn-primary btn-sm" >저장</button>
    	<button type="reset" class="btn btn-warning btn-sm" >취소</button>    	
    	<button type="button" class="btn btn-success btn-sm"  onclick="location.href='${cpath}/board/remove?idx=${vo.idx}'">삭제</button>    	
    	</c:if>
        <c:if test="${empty mvo || mvo.memId ne vo.memId}">
    	<button type="submit" class="btn btn-primary btn-sm" disabled="disabled">저장</button>
    	<button type="reset" class="btn btn-warning btn-sm" disabled="disabled" >취소</button>    	
    	<button type="button" class="btn btn-success btn-sm"  disabled="disabled" onclick="location.href='${cpath}/board/remove?idx=${vo.idx}'">삭제</button>    	
    	</c:if>
    	
    	<button type="button" class="btn btn-info btn-sm"     onclick="location.href='${cpath}/board/list'" >목록</button>    
    </td>    
    </tr>
    </table>
	</form>
    </div>
    <div class="panel-footer">스프2탄
    	${mvo.memId }/${vo.memId }</div>
  </div>
</div>

</body>
</html>