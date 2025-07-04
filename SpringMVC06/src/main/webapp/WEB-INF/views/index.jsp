<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script>
	$(document).ready(
		function(){
			if(${!empty msgType}){
				if(${msgType eq "실패메시지"}){
					$("#messageType").attr("class", "modal-content panel-warning");
				} else {
					$("#messageType").attr("class", "modal-content panel-success");
				}

				$("#messageModal").modal("show");
			}		
		}		
	);  
  </script>
</head>
<body>

<div class="container"><jsp:include page="common/header.jsp"/>

  <c:if test="${empty mvo}"></c:if>  

  

  <div class="panel panel-default">
  	<div><img src="${contextPath }/resources/images/main.png" style="width:100%;"/></div>
    <div class="panel-body">
		<ul class="nav nav-tabs">
		  <li class="active"><a data-toggle="tab" href="#home">Home</a></li>
		  <li><a data-toggle="tab" href="#menu1">게시판</a></li>
		  <li><a data-toggle="tab" href="#menu2">공지사항</a></li>
		</ul>
		
		<div class="tab-content">
		  <div id="home" class="tab-pane fade in active">
		    <h3>HOME</h3>
		    <p>Some content.</p>
		  </div>
		  <div id="menu1" class="tab-pane fade">
		    <h3>게시판</h3>
		    <p>Some content in menu 1.</p>
		  </div>
		  <div id="menu2" class="tab-pane fade">
		    <h3>공지사항</h3>
		    <p>Some content in menu 2.</p>
		  </div>
		</div>

	</div>
    <div class="panel-footer">스피링1탄_인프런(홍길동)</div>
  </div>
</div>

<!-- ----다이알로그 모달창 시작-실패메시지- -->
<div id="messageModal" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div id="messageType" class="modal-content">
			<div class="modal-header panel-heading">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">${msgType}</h4>
			</div>
			<div class="modal-body">
				<p id="checkMessage">${msg}</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- ----다이알로그 모달창 끝  -------- -->
</body>
</html>
