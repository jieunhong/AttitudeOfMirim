<%@page import="mirim.stu.score.ScoreDataBean"%>
<%@page import="java.util.List"%>
<%@page import="mirim.stu.score.MirimDBBean"%>
<%@page import="mirim.stu.score.StudentDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<title>학생 페이지</title>
<link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300" rel="stylesheet">
<link href="https://fonts.googleapis.com/earlyaccess/nanumgothic.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/AOM.css">
<link rel="stylesheet" type="text/css" href="css/AOM_StudentDetail.css">
<link rel="shorcut icon" href="fbgraph.png" type="image/x-icon">
<%
String id = session.getAttribute("num").toString();            // request에서 id 파라미터를 가져온다


if(id==null||id.equals("")){                            // id가 Null 이거나 없을 경우

response.sendRedirect("AOM_LoginForm.jsp");    // 로그인 페이지로 리다이렉트 한다.

}

	String num = session.getAttribute("num").toString();
	System.out.println(""+num);
	MirimDBBean sdb = new MirimDBBean();
	StudentDataBean user = sdb.searchStudent(num);
	List<ScoreDataBean> scores = sdb.listScore_search(user.getStu_num());

%>
</head>
<body>
	<%@include file="top_student.jsp"%>
	<div class="subtitle">홍지은님의 상세 내역</div>
   <%
   if(scores == null){
		%>
		<b>등록된 상/벌점 정보가 없습니다.</b>
		<p>
		<a href="AOM_StudentMain.jsp">첫 화면으로 이동</a>
		<% application.setAttribute("num", num);
	}
	else{
		%>
		<table class="search">
		<tr>
			<th> 날짜 </th>
			<th> 내용 </th>
			<th> 상점 </th>
			<th> 벌점 </th>
		</tr>
		
		<%
		
		for(int i=0; i<scores.size(); i++){
			ScoreDataBean scoredata = scores.get(i);
			%>
   		<tr>
   			<td><%=scoredata.getSc_date().toString() %></td>
   			<td><%=scoredata.getSc_content() %></td>
   			<td><%=scoredata.getSc_plus()%></td>
   			<td><%=scoredata.getSc_minus()%></td>
   		</tr>
   	<%
		}
		%>
		</table>
		<%
	}
   %>
</body>
</html>