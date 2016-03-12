<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ page import="java.util.*" %>
<%@ page import="pe.com.jlpsoft.demojava.model.dao.DaoEmployee" %>
<%@ page import="pe.com.jlpsoft.demojava.model.dto.BeanEmployee" %>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<meta name="generator" content="Bootply" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
	<link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
	<link href="css/styles.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="css/style.css" type="text/css" />
    <meta charset="utf-8">
	<title>List Employees</title>
</head>
<body class="grey lighten-3">

<div>
	<!-- Dropdown Structure -->
	<ul id="dropdown1" class="dropdown-content center-align">
		<li><a class="center-align" href="AfficherLesUtlisateurs.jsp">Listado de Empleado</a></li>
		<li><a class="center-align" href="AjouterUtilisateur.jsp">Agregar Empleado</a></li>
		<li class="divider"></li>
		<li><a class="center-align" href="ModifierUtilisateur.jsp">Modificar Empleado</a></li>
	</ul>
	<ul id="dropdown2" class="dropdown-content">
		<li><a class="center-align" href="AjouterUtilisateur.jsp">Agregar Empleado</a></li>
		<li><a class="center-align" href="AfficherLesUtlisateurs.jsp">Listado de Empleado</a></li>
		<li class="divider"></li>
		<li><a class="center-align" href="ModifierUtilisateur.jsp">Modificar Empleado</a></li>
	</ul>
	<nav class=" grey darken-4" role="navigation">
		<div class="nav-wrapper container">
			<a  id="logo-container" class=" center brand-logo">Proyecto JAVA</a>
			<a href="" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
			<ul class="left hide-on-med-and-down">
				<!-- Dropdown Trigger -->
				<li><a href="index.jsp">Inicio</a></li>
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
</div>
<%
	DaoEmployee dao = new DaoEmployee();
	List<BeanEmployee> employeeList  = dao.getAllEmployees();
	Iterator<BeanEmployee> itr  = employeeList.iterator();
	BeanEmployee employee = null;
%>
<table class="highlight centered responsive-table">
    <caption><h1>Employees</h1></caption><br/><br/>
	<tr>
		<th>employee_id</th>
		<th>job_id</th>
		<th>manager_id</th>
		<th>department_id</th>
		<th>first_name</th>
		<th>last_name</th>
		<th>email</th>
		<th>phone_number</th>
		<th>hire_date</th>
		<th>salary</th>
		<th>commission_pct</th>
	</tr>
	<tr>
		<%
		while(itr.hasNext()) {
                    employee = itr.next();
		%>
			<td><%= employee.getEmployee_id()  %></td>
			<td><%= employee.getJob_id()  	  %></td>
			<td><%= employee.getManager_id()   %></td>
			<td><%= employee.getDepartment_id()%></td>
			<td><%= employee.getFirst_name()   %></td>
			<td><%= employee.getLast_name()    %></td>
			<td><%= employee.getEmail()  	  %></td>
			<td><%= employee.getPhone_number() %></td>
			<td><%= employee.getHire_date()    %></td>
			<td><%= employee.getSalary()  	  %></td>
			<td><%= employee.getCommission_pct()%></td>
			<td>
				<form method="POST" action="EmployeeServlet">
					<button class="edit">Editar</button>
					<input type="hidden" name="action" value="editForm" >
					<input type="hidden" name="employee_id" value="<%= employee.getEmployee_id() %>" >
				</form>
			</td>
			<td>
				<form method="POST" action="EmployeeServlet">
					<button class="effacer" onclick="if(!confirm('Desea eliminar empleado ?')) return false;">Eliminar</button>
					<input type="hidden" name="action" value="delete" >
					<input type="hidden" name="employee_id" value="<%= employee.getEmployee_id() %>" >
				</form>
                            
			</td>
		</tr>
		<%
			}
		%>
</table>
<div class="lien">
    <p><a href="EmployeeServlet?action=insert" >Agregar Empleado</a></p>
</div>

<!--Import jQuery before materialize.js-->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="js/materialize.min.js"></script>
<script src="js/materialize.js"></script>
<script src="js/init.js"></script>
</body>
</html>














