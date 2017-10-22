<%@page import="mirim.stu.score.ScoreDataBean"%>
<%@page import="mirim.stu.score.MirimDBBean"%>
<%@page import="mirim.stu.score.StudentDataBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>선생님 페이지</title>
<link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300" rel="stylesheet">
<link href="https://fonts.googleapis.com/earlyaccess/nanumgothic.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/AOM.css">
<link rel="stylesheet" type="text/css" href="css/AOM_StudentScoreForm.css">
<link rel="shorcut icon" href="fbgraph.png" type="image/x-icon">
	<%
	    int total=0;
		List<ScoreDataBean> students;
		if((List<ScoreDataBean>)application.getAttribute("students_score") != null){
			 students = (List<ScoreDataBean>)application.getAttribute("students_score");
		}else{
			MirimDBBean sdb = new MirimDBBean();
			students = sdb.listScore();
		}
		
	%>
</head>
<body>
	<%@include file="top_teacher.jsp"%>
  	<div class="subtitle">학생별 상/벌점 상세 검색</div>
  
	<form method="post" action="AOM_StudentScorePro.jsp">
	  	
		<i class="fa fa-search" aria-hidden="true"></i>	  	
	  	
		 <select name="grade"  required>
		  	<option value=1>1</option>
		  	<option value=2>2</option>
		  	<option value=3>3</option>
		  </select>  
		    학년 &nbsp; &nbsp;
		  <select name="class"  required>
		  	<option value=1>1</option>
		  	<option value=2>2</option>
		  	<option value=3>3</option>
		  	<option value=4>4</option>
		  	<option value=5>5</option>
		  	<option value=6>6</option>
		  </select>  
		    반 &nbsp; &nbsp;
		  <select name="num"  required>
		  	<option value=1>1</option>
		  	<option value=2>2</option>
		  	<option value=3>3</option>
		  	<option value=4>4</option>
		  	<option value=5>5</option>
		  	<option value=6>6</option>
		  	<option value=7>7</option>
		  	<option value=8>8</option>
		  	<option value=9>9</option>
		  	<option value=10>10</option>
		  	<option value=11>11</option>
		  	<option value=12>12</option>
		  	<option value=13>13</option>
		  	<option value=14>14</option>
		  	<option value=15>15</option>
		  	<option value=16>16</option>
		  	<option value=17>17</option>
		  	<option value=18>18</option>
		  	<option value=19>19</option>
		  	<option value=20>20</option>
		  </select>  
		    번 &nbsp; &nbsp;
		    
		  <input type="submit" class="button" value="검색">
	  
	</form>
		<table>
		<tr>
			<th> 학번 </th>
			<th> 날짜 </th>
			<th> 내용 </th>
			<th> 상점 </th>
			<th> 벌점 </th>
		</tr>
		
		<%
		
		for(int i=0; i<students.size(); i++){
			ScoreDataBean scoredata = students.get(i);
			total += scoredata.getSc_plus()+scoredata.getSc_minus();
			%>
   		<tr>
   			<td><%=scoredata.getSc_num() %></td>
   			<td><%=scoredata.getSc_date().toString() %></td>
   			<td><%=scoredata.getSc_content() %></td>
   			<td><%=scoredata.getSc_plus()%></td>
   			<td><%=scoredata.getSc_minus()%></td>
   		</tr>
   	<%
		}
		%>
		<tr>
			<th>총점 </th>
			<td colspan=3><%=total %></td>
		</tr>
		</table>
 
</body>
</html>