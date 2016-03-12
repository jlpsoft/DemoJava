<%@ page import="pe.com.jlpsoft.demojava.model.dao.DaoEmployee" %>
<%@ page import="pe.com.jlpsoft.demojava.model.dto.BeanEmployee" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!--<link rel="stylesheet" href="css/style.css" type="text/css" />-->
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<meta name="generator" content="Bootply" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
	<link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
	<link href="css/styles.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="css/style.css" type="text/css" />

	<title>Modificar Empleado</title>
</head>
<body>
        <%
			DaoEmployee dao = new DaoEmployee();
			int ida = Integer.parseInt((String)request.getAttribute("employee_id"));
			BeanEmployee employee = dao.getEmployeeById(ida);
        %>
	<form method="POST" action="EmployeeServlet">
		<input type="hidden" name="action" value="edit" /> 
		<input type="hidden" name="employee_id" value="<%= employee.getEmployee_id() %>" />
		<table class="tableModifier highlight centered responsive-table">
			<caption><h1>Edit Employee</h1></caption> <br/>
			<tr>
				<td class="l">Job Id : </td>
				<td class="r"><input type="text" name="job_id" disabled value="<%= employee.getJob_id() %>"/></td>
			</tr>
			<tr>
				<td class="l">Manager : </td>
				<td class="r"><input type="text" name="manager_id" value="<%= employee.getManager_id() %>"/></td>
			</tr>
			<tr>
				<td class="l">Department : </td>
				<td class="r"><input type="text" name="department_id" value="<%= employee.getDepartment_id() %>"/></td>
			</tr>
			<tr>
				<td class="l">First Name : </td>
				<td class="r"><input type="text" name="first_name" value="<%= employee.getFirst_name() %>"/></td>
			</tr>
			<tr>
				<td class="l">Last Name : </td>
				<td class="r"><input type="text" name="last_name" value="<%= employee.getLast_name() %>"/></td>
			</tr>

			<tr>
				<td class="l">Email : </td>
				<td class="r"><input type="text" name="email" value="<%= employee.getEmail() %>"/></td>
			</tr>
			<tr>
				<td class="l">Phone Number : </td>
				<td class="r"><input type="text" name="phone_number" value="<%= employee.getPhone_number() %>"/></td>
			</tr>
			<tr>
				<td class="l">Hire Date : </td>
				<td class="r"><input type="text" name="hire_date" value="<%= employee.getHire_date() %>"/></td>
			</tr>
			<tr>
				<td class="l">Salary : </td>
				<td class="r"><input type="text" name="salary" value="<%= employee.getSalary() %>"/></td>
			</tr>
			<tr>
				<td class="l">Commission : </td>
				<td class="r"><input type="text" name="commission_pct" value="<%= employee.getCommission_pct() %>"/></td>
			</tr>
			<tr>
				<td class="l"><input type="submit" value="edit" /></td>
				<td class="r"><input type="reset" value="Cancelar" /></td>
			</tr>
		</table>
	</form>

		<!--Import jQuery before materialize.js-->
		<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="js/materialize.min.js"></script>
		<script src="js/materialize.js"></script>
		<script src="js/init.js"></script>
</body>
</html>
