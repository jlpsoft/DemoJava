<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
	<link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
	<link href="css/styles.css" rel="stylesheet" type="text/css"/>
	<!--<link rel="stylesheet" href="css/style.css" type="text/css" />-->
	<title>New Employee</title>
</head>
<body>

	<form method="POST" action="EmployeeServlet">
		<div class="container">
			<div class="row">
		<input type="hidden" name="action" value="insert" />
		<table class="highlight centered responsive-table">
			<caption><h1>Agregar Nuevo Empleado</h1></caption>
			<tr>
				<td><input type="text" name="employee_id" placeholder="Employee Id" /> </td>
			</tr>
			<tr>
				<td><input type="text" name="job_id" placeholder="job_id" /></td>
			</tr>
			<tr>
				<td><input type="text" name="manager_id"  placeholder="manager_id" /></td>
			</tr>
			<tr>
				<td><input type="text" name="department_id"  placeholder="department_id" /></td>
			</tr>
			<tr>
				<td><input type="text" name="first_name"  placeholder="first_name" /></td>
			</tr>
			<tr>
				<td><input type="text" name="last_name"  placeholder="last_name" /></td>
			</tr>
			<tr>
				<td><input type="text" name="email"  placeholder="email" /></td>
			</tr>
			<tr>
				<td><input type="text" name="phone_number"  placeholder="phone_number" /></td>
			</tr>
			<tr>
				<td><input type="text" name="hire_date"  placeholder="hire_date" /></td>
			</tr>
			<tr>
				<td><input type="text" name="salary"  placeholder="salary" /></td>
			</tr>
			<tr>
				<td><input type="text" name="commission_pct"  placeholder="commission_pct" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="Agregar" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="Cancelar" /></td>
			</tr>
		</table>
			</div>
		</div>
	</form>

	<!--Import jQuery before materialize.js-->
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="js/materialize.min.js"></script>
	<script src="js/materialize.js"></script>
	<script src="js/init.js"></script>
</body>
</html>