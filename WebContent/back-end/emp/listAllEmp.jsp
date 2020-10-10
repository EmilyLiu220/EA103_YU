<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.emp.model.*"%>

<%
    EmpService empSvc = new EmpService();
    List<EmpVO> list = empSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<html>
<head>
<title>�Ҧ����u���</title>

<style>

</style>

</head>
<body>
	<h4><a href="select_page.jsp">�^����</a></h4>
	<h3>�Ҧ����u���</h3>
	
	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color:red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	
	<table>
		<tr>
			<th>���u�s��</th>
			<th>���u�m�W</th>
			<th>�b¾���A</th>
			<th>���A�ק�</th>
			<th>�v���s�W</th>
			<th>�v���R��</th>
		</tr>
		<%@ include file="page1.file" %> 
		<c:forEach var="empVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
			
			<tr>
				<td>${empVO.emp_no}</td>
				<td>${empVO.emp_name}</td>
				<td>${(empVO.emp_sts==1) ? "�b¾" : "��¾"}</td>
				
				<td>
				  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/emp/emp.do" style="margin-bottom: 0px;">
				     <input type="submit" value="���A�ק�">
				     <input type="hidden" name="emp_no" value="${empVO.emp_no}">
				     <input type="hidden" name="action"	value="Update_sts">
				  </FORM>
				</td>
				<td>
				  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/emp/emp.do" style="margin-bottom: 0px;">
				  	 <input type="submit" value="�v���s�W">
				  	 <input type="hidden" name="emp_no" value="${empVO.emp_no}">
				  	 <input type="hidden" name="action" value="Update_auth">
				  </FORM>
				</td>
				<td>
				  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/emp/emp.do" style="margin-bottom: 0px;">
				  	 <input type="submit" value="�v���R��">
				  	 <input type="hidden" name="emp_no" value="${empVO.emp_no}">
				  	 <input type="hidden" name="emp_name" value="${empVO.emp_name}">
				  	 <input type="hidden" name="emp_sts" value="${empVO.emp_sts}">
				  	 <input type="hidden" name="action" value="delete_emp_auth">
				  </FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
	<%@ include file="page2.file" %>
	
</body>
</html>