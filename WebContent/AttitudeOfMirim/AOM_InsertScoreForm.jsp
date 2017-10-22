<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>선생님 페이지</title>
<link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300" rel="stylesheet">
<link href="https://fonts.googleapis.com/earlyaccess/nanumgothic.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/AOM.css">
<link rel="stylesheet" type="text/css" href="css/AOM_InsertScoreForm.css">
<link rel="shorcut icon" href="fbgraph.png" type="image/x-icon">
</head>
<body>
	<%@include file="top_student.jsp"%>
  	<div class="subtitle">상/벌점 추가</div>
    
  	<form method="post" action="AOM_InsertScorePro.jsp">
  		<div id="insert">
  			<table>
  				<colgroup>
					<col width="25%" />
					<col width="75%" />
				</colgroup>
  				<tr>
  					<td>학번</td>
  					<td>
					   	<select name="grade">
					   	<option value=1>1</option>
					   	<option value=2>2</option>
					   	<option value=3>3</option>
					   </select>  
					     학년 &nbsp; &nbsp;
					   <select name="class">
					   	<option value=1>1</option>
					   	<option value=2>2</option>
					   	<option value=3>3</option>
					   	<option value=4>4</option>
					   	<option value=5>5</option>
					   	<option value=6>6</option>
					   </select>  
					     반 &nbsp; &nbsp;
					   <select name="num">
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
			    	</td>
			    </tr>
			    <tr>
  					<td>내용</td>
  					<td><textarea class="textbox" rows="1" cols="20" name="content"></textarea></td>
		    	</tr>
		  		<tr>
  					<td>상/벌점</td>
  					<td>
					    상점 :   
					    <select name="plus">
					    <option value=0>0</option>
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
					   </select>    &nbsp; &nbsp;
					     벌점 :
					   <%  %>
					   <select name="minus">
					    <option value=0>0</option>
					   	<option value="-1">-1</option>
					   	<option value="-2">-2</option>
					   	<option value="-3">-3</option>
					   	<option value="-4">-4</option>
					   	<option value="-5">-5</option>
					   	<option value="-6">-6</option>
					   	<option value="-7">-7</option>
					   	<option value="-8">-8</option>
					   	<option value="-9">-9</option>
					   	<option value="-10">-10</option>
					   </select>
					</td>
				</tr>
			</table>
	   	</div>
	   	<input type="submit" class="button" value="상/벌점 추가">
	</form>
</body>
</html>