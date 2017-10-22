<%@page import="mirim.stu.score.MirimDBBean"%>
<%@page import="mirim.stu.score.StudentDataBean"%>
<%@page import="java.util.List"%>
<%@ page contentType="application/vnd.ms-excel;charset=euc-kr" %>
<%
   response.setHeader("Content-Disposition", "attachment; filename=test.xls;");
   response.setHeader("Content-Description", "JSP Generated Data");
%>
<html>
<head>
<title>¿¢¼¿ÆÄÀÏº¯È¯</title>
<link rel="shorcut icon" href="fbgraph.png" type="image/x-icon">
<%
	    int total=0;
		List<StudentDataBean> students;
		if((List<StudentDataBean>)application.getAttribute("students") != null){
			 students = (List<StudentDataBean>)application.getAttribute("students");
		}else{
			MirimDBBean sdb = new MirimDBBean();
			students = sdb.listStudent();
		}
		
	%>
</head>
<body>
	<table>
		<tr>
			<th> ÇÐ¹ø </th>
			<th> ÀÌ¸§ </th>
			<th> »ó/¹úÁ¡ </th>
		</tr>
		
		<%
		
		for(int i=0; i<students.size(); i++){
			StudentDataBean student = students.get(i);
			total += student.getStu_total();
			%>
   		<tr>
   			<td><%=student.getStu_num() %></td>
   			<td><%=student.getStu_name() %></td>
   			<td><%=student.getStu_total()%></td>
   		</tr>
   	<%
		}
		%>
		<tr>
			<th>ÃÑÁ¡ </th>
			<td colspan=2><%=total %></td>
		</tr>
	</table>
</body>
</html>