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
<title>Attitude of Mirim</title>
<link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300" rel="stylesheet">
<link href="https://fonts.googleapis.com/earlyaccess/nanumgothic.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/AOM.css">
<link rel="stylesheet" type="text/css" href="css/AOM_LoginForm.css">
<link rel="shorcut icon" href="fbgraph.png" type="image/x-icon">
<%session.invalidate(); %>
</head>
<body>

  <div id="loginbox">
  	<div id="login-title">- Attitude of Mirim -</div>
	<form method="post" action="AOM_LoginPro.jsp">
     		<input type="text" class="textbox" name="num" maxlength="50" placeholder="학번 입력" required/><br />
     		<input type="password" class="textbox" name="passwd" maxlength="16" placeholder="비밀번호 입력" required /><br />
     		<input type="submit" id="button-login" value="SIGN IN">
     </form>
  </div>
</body>
</html>