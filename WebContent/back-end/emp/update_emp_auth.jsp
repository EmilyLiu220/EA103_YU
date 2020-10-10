<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>

<%
  EmpVO empVO = (EmpVO) request.getAttribute("empVO"); //EmpServlet.java (Concroller) �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>���u�v���ק�</title>

<style>

</style>

</head>
<body>

	<h4><a href="select_page.jsp">�^����</a></h4>
	<h3>���u�v���ק�</h3>

	<h3>�v���ק�:</h3>
	
	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color:red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="emp.do" name="form1">
	<table>
		<tr>
			<td>���u�s��:</td>
			<td><%=empVO.getEmp_no()%></td>
		</tr>
		<tr>
			<td>���u�m�W:</td>
			<td><%=empVO.getEmp_name()%></td>
		</tr>
	</table>
		
	
		<jsp:useBean id="fun_authSvc" scope="page" class="com.fun_auth.model.Fun_authService" />
		
			�v��:<font color=red><b>*</b></font><br>
			
			<c:forEach var="fun_authVO" items="${fun_authSvc.all}">
				<label><input name="fun_no[]" type="checkbox" value="${fun_authVO.fun_no}">${fun_authVO.fun_name}</label>
			</c:forEach>
			
	<br>
	<input type="hidden" name="action" value="update_a">
	<input type="hidden" name="emp_no" value="<%=empVO.getEmp_no()%>">
	<input type="hidden" name="emp_name" value="<%=empVO.getEmp_name()%>">
	<input type="hidden" name="emp_sts" value="<%=empVO.getEmp_sts()%>">
	<input type="submit" value="�e�X�ק�"></FORM>

</body>
</html>