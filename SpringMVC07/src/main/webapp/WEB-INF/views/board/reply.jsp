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
    <form action="${cpath }/board/reply" method="post">
    <table class="table table-boarderd">
    <tr>    <td>번호</td><td><input type="text" name="idx" value="${vo.idx }" readonly="readonly" /></td>    </tr>
    <tr>    <td>제목</td><td><input type="text" name="title" value="${vo.title }"  /></td>    </tr>
    <tr>    <td>내용</td><td><textarea rows="10" name="content2" class="form-control" readonly="readonly">${vo.content }</textarea></td></tr>
    <tr>    <td>답변</td><td><textarea rows="10" name="content" class="form-control" ></textarea></td></tr>
    
    <tr>    <td>작성자</td><td>${vo.writer }<input type="text" name="writer" value="${mvo.memName }" />
    <input type="text" name="memId" value="${mvo.memId}" />
    
    </td>    </tr>
    <tr> 
    <td colspan="2" style="text-align:center;">
    ${ mvo.memId }/${  vo.memId}
        <c:if test="${ !empty mvo }">
    		<button type="submit" class="btn btn-primary btn-sm" >답변</button>
    		<button type="reset" class="btn btn-warning btn-sm" >취소</button>    	    	
    	</c:if>
        <c:if test="${empty mvo}">
    		<button type="submit" class="btn btn-primary btn-sm" disabled="disabled">답변</button>
    		<button type="reset"  class="btn btn-warning btn-sm" disabled="disabled">취소</button>    		
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