<%@page import="javax.websocket.SendResult"%>
<%@page import="mirim.stu.score.StudentDataBean"%>
<%@page import="java.util.List"%>
<%@page import="mirim.stu.score.MirimDBBean"%>
<%@page import="mirim.stu.score.ScoreDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<% request.setCharacterEncoding("utf-8");%>


 
<%
	
	String grade = request.getParameter("grade");
	String class1 = request.getParameter("class");
	String num = request.getParameter("num");
	
	MirimDBBean sdb = new MirimDBBean();
	StudentDataBean user;
	List<ScoreDataBean> scores=null;
	try{
		user = sdb.searchStudent(grade+class1+num);
		scores = sdb.listScore_search(user.getStu_num());
	}catch(NullPointerException e){
		System.out.println("엑");
	}
	
	
	application.setAttribute("students_score", scores);
	
	response.sendRedirect("AOM_StudentScoreForm.jsp");
	
%>