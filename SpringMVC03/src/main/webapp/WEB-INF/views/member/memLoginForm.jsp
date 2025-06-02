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
	$(document).ready(
			function(){
				if(${!empty msgType}){
					if(${msgType eq "실패메시지"}){
						$("#messageType").attr("class", "modal-content panel-warning");
					}

					$("#messageModal").modal("show");
				}		
			}		
		);  
  </script>
</head>

<body>
	<div class="container">
	<jsp:include page="../common/header.jsp"/> 
	  <h2>Spring MVC03</h2>
	  <div class="panel panel-default">
	    <div class="panel-heading">로그인폼</div>
	    <div class="panel-body">
			<form name="frm" action="${contextPath}/memLogin.do" method="post" >
				<table class="table table-bordered"
					style="text-align: center; border: 1px solid #dddddd;">
					<tr>
						<td style="width: 120px; vertical-align: middle">아이디</td>
						<td>
						<input id="memID" name="memID" class="form-control"
							type="text" maxlength="20" placeholder="아이디를 입력하세요" />
						</td>
					</tr>
					<tr>
						<td style="width: 120px; vertical-align: middle">비밀번호</td>
						<td >						
							<input id="memPassword" name = "memPassword"
							class="form-control" type="password" maxlength="20"
							placeholder="비밀번호를 입력하세요" onkeyup = "check_pwd()"  />
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: left;">
						<span id="pwd_msg" style="color:red;"></span>
						<input type="submit" value="로그인" class="btn btn-primary btn-sm pull-right" onclick="goInsert();" />
						</td>
					</tr>
	
				</table>
			</form>
				
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