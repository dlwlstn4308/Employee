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
<title>ngTouch.jsp</title>
<style type="text/css">
   .swipe-box {
      height: 200px;
      background-color: red;
      border: 1px solid black;
   }
</style>

<script type="text/javascript">
   var deps = ['ngRoute',
               'ngAnimate',
               'ngTouch',
               'angular-loading-bar'
              ];

   var app = angular.module("employeeApp", deps);
   
   app.controller("mainController", function($scope, $http) {
      console.log("mainController...");
      
      $scope.swipeLeft = function(e) {
         console.log("swipeLeft()...");
         console.dir(e);
         
         $(e.target).css('border-radius', '50px')
         
         $scope.msg = "ng-swipe-left fired...";
      };
      
      $scope.swipeRight = function(e) {
         console.log("swipeRight()...");
         console.dir(e);
         
         $(e.target).css('boader-radius', '50px')
         
         $scope.msg = "ng-swipe-right fired...";
      };
      
  
       
     
      /*
      * image test
      */
      $scope.imgURL = "http://www.placehold.it/400x400";
      
      $scope.imgSwipeLeft = function(e) {
          console.log("imgswipeLeft()...");
          console.dir(e);
                  
          $scope.imgmsg = "ng-swipe-left fired...";
          
          $scope.imgURL = "http://www.placehold.it/400x400/ff0000/0000ff?text=SwipeLeft...";
       };
       
       $scope.imgSwipeRight = function(e) {
          console.log("imgswipeRight()...");
          console.dir(e);
                    
          $scope.imgmsg = "ng-swipe-right fired...";
          
          $scope.imgURL = "http://www.placehold.it/400x400/0000ff/ff0000?text=SwipeRight...";
       };
       
       /*
        * 
        */
      
       var list = new Array(); 
       
    	list[0] = "0" ;	
    	list[1] = "1.PNG";
    	list[2] ="2.PNG"
    	list[3] ="3.PNG"
    	list[4] ="4.PNG"
    	list[5] ="5.PNG"
    	list[6] ="6.PNG"
    	list[7] ="7.PNG"
    	list[8] ="8.PNG"
    	list[9] ="9.PNG"
    	list[10] ="9.PNG"
       var i=5;	   
      
    	$scope.imgURL2 = list[i];
    	     
       $scope.img2SwipeLeft = function(e) {    
           $scope.imgURL2 =list[i--];
           if(i==0){
        	   i=9; 
        	   $scope.imgURL2 =list[9];
           }
           
        };
        
        $scope.img2SwipeRight = function(e) {          
           $scope.imgURL2 = list[i++];
           if(i==10){
        	   i=1; 
        	   $scope.imgURL2 =list[1];
           }
          
        };
       
      
   });
   
</script>
</head>

<body data-ng-controller="mainController" class="container">
   <div data-ng-swipe-left="swipeLeft($event)"
       data-ng-swipe-right="swipeRight($event)" 
       class="swipe-box">
   </div>       
   <hr>
   <p>{{msg}}</p>
   <hr>
   <img data-ng-swipe-left="imgSwipeLeft($event)"
        data-ng-swipe-right="imgSwipeRight($event)"     
 	    draggable="false" class="img-responsive" alt="{{imgURL}}" data-ng-src="{{imgURL}}">
 	     <p>{{imgmsg}}</p>
   <hr>
   <img data-ng-swipe-left="img2SwipeLeft($event)"
        data-ng-swipe-right="img2SwipeRight($event)" 
        ondragstart="return false"    
 	    draggable="false" class="img-responsive" alt="{{imgURL2}}" data-ng-src="{{imgURL2}}">
 	    
</body>
</html>