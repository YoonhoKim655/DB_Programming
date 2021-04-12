<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<jsp:useBean id="bTest" class="BTest.BTest" scope="page"></jsp:useBean>
<html>
<p><%=bTest.getMsg() %></p>
<p>Cnt : <%=bTest.getCnt() %></p>
</html>