<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
  $(document).ready(function(){
	  loadList();
  });
  
  function loadList(){
	//서버와 통신
	$.ajax({
		url : "board/all",
		type:"get",
		dataType : "json",
		success : makeView, /// 회원값을 리스트(JSON형식)으로 받기[{  },{  }]
		error : function(){
			error("error2");
		}
	});		  
  }

  function goContent(idx){	  
	  var row = $("#c"+idx);
	  if(row.css("display")=="none") {
			$.ajax({
				url : "board/"+idx,
				type:"get",
				dataType : "json",
				success :function(data){
					$("#ta"+idx).val(data.content);
				}, /// 회원값을 리스트(JSON형식)으로 받기[{  },{  }]
				error : function(){
					error("error");
				}
			});	  		  
		  
	  	row.css("display" , "table-row");
	  	$("#ta"+idx).attr("readonly", true);  		  		  	
	  	
			$.ajax({
				url : "board/count/"+idx,
				type:"put",
				dataType : "json",
				success :function(data){
					$("#cnt"+idx).text(data.count);
				}, /// 회원값을 리스트(JSON형식)으로 받기[{  },{  }]
				error : function(){
					error("error");
				}
			});	 
	  	
	  } else {
		  
		  row.css("display", "none");
	  }

	  
  }
  
  function goInsert() {
	var fData = $('#frm').serialize();
	
	$.ajax({
		url : "board/new",
		type:"post",
		data:fData,
		dataType : "json",
		success :loadList, /// 회원값을 리스트(JSON형식)으로 받기[{  },{  }]
		error : function(){
			error("error");
		}
	});		
	
	$("#fclear").trigger("click");  	  
  }

  function goDelete(idx){

		$.ajax({
			url : "board/"+idx,
			type:"delete",
			dataType : "json",
			success :loadList, /// 회원값을 리스트(JSON형식)으로 받기[{  },{  }]
			error : function(){
				error("error");
			}
		});		
  }
    
  function goUpdate(idx){
	  
	var title=$("#nt"+idx).val();
	var content=$("#ta"+idx).val();
		alert(idx+","+title+","+content);
	$.ajax({
		url : "board/update",
		type:"put",
		contentType: "application/json",  // ★ 꼭 추가
		data: JSON.stringify({
			"idx": idx,
			"title": title,
			"content": content
		}),
		dataType : "json",
		success :loadList, /// 회원값을 리스트(JSON형식)으로 받기[{  },{  }]
		error : function(){
			error("error");
		}
	});		  
  }

  function makeView(data){
  	var html = "<table class='table table-hover'>";

      html += "<thead>";
      html += "<tr>";
      html += "<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>";
      html += "</tr>";
      html += "</thead>";
      
      html += "<tbody>";      
      $.each(data, function(index, obj) {  	   
    	  var onlyDate = obj.indate.split(' ')[0]; 	
  	    html += "<tr>";
  	    html += "<td>"+obj.idx+"</td>";
  	    html += "<td id='t"+obj.idx+"'><a href='javascript:goContent("+obj.idx+")' >"+obj.title+"</a></td>";
  	    html += "<td>"+obj.writer+"</td>";
  	    html += "<td>" + onlyDate + "</td>";  // 수정된 부분
  	    html += "<td id='cnt"+obj.idx+"'>"+obj.count+"</td>";
  	    html += "</tr>";
  	    
  	    html += "<tr id='c"+obj.idx+"' style='display:none'>";
  	    html += "<td>내용</td>";  	    
  	    html += "<td colspan='4'>";
  	    html += "<textarea id='ta"+obj.idx+"' rows='7' class='form-control' readonly></textarea>";
  	    html += "<br/>"
  	  	html += "<span id='ub"+obj.idx+"'><button type='button' class='btn btn-success btn-sm' onclick='goUpdateForm(" + obj.idx + ")'>수정화면</button></span>&nbsp;"
  	  	html += "<button type='button' class='btn btn-warning btn-sm' onclick='goDelete(" + obj.idx + ")'>삭제</button>&nbsp;"
  	  	    
  	    html += "</tr>";
      });   
      
 	    html += "<tr>";
 	    html += "<td colspan='6' style='text-align:left'>";
 	    html += "<button class='btn btn-primary btn-sm' onclick='goForm()'>글쓰기</button>";
 	    html += "</td>";
 	    html += "</tr>";    
      html += "</tbody>";
      
      html += "</table>";

      $('#view').html(html);
      goList();
  }

  function goForm(){
	  $("#view").css("display","none");
	  $("#wform").css("display","block");	  
  }
  
  function goList(){
	  $("#view").css("display","block");
	  $("#wform").css("display","none");	  
  }

  function goUpdateForm (idx){	

	  $("#ta"+idx).attr("readonly",false);
	  var title = $("#t"+idx).text();
	  var newInput="<input type='text' id='nt"+idx+"' class='form-control' value='"+title+"'/>";
	  trTag = $("#t"+idx).html(newInput);
	  var newButton = "<button class='btn btn-success btn-sm' onclick='goUpdate("+idx+")'>수정</button>";
	  $("#ub"+idx).html(newButton);  	  	  
  }
  </script>
</head>
<body>
 
<div class="container">
  <h2>Spring MVC03</h2>
  <div id="contents" class="panel panel-default">
    <div class="panel-heading">BOARD</div>
    <div class="panel-body" id="view">PanelContent</div>
    <div class="panel-body" id="wform" style="display:none;">

    <form id="frm">    
    <table class="table">
    	<tr><td>제목</td><td><input type="text" id="title" name="title" class="form-control"/></td></tr>
    	<tr><td>내용</td><td><textarea rows="12" type="text" id="content" name="content" class="form-control"></textarea></td></tr>
    	<tr><td>작성자</td><td><input type="text" id="writer" name="writer" class="form-control"/></td></tr>
     <tr><td colspan="2" align="center">
     <button type="button" class="btn btn-success btn-sm" onclick="goInsert()">등록</button>
     <button type="reset" class="btn btn-warning btn-sm" id="fclear">취소</button>
     <button type="button" class="btn btn-info btn-sm" onclick="goList()">목록</button>
     </td></tr>
    </table>
    </form>
		</div>
    <div class="panel-footer">인프런_스프1탄_홍길동</div>
  </div>
</div>

</body>
</html>