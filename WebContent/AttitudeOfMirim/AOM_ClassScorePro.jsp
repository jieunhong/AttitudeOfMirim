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
	
	System.out.println(",,"+grade+class1);
	
	MirimDBBean sdb = new MirimDBBean();
	
	List<StudentDataBean> students = sdb.listStudent_Class(grade+class1);
	
	application.setAttribute("students_class", students);
	
	response.sendRedirect("AOM_ClassScoreForm.jsp");
	
%>