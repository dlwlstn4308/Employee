<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html lang="ko" data-ng-app="employeeApp">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<%@ include file="/WEB-INF/view/common.jspf" %>
<title>form.jsp</title>
<script type="text/javascript">
	var deps = ['ngRoute',
	            'ngAnimate',
	            'ngTouch',
	            'angular-loading-bar'
	            ];
	
	var app = angular.module("employeeApp",deps);
	
	app.controller("mainController", function($scope, $http) {
		console.log("mainController...");
		
		$scope.method="POST";
		
	})

</script>
</head>
<body data-ng-controller="mainController" class="container">

<h1>{{method}}</h1>

<form action="/Employee/city">
	<select data-ng-model="method">
		<option>GET</option>
		<option>POST</option>
		<option>PUT</option>
		<option>DELETE</option>
	</select>
	<input type="submit" value="getCityAll()">
</form>

</body>
</html>