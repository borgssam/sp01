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
  <script>
  	$(document).ready(
  		function(){
  			var result = "${result}";
  			checkModel(result);
  			
  			$("#regBtn").click(function() {
  				location.href="${cpath}/board/register";
  			});
  			
  			
  		}	  	
  	);
  	
  	function checkModel(result){
  		if(result == '') {return;}
  		if(parseInt(result)>0) {
  			//alert(result);
  			$(".modal-body").html("게시글 "+result+"번이 등록 되었습니다.");
  			$("#myModal").modal("show");
  		}
  	}
  	
  	function goMsg(){
  		alert("삭제된게시물입니다.");
  	}
  
  </script>
</head>
<body>
 
<div class="container">
  <h2>Spring MVC 게시판</h2>
  <div class="panel panel-default">
    <div class="panel-heading">
    	<c:if test="${empty mvo }">
    	
		<form class="form-inline" action="${cpath}/login/loginProcess" method="post">
		  <div class="form-group">
		    <label for="memId">ID:</label>
		    <input type="text" class="form-control" name="memId">
		  </div>
		  <div class="form-group">
		    <label for="memPwd">Password:</label>
		    <input type="password" class="form-control" name="memPwd">
		  </div>
		  <button type="submit" class="btn btn-default">로그인</button>
		</form>
    	</c:if>
    	<c:if test="${!empty mvo }">
		<form class="form-inline" action="${cpath}/login/logoutProcess" method="post">		  
		  <label for="memId">${mvo.memName }님 방문을 환영합니다.</label>		  
		  <button type="submit" class="btn btn-default">로그아웃</button>
		</form>
    	</c:if>
    
    
    </div>
    <div class="panel-body">
    <table class="table table-bordered table-hover">
    <thead>
    	<tr><th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
    	</tr>
    </thead>
    <tbody>
    <c:forEach var="vo" items="${list}">
    
    	<tr>
    		<td>${vo.idx }</td>
    		<td>   		    		
    		<c:forEach begin="0" end="${vo.board_level}">&nbsp;</c:forEach>
    		
    		<c:if test="${vo.board_available == 1 }">
    		<a href="${cpath}/board/get?idx=${vo.idx}">
    		<c:if test="${vo.board_level>0 }">[RE]</c:if> <c:out value="${vo.title }"/> </a>  
    		</c:if>
    		<c:if test="${vo.board_available == 0 }">
    		<a href="javascript:goMsg()">
    		<c:if test="${vo.board_level>0 }">[RE]</c:if> 삭제된 게시물입니다. </a>      		
    		</c:if>
    		   		
    		</td>
    		<td>${vo.writer }</td>
    		<td><fmt:formatDate value="${vo.indate}" pattern="yyyy-MM-dd"/></td>
    		<td>${vo.count }</td>
    	</tr>
    
    </c:forEach>
    <c:if test="${!empty mvo }">
		<tr>
		<td colspan="5"><button id="regBtn" class="btn btn-xs pull-right">글쓰기</button></td>
		</tr>
    </c:if>
    </tbody>
    </table>
    <!-- 모달 추가 -->
    
	<!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">알림</h4>
	      </div>
	      <div class="modal-body"></div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	
	  </div>
	</div>
	<!-- 모달끝 -->
    
    </div>
    <div class="panel-footer">스프2탄2</div>
  </div>
</div>

</body>
</html>