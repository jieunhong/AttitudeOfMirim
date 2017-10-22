<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>회원가입</title>
</head>
<body>
  <h2>회원가입폼</h2>
    
  <form method="post" action="AOM_insertScorePro.jsp">
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
    내용 : <textarea rows="1" cols="20" name="content"></textarea>
    &nbsp; &nbsp;
  
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
   
   <br>
   <input type="submit" value="상/벌점 추가">
  </form>
</body>
</html>