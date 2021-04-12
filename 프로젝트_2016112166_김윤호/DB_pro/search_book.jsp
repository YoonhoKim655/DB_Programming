<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head><title>도서 검색</title></head>
<body>
	<table width="75%" align="center" bgcolor="#FFFF99" border>
	 	<tr>
			<td><div align"center">찾고자하는 도서명을 입력하세요</div></td>
		</tr>
	</table>
	<table width="75%" align="center" border>
		<form method=post" action="search_verify.jsp">
			<tr>
				<td><div align="center">도서명</div></td>
				<td><div align="center"><input type="text" name="b_title"></div></td>
			</tr>
			<tr>
				<td colspan=2>
					<div align="center">
						<input type="submit" name="submit" value="검색">
						<input type="reset" value="취소">
					</div>
				</td>
			</tr>
		</form>
	</table>
</body>
</html>

