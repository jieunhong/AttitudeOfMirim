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
	
	MirimDBBean sdb = new MirimDBBean();
	
	List<StudentDataBean> students = sdb.listStudent_Grade(grade);
	
	application.setAttribute("students", students);
	
	System.out.print(""+grade);
	
	response.sendRedirect("AOM_GradeScoreForm.jsp");
	
%>