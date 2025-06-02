<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<title>Spring MVC03/Main</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
	
	function registerCheck() {
		var memID = $("#memID").val();
		// alert("${contextPath}");  
		//	alert(memID);
		$.ajax({
			url : "${contextPath}/memRegisterCheck.do",
			type : "get",
			dataType : "text",
			data : {
				"memID" : memID
			},
			success : function(result) {
				//중복체크(1:사용가능, 0:사용불가)
				//alert(result);
				if (result == 1) {
					$("#checkMessage").html("사용가능");
					$("#checkType")
							.attr("class", "modal-content panel-success");
				} else {
					$("#checkMessage").html("사용불가");
					$("#checkType")
							.attr("class", "modal-content panel-warning");
				}
				$("#myModal").modal("show");
			},
			error : function() {
				alert("error");
			}
		});
	}
	function check_pwd(){
		pwd1 = $("#memPassword1").val();
		pwd2 = $("#memPassword2").val();
		if( pwd1 == pwd2) {
			$("#pwd_msg").html("");
			$("#memPassword").val(pwd1);
		} else {
			$("#pwd_msg").html("비밀번호 불일치");
			$("#memPassword").val("");
		}
	}
	
	function goInsert(){
		var memAge = $('#memAge').val();
		if(memAge==null || memAge=="" || memAge == 0){
			alert("나이를 정확하게 입력하세요");
			return false;
		}
		document.frm.submit();
	}
</script>
</head>
<body>
	<div class="container">
		<jsp:include page="../common/header.jsp" />
		<h2>Spring MVC03</h2>
		<div class="panel panel-default">
			<div class="panel-heading">회원가입</div>
			<div class="panel-body">
				<form name="frm" action="${contextPath}/memRegister.do" method="post" >
					<table class="table table-bordered"
						style="text-align: center; border: 1px solid #dddddd;">
						<tr>
							<td style="width: 120px; vertical-align: middle">아이디</td>
							<td><input id="memID" name="memID" class="form-control"
								type="text" maxlength="20" placeholder="아이디를 입력하세요" /></td>
							<td style="width: 120px; vertical-align: middle">
								<button type="button" class="btn btn-primary btn-sm"
									onclick="registerCheck()">중복확인</button>
							</td>
						</tr>
						<tr>
							<td style="width: 120px; vertical-align: middle">비밀번호</td>
							<td colspan="2">
								<input id="memPassword"  name = "memPassword" type="hidden"/>
								<input id="memPassword1" name = "memPassword1"
								class="form-control" type="password" maxlength="20"
								placeholder="비밀번호를 입력하세요" onkeyup = "check_pwd()"  />
							</td>

						</tr>
						<tr>
							<td style="width: 120px; vertical-align: middle">비밀번호확인</td>
							<td colspan="2"><input id="memPassword2" name="memPassword2"
								class="form-control" type="password" maxlength="20"
								placeholder="비밀번호를 확인하세요" onkeyup = "check_pwd()" /></td>

						</tr>
						<tr>
							<td style="width: 120px; vertical-align: middle">이름</td>
							<td colspan="2"><input id="memName" name="memName"
								class="form-control" type="text" maxlength="20"
								placeholder="이름을 입력하세요" /></td>
						</tr>
						<tr>
							<td style="width: 120px; vertical-align: middle">나이</td>
							<td colspan="2"><input id="memAge" name="memAge"
								class="form-control" type="text" maxlength="20"
								placeholder="나이를 입력하세요" /></td>
						</tr>
						<tr>
							<td style="width: 120px; vertical-align: middle">성별</td>
							<td colspan="2">
								<div class="form-group"
									style="text-align: center; margin: 0 auto;">
									<div class="btn-group" data-toggle="buttons">
										<!-- 남자 버튼: 기본 선택된 상태 -->
										<label class="btn btn-primary active"> <input
											id="memGender" name="memGender" type="radio" name="gender"
											autocomplete="off" value="남자" checked />남자
										</label>

										<!-- 여자 버튼 -->
										<label class="btn btn-primary"> <input id="memGender"
											name="memGender" type="radio" name="gender"
											autocomplete="off" value="여자" />여자
										</label>
									</div>

								</div>
							</td>
						</tr>
						<tr>
							<td style="width: 120px; vertical-align: middle">이메일</td>
							<td colspan="2"><input id="memEmail" name="memEmail"
								class="form-control" type="text" maxlength="20"
								placeholder="이메일을 입력하세요" /></td>
						</tr>
						<tr>
							<td colspan="3" style="text-align: left;">
							<span id="pwd_msg" style="color:red;">1</span>
							<input type="button" value="등록" class="btn btn-primary btn-sm pull-right" onclick="goInsert();" />
							</td>
						</tr>

					</table>
				</form>
			</div>
			<div class="panel-footer">스피링1탄_인프런(홍길동)</div>
		</div>
	</div>
	<!-- ----다이알로그 모달창 시작-------- -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div id="checkType" class="modal-content">
				<div class="modal-header panel-heading">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">메시지 확인</h4>
				</div>
				<div class="modal-body">
					<p id="checkMessage"></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- ----다이알로그 모달창 끝  -------- -->
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