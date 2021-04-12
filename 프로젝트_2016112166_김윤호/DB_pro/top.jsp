<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"  %>
<!DOCTYPE html>
<html>
<head><title>Insert title here</title></head>
<body>
	<% 
		String session_id = (String)session.getAttribute("user"); 
		String session_name = (String)session.getAttribute("user_name");
		String session_right ="";
		session_right = (String)session.getAttribute("user_right");
		String log, m_book,m_cus, m_rental, m_join, join_inform;
		String right = "manage";
		if(session_id==null){
			log="<a href=login.jsp>로그인</a>";
			join_inform="<a href=join.jsp>회원 가입</a>";
		} else {
			log="<a href=logout.jsp>로그아웃</a>";
			join_inform="<a href=insert.jsp>도서 대여</a>";
		}
		if(right.equals(session_right)){
			m_book="<a href=manage_book.jsp>도서 관리</a>";
			m_cus="<a href=manage_customer.jsp>회원 관리</a>";
			m_rental="<a href=manage_rental.jsp>대여 관리</a>";
			m_join = "<a href=accept.jsp>가입 대기</a>";
		} else {
			m_book="관리자전용";
			m_cus="관리자전용";
			m_rental = "관리자전용";
			m_join = "관리자전용";
		}
	%>

	<table width="75%" align="center" bgcolor="#FFFF99" border>
		<tr>
			<td align="center"><b><%=log%></b></td>
			<td align="center"><b><%=join_inform%></b></td>
			<td align="center"><b><a href="update.jsp">정보 수정</a></b></td>
			<td align="center"><b><a href="search_book.jsp">도서 검색</a></b></td>
			<td align="center"><b><%=m_book%></b></td>
			<td align="center"><b><%=m_cus%></b></td>
			<td align="center"><b><%=m_rental%></b></td>
			<td align="center"><b><%=m_join%></b></td>
		</tr>
	</table>
</body>
</html>

