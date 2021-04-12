<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*, updateBean.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>정보 수정</title>
</head>
<body>
	<%@ include file="top.jsp"%>
	<%
		if (session_id == null)
			response.sendRedirect("login.jsp");
	%>
		<jsp:useBean id="updateMgr" class="updateBean.UpdateMgr" />
		<%
			Vector vlist = updateMgr.getUpdateList(session_id);
			int counter = vlist.size();
			for (int i = 0; i < vlist.size(); i++) {
				Update up = (Update) vlist.elementAt(i);
		%>
		<form method="post" action="update_verify.jsp">
  <input type="hidden" name="s_id" size="30" value="<%= session_id %>">
  <table width="75%" align="center" border>
	<tr><th>이름</th>
         <td><input type="text" name="s_name" size="50" value="<%=up.getS_name()%>"> </td>
     </tr>
	 <tr><th>주소</th>
         <td><input type="text" name="s_addr" size="50" value="<%=up.getS_addr()%>"> </td>
     </tr>
	 <tr><th>패스워드</th>
         <td><input type="password" name="s_pwd" size="20"  value="<%= up.getS_pwd() %>"></td>
     </tr>
	<tr><th>학부</th>
         <td><input type="text" name="s_college" size="50" value="<%= up.getS_college() %>"> </td>
     </tr>
     <tr><th>전공</th>
         <td><input type="text" name="s_major" size="50" value="<%= up.getS_major() %>"> </td>
     </tr>
<tr>
	<td colspan="2" align="center">
	<input type="submit" value="수정">
	</td> 
	<%
		}
	%>
</tr>
</table></form></body></html>
		



