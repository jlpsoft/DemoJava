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
<body class="grey lighten-3">

<div>
	<!-- Dropdown Structure -->
	<ul id="dropdown1" class="dropdown-content center-align">
		<li><a class="center-align" href="listEmployee.jsp">Listado de Empleado</a></li>
		<li><a class="center-align" href="insertEmployee.jsp">Agregar Empleado</a></li>
		<li class="divider"></li>
	</ul>
	<ul id="dropdown2" class="dropdown-content">
		<li><a class="center-align" href="listEmployee.jsp">Listado de Empleado</a></li>
		<li><a class="center-align" href="insertEmployee.jsp">Agregar Empleado</a></li>
		<li class="divider"></li>
	</ul>
	<nav class=" grey darken-4" role="navigation">
		<div class="nav-wrapper container">
			<a  id="logo-container" class=" center brand-logo">Proyecto JAVA</a>
			<a href="" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
			<ul class="left hide-on-med-and-down">
				<!-- Dropdown Trigger -->
				<li><a href="listEmployee.jsp">Inicio</a></li>
				<li><a class="dropdown-button" href="#!" data-activates="dropdown1">Menu<i class="material-icons right">arrow_drop_down</i></a></li>
			</ul>
			<!-- mobile -->
			<ul class="side-nav grey lighten-4" id="mobile-demo">
				<div>
					<li><a href="#">Inicio</a></li>
					<!-- Dropdown Trigger -->
					<li><a class="dropdown-button" href="#!" data-activates="dropdown2">Menu<i class="material-icons right">arrow_drop_down</i></a></li><br>
				</div>
			</ul>
		</div>
	</nav>



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
				<td>
					<a class="waves-effect waves-light btn"><input type="submit" value="Agregar" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a class="waves-effect waves-light btn"><input type="reset" value="Limpiar" /></a>
				</td>
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