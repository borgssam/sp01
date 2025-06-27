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
  
<script>/*
$(document).ready(function(){
	$("button").on("click", function(e){
		var formData = $("#frm");
		var btn = $(this).data("btn");
        if(btn === undefined){
            return;
        }
        e.preventDefault(); // 기본 이벤트 막기
        console.log("Clicked button: ", btn); // 확인용
		if(btn=='reply'){
			formData.attr("action","${cpath}/board/reply");
		} else if(btn=='modify'){
			formData.attr("action","${cpath}/board/modify");
		} else if(btn=='list') {
			formData.attr("action","${cpath}/board/list");
		}
		
		formData.submit();
	});
});*/

</script>
</head>
<body>
 
<div class="container">
  <h2>Spring MVC 게시판</h2>
  <div class="panel panel-default">
    <div class="panel-heading">게시판</div>
    <div class="panel-body">
    <table class="table table-boarderd">
    <tr>    <td>번호</td><td><input type="text" name="idx" value="${vo.idx }" readonly="readonly"/></td>    </tr>
    <tr>    <td>제목</td><td><input type="text" name="title" value="${vo.title }" readonly="readonly"/></td>    </tr>
    <tr>    <td>내용</td><td><textarea rows="10" name="content" class="form-control" readonly="readonly">${vo.content }</textarea></td>    </tr>
    <tr>    <td>작성자</td><td><input type="text" name="writer" value="${vo.writer }" readonly="readonly"/></td>    </tr>
    <tr> 
    <td colspan="2" style="text-align:center;">
   		<c:if test="${! empty mvo }">
    	<button data-btn="reply"  type="button" class="btn btn-primary btn-sm"  onclick="movePage('reply')">답글</button>
    	<button data-btn="modify" type="button" class="btn btn-success btn-sm"  onclick="movePage('modify')">수정</button> 	   		
   		</c:if>
   		
   		<c:if test="${ empty mvo }">
    	<button type="button" class="btn btn-primary btn-sm" disabled="disabled">답글</button>
    	<button type="button" class="btn btn-success btn-sm" disabled="disabled">수정</button>	
   		</c:if>
    	
    	<button data-btn="list" type="button" class="btn btn-info btn-sm" onclick="movePage('list')">목록</button>    
    </td>    
    </tr>
    </table>
<script>    
function movePage(url){
	var formData = $("#frm");
	formData.attr("action","${cpath}/board/"+url);	
	formData.submit();
}
</script>
    <form id="frm" method="get">
    	<input type="hidden" name="idx" value="<c:out value='${vo.idx }'/>" />
    </form>
    </div>
    <div class="panel-footer">스프2탄</div>
  </div>
</div>

</body>
</html>