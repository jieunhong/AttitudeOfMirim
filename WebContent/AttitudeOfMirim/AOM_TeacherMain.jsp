<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
 //[뒤로가기]버튼으로 보지 못하도록, no-cache로 설정
 response.setDateHeader("Expires", 0);
 response.setHeader("Pragma", "no-cache");
 if (request.getProtocol().equals("HTTP/1.1")) {
  response.setHeader("Cache-Control", "no-cache");
 }
%>

<html>
<head>
<title>선생님 페이지</title>
<link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300" rel="stylesheet">
<link href="https://fonts.googleapis.com/earlyaccess/nanumgothic.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/AOM.css">
<link rel="stylesheet" type="text/css" href="css/AOM_TeacherMain.css">
<link rel="shorcut icon" href="fbgraph.png" type="image/x-icon">
<%

	String id = (String)session.getAttribute("num");            // request에서 id 파라미터를 가져온다


	if(id==null||id.equals("")){                            // id가 Null 이거나 없을 경우
		System.out.println("id"+id);
		response.sendRedirect("AOM_LoginForm.jsp");    // 로그인 페이지로 리다이렉트 한다.

	}
	System.out.println("id"+id);


%>
</head>
<body>
	<%@include file="top_teacher.jsp"%>
   	<table>
	   	<tr class="icon">
			  	<td><i class="fa fa-plus-square-o" aria-hidden="true"></i></td>
			  	<td><i class="fa fa-list-ol" aria-hidden="true"></i></td>
			  	<td><i class="fa fa-users" aria-hidden="true"></i></td>
			  	<td><i class="fa fa-user" aria-hidden="true"></i></td>
	  	</tr>
		<tr>
			  	<td><input type="submit" class="button" value="상/벌점 추가하기"
	  				onclick="location.href='AOM_InsertScoreForm.jsp'"></td>
			  	<td><input type="submit" class="button" value="학년별 상/벌점 상세보기"
					onclick="location.href='AOM_GradeScoreForm.jsp'"></td>
			  	<td><input type="submit" class="button" value="반별 상/벌점 상세보기"
	  				onclick="location.href='AOM_ClassScoreForm.jsp'"></td>
			  	<td><input type="submit" class="button" value="학생별 상/벌점 상세보기"
	  				onclick="location.href='AOM_StudentScoreForm.jsp'"></td>
	  	</tr>
    </table>
</body>
</html>