<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head><title>회원 가입</title></head>
<body>
	<table width="75%" align="center" bgcolor="#FFFF99" border>
	 	<tr>
			<td><div align"center">사용자 정보를 입력하세요.</div></td>
		</tr>
	</table>
	<table width="75%" align="center" border>
		<form method=post" action="join_verify.jsp">
			<tr>
				<td><div align="center">아이디(최대 10자)</div></td>
				<td><div align="center"><input type="text" name="t_id"></div></td>
			</tr>
			<tr>
				<td><div align="center">패스워드(최대 10자)</div></td>
				<td><div align="center"><input type="password" name="t_pwd"></div></td>
			</tr>
			<tr>
				<td><div align="center">이름</div></td>
				<td><div align="center"><input type="text" name="t_name"></div></td>
			</tr>
			<tr>
				<td><div align="center">주소</div></td>
				<td><div align="center"><input type="text" name="t_addr"></div></td>
			</tr>
			<tr>
				<td><div align="center">전화번호</div></td>
				<td><div align="center"><input type="text" name="t_phone"></div></td>
			</tr>
			<tr>
				<td colspan=2>
					<div align="center">
						<input type="submit" name="submit" value="신청">
						<input type="reset" value="취소">
					</div>
				</td>
			</tr>
		</form>
	</table>
</body>
</html>