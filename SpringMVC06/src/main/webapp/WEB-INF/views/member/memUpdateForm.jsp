<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<title>Spring MVC06/Update</title>
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
	
	function goUpdate(){
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
		<h2>Spring MVC06</h2>
		<div class="panel panel-default">
			<div class="panel-heading">회원정보수정양식</div>
			<div class="panel-body">
				<form name="frm" action="${contextPath}/memUpdate.do" method="post" >
					<table class="table table-bordered"
						style="text-align: center; border: 1px solid #dddddd;">
						<tr>
							<td style="width: 120px; vertical-align: middle">아이디</td>
							<td>${mvo.memID}<input type="hidden" id="memID" name="memID" value="${mvo.memID}" /></td>

						</tr>
						<tr>
							<td style="width: 120px; vertical-align: middle">비밀번호</td>
							<td colspan="2">
							<!-- value="${mvo.memPassword} -->
								<input id="memPassword"  name = "memPassword" type="hidden" "/>
								<input id="memPassword1" name = "memPassword1"
								class="form-control" type="password" maxlength="20"
								placeholder="비밀번호를 입력하세요" onkeyup = "check_pwd()" />
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
								placeholder="이름을 입력하세요" value="${mvo.memName }" /></td>
						</tr>
						<tr>
							<td style="width: 120px; vertical-align: middle">나이</td>
							<td colspan="2"><input id="memAge" name="memAge"
								class="form-control" type="text" maxlength="20"
								placeholder="나이를 입력하세요" value="${mvo.memAge }" /></td>
						</tr>
						<tr>
							<td style="width: 120px; vertical-align: middle">성별</td>
							<td colspan="2">
								<div class="form-group"
									style="text-align: center; margin: 0 auto;">
									<div class="btn-group" data-toggle="buttons">
										<!-- 남자 버튼: 기본 선택된 상태 -->
										<label class="btn btn-primary <c:if test="${mvo.memGender eq '남자'}">active</c:if> " > 
											<input id="memGender" name="memGender" type="radio" name="gender" autocomplete="off" value="남자"
											<c:if test="${mvo.memGender eq '남자'}">checked</c:if> />남자
										</label>

										<!-- 여자 버튼 -->
										<label class="btn btn-primary <c:if test="${mvo.memGender eq '여자' }">active</c:if> " > 
										<input id="memGender" name="memGender" type="radio" name="gender" autocomplete="off" value="여자" 
										<c:if test="${mvo.memGender eq '여자' }">checked</c:if>/>여자
										</label>
									</div>

								</div>
							</td>
						</tr>
						<tr>
							<td style="width: 120px; vertical-align: middle">이메일</td>
							<td colspan="2"><input id="memEmail" name="memEmail"
								class="form-control" type="text" maxlength="20"
								placeholder="이메일을 입력하세요"  value="${mvo.memEmail }"/></td>
						</tr>
						
						<!-- 권한 체크박스 추가 -->
						<tr>
							<td style="width: 120px; vertical-align: middle">사용자권한</td>
							<td colspan="2">
			  	  	

							<label>
								<input type="checkbox" name="authList[0].auth" value="ROLE_USER"
									<c:forEach var="authVO" items="${mvo.authList}">
										<c:if test="${authVO.auth eq 'ROLE_USER'}">checked</c:if>
									</c:forEach>
								/> ROLE_USER
							</label>
							 
							<label><input type="checkbox"  name="authList[1].auth" value="ROLE_MANAGER"	
							<c:forEach var="authVO" items="${mvo.authList}">		
								<c:if test="${authVO.auth eq 'ROLE_MANAGER' }"> checked </c:if>
							</c:forEach>
							/>ROLE_MANAGER</label>
							 
							<label><input type="checkbox"  name="authList[2].auth" value="ROLE_ADMIN"							
							<c:forEach var="authVO" items="${mvo.authList }">
								<c:if test="${authVO.auth eq 'ROLE_ADMIN' }"> checked </c:if>
							</c:forEach>
							/>ROLE_ADMIN</label>	
																	
							</td>
						</tr>
						<tr>
							<td colspan="3" style="text-align: left;">
							<span id="pwd_msg" style="color:red;">1</span>
							<input type="text"   name="${_csrf.parameterName }" value="${_csrf.token }"/>	
							<input type="button" value="수정" class="btn btn-primary btn-sm pull-right" onclick="goUpdate();" />
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