<%@page import="mirim.stu.score.MirimDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<%
    String num1 = request.getParameter("num").trim();
	String passwd  = request.getParameter("passwd").trim();
	
	int num = Integer.parseInt(num1);
	
	if(passwd.equals("0000")){
		session.setAttribute("num", "0000");
		session.setMaxInactiveInterval(600);
		response.sendRedirect("AOM_TeacherMain.jsp");
	}
	else{
		
		MirimDBBean sdb = new MirimDBBean();
    	int check= sdb.stuCheck(num,passwd);

		if(check==1){
			session.setAttribute("num", num);
			session.setMaxInactiveInterval(600);
			response.sendRedirect("AOM_StudentMain.jsp");
		}else if(check==0){%>
		<script> 
	 	 alert("비밀번호가 맞지 않습니다");
     	 history.go(-1);
		</script>
	<%	}else{ %>
		<script>
	  	alert("학번이 맞지 않습니다");
	  	history.go(-1);
		</script>
	<%}	
}
%>