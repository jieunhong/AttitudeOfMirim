<%@page import="mirim.stu.score.StudentDataBean"%>
<%@page import="mirim.stu.score.MirimDBBean"%>
<%@page import="mirim.stu.score.ScoreDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<% request.setCharacterEncoding("utf-8");%>


 
<%
	
	String grade = request.getParameter("grade");
	String stuClass = request.getParameter("class");
	String num = request.getParameter("num");
	String content = request.getParameter("content");
	String plus = request.getParameter("plus");
	String minus = request.getParameter("minus");
	String real_Num = grade+stuClass+num;

	MirimDBBean sdb = new MirimDBBean();
	StudentDataBean student = sdb.searchStudent(real_Num);
	
	System.out.println(""+minus+",");
	ScoreDataBean score = new ScoreDataBean();
	score.setSc_num(Integer.parseInt(real_Num));
	score.setSc_content(content);
	score.setSc_minus(Integer.parseInt(minus));
	score.setSc_plus(Integer.parseInt(plus));
	
	sdb.insertScore(score);
	
	
%>
<html>
<head></head>
<body>
		상/벌점 추가를 완료했습니다 :)<br>
		<a href="AOM_TeacherMain.jsp">선생님 메인 페이지로 돌아가기</a>
</body>
</html>