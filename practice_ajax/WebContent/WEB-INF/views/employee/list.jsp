<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>employee list</title>
<link rel="stylesheet" href='<c:url value="/css/list.css"/>'>
<script type="text/javascript" src='<c:url value="/scripts/jquery-3.4.1.js"/>'></script>
	<script type="text/javascript">

		function buttonClick(id) {
	    	location.href = 'detail.do?id=' + id;
	    	};

	    jQuery(function($){

	    	$("#sort,#cend").change(function() {

	    		var empm = {
    	    		      "sort" : $("#sort").val(),
    	    		      "cend" :$("#cend").val()
    	    		   }
	    		alert(JSON.stringify(empm));
	            $.ajax({
	                url: "sort.do",
	                type: "POST",
	                contentType : 'application/json; charset=utf-8',
	                cache: false,
	                data: JSON.stringify(empm),
	                dataType: "json",
	                success: function(response){
	                	let src;
	                    src += '<tr><th>ID</th><th>姓</th><th>名</th><th>性別</th><th>生年月日</th><th>詳細へ</th></tr>';
	                    for(var idx = 0; idx < response.length; idx++){
	                        var employee = response[idx];
	                        var id = employee.id;
	                        var family_name = employee.family_name;
	                        var first_name = employee.first_name;
	                        if(employee.sex=='f'){
	                        	var sex = '女';
	                        }else{
	                        	var sex = '男';
	                        }
	                        var birthday = employee.birthday;
	                        src += '<tr><td>' + id + '</td><td>' + family_name + '</td><td>' + first_name + '</td><td>' + sex + '</td><td>' + birthday + '</td><td><input type="button" value="詳細" onClick="buttonClick(' + id + ')"></td></tr>';
	                    }
	                    $("#my_table").html(src);
	                }
	            });
	        });
	    });
	</script>
</head>
<body>

	<h1>従業員一覧画面</h1>

	<form action="move.do" method = "GET">
	<input type="submit" value="新規登録画面">
	</form>

	    <select id="sort">
	    	<option value="id">ID</option>
			<option value="family_name">姓</option>
			<option value="first_name">名</option>
			<option value="sex">性別</option>
			<option value="birthday">生年月日</option>
		</select>
		<select id="cend">
			<option value="asc">昇順</option>
			<option value="desc">降順</option>
		</select>

		<table id='my_table'>

			<tr>
			<th>ID</th>
			<th>姓</th>
			<th>名</th>
			<th>性別</th>
			<th>生年月日</th>
			<th>詳細へ</th>
			</tr>

			<c:if test="${employees != null }">
				<c:forEach items="${employees}" var="employee" varStatus="status">

					<tr>
						<td>${employee.id }</td>
						<td>${employee.family_name }</td>
						<td>${employee.first_name }</td>
					<c:choose>
					<c:when test = "${employee.sex == 'f'}">
		  						<td>女</td>
					</c:when>
					<c:otherwise>
		  						<td>男</td>
					</c:otherwise>
					</c:choose>
						<td>${employee.birthday }</td>
						<td>
						<f:form modelAttribute="EmployeeModel" action="detail.do" method = "GET">
						<input type="hidden" value="${employee.id }" id="id" name="id">
						<input type="submit" value="詳細">
						</f:form>
						</td>
					</tr>

				</c:forEach>
			</c:if>
			<tr></tr>

		</table>
<!--  -->
</body>
</html>