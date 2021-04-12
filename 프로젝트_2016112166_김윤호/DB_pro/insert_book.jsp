<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"  %>
<!DOCTYPE html>
<html>
<head><title>도서 추가</title></head>
<body>
<form method="post" action="insert_book_verify.jsp">
  <table width="75%" align="center" border>
	<tr><th>책 번호</th>
         <td><input type="text" name="b_num" size="50"> </td>
     </tr>
	 <tr><th>제목</th>
         <td><input type="text" name="b_title" size="50"> </td>
     </tr>
	 <tr><th>작가</th>
         <td><input type="text" name="b_writer" size="20"></td>
     </tr>
	<tr><th>출판사</th>
         <td><input type="text" name="b_publish" size="50"> </td>
     </tr>
	 <tr><th>책 수량</th>
		 <td><input type="text" name="b_quantity" size="50"> </td>
     </tr>
<tr>
	<td colspan="2" align="center">
	<input type="submit" value="수정">
	</td> 
</tr>
</table></form></body></html>
