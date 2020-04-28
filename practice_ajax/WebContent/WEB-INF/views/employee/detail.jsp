<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>employee detail</title>
<link rel="stylesheet" href='<c:url value="/css/list.css"/>'>
<script type="text/javascript" src='<c:url value="/scripts/jquery-3.4.1.js"/>'></script>
	<script type="text/javascript">
	    jQuery(function($){
	    	$("#update").click(function() {

	    		var empm = {
    	    		      "id" : $("#id").val(),
    	    		      "family_name" :$("#family_name").val(),
    	    		      "first_name" :$("#first_name").val(),
    	    		      "sex" :$('input[name="sex"]:checked').val(),
    	    		      "birthday" :$("#birthday").val(),
    	    		   }
	    		alert(JSON.stringify(empm));
	            $.ajax({
	                url: "update.do",
	                type: "POST",
	                contentType : 'application/json; charset=utf-8',
	                cache: false,
	                data: JSON.stringify(empm),
	                dataType: "json",
	                success: function(response){
	                	var msg = response.msg;
                        var id = response.id;
                        var family_name = response.family_name;
                        var first_name = response.first_name;
                        if(response.sex=='f'){
                        	var sex = '女';
                        }else{
                        	var sex = '男';
                        }
                        var birthday = response.birthday;
                        let src;
                        src += '<tr><td>ID</td><td>' + id + '</td></tr><tr><td>姓</td><td>' + family_name + '</td></tr><tr><td>名</td><td>' + first_name + '</td></tr><tr><td>性別</td><td>' + sex + '</td></tr><tr><td>生年月日</td><td>' + birthday + '</td></tr>';
                        window.alert(msg);
                        $("#my_table").html(src);
	                }
	            });
	        });

	    	$("#delete").click(function() {

	    		var empm = {
    	    		      "id" : $("#id").val(),
    	    		   }
	    		alert('削除します');
	            $.ajax({
	                url: "delete.do",
	                type: "POST",
	                contentType : 'application/json; charset=utf-8',
	                cache: false,
	                data: JSON.stringify(empm),
	                dataType: "json",
	                success: function(response){
	                	if(response==true){
		                	window.alert('削除できました。');
		                	location.href = 'first.do';
	                	}else{
	                		window.alert('削除できませんでした。');
	                	}
	                }
	            });
	        });
	    });
	</script>
</head>
<body>

	<h1>従業員詳細画面</h1>


		<c:choose>
		<c:when test="${employee.msg != null }">
		<table id="my_table">

			<tr>
				<td>ID</td>
				<td>
				<input type="hidden" value="${employee.id }" id="id" name="id">
				${employee.id }
				</td>
			</tr>
			<tr>
				<td>姓</td>
				<td><input type="text" value="${employee.family_name }" id="family_name" name="family_name"></td>
			</tr>

			<tr>
				<td>名</td>
				<td><input type="text" value="${employee.first_name }" id="first_name" name="first_name"></td>
			</tr>
			<tr>
				<td>性別</td>
				<td>
				<c:choose>
						<c:when test = "${employee.sex == 'f'}">
						<input type="radio" id="sex" name="sex" value="m" /> 男
						<input type="radio" id="sex" name="sex" value="f" checked="checked" /> 女
						</c:when>
						<c:otherwise>
						<input type="radio" id="sex" name="sex" value="m" checked="checked" /> 男
						<input type="radio" id="sex" name="sex" value="f" /> 女
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td>生年月日</td>
				<td>
				<input type="date" value="${employee.birthday }" id="birthday" name="birthday">
				</td>
			</tr>

		</table>
		<p class = "eror">${employee.msg }</p>
		</c:when>
		<c:otherwise>

		<table>

			<tr>
				<td>ID</td>
				<td>
				<input type="hidden" value="${employee.id }" id="id" name="id">
				${employee.id }
				</td>
			</tr>

			<tr>
				<td>姓</td>
				<td><input type="text" value="${employee.family_name }" id="family_name" name="family_name"></td>
			</tr>

			<tr>
				<td>名</td>
				<td><input type="text" value="${employee.first_name }" id="first_name" name="first_name"></td>
			</tr>

			<tr>
				<td>性別</td>
				<td>
					<c:choose>
						<c:when test = "${employee.sex == 'f'}">
						<input type="radio" id="sex" name="sex" value="m" /> 男
						<input type="radio" id="sex" name="sex" value="f" checked="checked" /> 女
						</c:when>
						<c:otherwise>
						<input type="radio" id="sex" name="sex" value="m" checked="checked" /> 男
						<input type="radio" id="sex" name="sex" value="f" /> 女
						</c:otherwise>
					</c:choose>
				</td>
			</tr>

			<tr>
				<td>生年月日</td>
				<td>
				<input type="date" value="${employee.birthday }" id="birthday" name="birthday">
				</td>
			</tr>

		</table>
		</c:otherwise>
		</c:choose>
		<input type="button" value="更新" id="update">


		<input type="button" value="削除" id="delete">
	<form action="first.do">
		<input type="submit" value="戻る">
	</form>
	<form action="first.do" id="my_form"></form>

<!--  -->
</body>
</html>