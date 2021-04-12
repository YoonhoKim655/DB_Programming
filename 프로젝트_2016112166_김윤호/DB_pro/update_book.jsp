<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head><title>도서 수정</title></head>
<body>
	<table width="75%" align="center" bgcolor="#FFFF99" border>
	 	<tr>
			<td><div align"center">수정을 원하는 도서의 번호를 입력하세요</div></td>
		</tr>
	</table>
	<table width="75%" align="center" border>
		<form method=post" action="update_book_verify.jsp">
			<tr>
				<td><div align="center">책 번호</div></td>
				<td><div align="center"><input type="text" name="b_num"></div></td>
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