<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>

<%
  EmpVO empVO = (EmpVO) request.getAttribute("empVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>���u��Ʒs�W</title>

<style>
	
</style>

</head>
<body>

	<table id="table-1">
		<tr><td>
			 <h3>���u��Ʒs�W</h3></td><td>
			 <h4><a href="select_page.jsp">�^����</a></h4>
		</td></tr>
	</table>
	
	<h3>��Ʒs�W:</h3>
	
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
			<td>���u�m�W:</td>
			<td><input type="TEXT" name="emp_name" size="45" 
				 value="<%= (empVO==null)? "�п�J���u�m�W!" : empVO.getEmp_name()%>" /></td>
		</tr>
	</table>
	<br>
	<input type="hidden" name="action" value="insert">
	<input type="submit" value="�e�X�s�W">
	</FORM>
</body>
</html>