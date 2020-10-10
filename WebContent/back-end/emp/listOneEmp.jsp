<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>
<%@ page import="com.emp_auth.model.*"%>
<%@ page import="com.fun_auth.model.*"%>
<%@ page import="java.util.*"%>

<%
  EmpVO empVO = (EmpVO) request.getAttribute("empVO"); //EmpServlet.java(Concroller), �s�Jreq��empVO����
%>

<% 
  List<Emp_authVO> emp_authVO = (List<Emp_authVO>) request.getAttribute("emp_authVO"); //Emp_authServlet.java(Concroller), �s�Jreq��emp_authVO����
%>

<%
  List<Fun_authVO> fun_authVO = (List<Fun_authVO>) request.getAttribute("fun_authVO");
%>

<html>
<head>
<title>���u���</title>

<style>

</style>

</head>
<body>

	<h4><a href="select_page.jsp">�^����</a></h4>
	<h3>���u���</h3>

<table>
	<tr>
		<th>���u�s��</th>
		<th>���u�m�W</th>
		<th>�b¾���A</th>
		<th>�v�����e</th>
	</tr>
	<tr>
		<td>${empVO.emp_no}</td>
		<td>${empVO.emp_name}</td>
		<td>${(empVO.emp_sts==1) ? "�b¾" : "��¾"}</td>

		<td>
			<c:forEach var="fun_authVO" items="${fun_authVO}">
				${fun_authVO.fun_name}<br>
			</c:forEach>
		</td>
	</tr>
	
</table>

</body>
</html>