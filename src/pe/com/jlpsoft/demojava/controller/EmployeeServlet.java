package pe.com.jlpsoft.demojava.controller;

import pe.com.jlpsoft.demojava.model.dto.BeanEmployee;
import pe.com.jlpsoft.demojava.model.dao.DaoEmployee;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.text.DecimalFormat;

//@WebServlet(name = "EmployeeServlet")
public class EmployeeServlet extends HttpServlet {
    private static final String UserRecord = null;
    private static String insert = "/insertEmployee.jsp";
    private static String edit = "/editEmployee.jsp";
    private static String delete = "/deleteEmployee.jsp";
    private static String list = "/listEmployee.jsp";


    private DaoEmployee daoEmployee;

    public EmployeeServlet(){
        super();
        daoEmployee=new DaoEmployee();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String redirect = "";
        String employeeId = request.getParameter("employee_id");
        String action = request.getParameter("action");
        if(  employeeId != null && action.equalsIgnoreCase("insert")){
            BeanEmployee employee = new BeanEmployee();
            System.out.println("Id : " + employeeId);
            System.out.println("Job : " + request.getParameter("job_id"));
            System.out.println("Manager : " + request.getParameter("manager_id"));
            System.out.println("Department : " + request.getParameter("department_id"));
            System.out.println("First Name : " + request.getParameter("first_name"));
            System.out.println("Last Name : " + request.getParameter("last_name"));
            System.out.println("Email : " + request.getParameter("email"));
            System.out.println("Phone Number : " + request.getParameter("phone_number"));
            System.out.println("Hire Date : " + request.getParameter("hire_date"));
            System.out.println("Salary : " + request.getParameter("salary"));
            System.out.println("Commission : " + request.getParameter("commission_pct"));

            employee.setEmployee_id(Integer.parseInt(employeeId));
            employee.setJob_id(request.getParameter("job_id"));
            employee.setManager_id(Integer.parseInt(request.getParameter("manager_id")));
            employee.setDepartment_id(Integer.parseInt(request.getParameter("department_id")));
            employee.setFirst_name( request.getParameter("first_name"));
            employee.setLast_name(request.getParameter("last_name"));
            employee.setEmail(request.getParameter("email"));
            employee.setPhone_number(request.getParameter("phone_number"));
            employee.setHire_date(Date.valueOf(request.getParameter("hire_date")));
            BigDecimal salary=new BigDecimal(request.getParameter("salary"));
            employee.setSalary(salary);
            BigDecimal commission=new BigDecimal(request.getParameter("commission_pct"));
            employee.setCommission_pct(commission);
            //employee.setSalary(Float.parseFloat(request.getParameter("salary")));
            //employee.setCommission_pct(Float.parseFloat(request.getParameter("commission_pct")));
            daoEmployee.addEmployee(employee);
            redirect = list;
            request.setAttribute("employees",daoEmployee.getAllEmployees());
            System.out.println("Inserción de Empleado Correcto");
        }

        else if(action.equalsIgnoreCase("delete")){
            daoEmployee.removeEmployee(Integer.parseInt(employeeId));
            redirect = list;
            request.setAttribute("listEmployees",daoEmployee.getAllEmployees());
            System.out.println("El Empleado fue Eliminado Correctamente");
        }
        else if(action.equalsIgnoreCase("editForm")){
            request.setAttribute("employee_id", request.getParameter("employee_id"));
            redirect = edit;
        }
        else if(action.equalsIgnoreCase("edit")){
            BeanEmployee employee = new BeanEmployee();
            //employee.setEmployee_id(Integer.parseInt(employeeId));
            employee.setEmployee_id(Integer.parseInt(request.getParameter("employee_id")));
            employee.setJob_id(request.getParameter("job_id"));
            employee.setManager_id(Integer.parseInt(request.getParameter("manager_id")));
            employee.setDepartment_id(Integer.parseInt(request.getParameter("department_id")));
            employee.setFirst_name( request.getParameter("first_name"));
            employee.setLast_name(request.getParameter("last_name"));
            employee.setEmail(request.getParameter("email"));
            employee.setPhone_number(request.getParameter("phone_number"));
            employee.setHire_date(Date.valueOf(request.getParameter("hire_date")));

            BigDecimal salary=new BigDecimal(request.getParameter("salary"));
            employee.setSalary(salary);
            BigDecimal commission=new BigDecimal(request.getParameter("commission_pct"));
            employee.setCommission_pct(commission);

            daoEmployee.editEmployee(employee);
            request.setAttribute("listEmployees", employee);
            redirect = list;
            System.out.println("Empleado fue modificado con éxito");
        }
        else if(action.equalsIgnoreCase("listEmployees")){
            request.setAttribute("listEmployees", daoEmployee.getAllEmployees());
        }else{
            redirect = insert;
        }
        RequestDispatcher rd = request.getRequestDispatcher(redirect);
        rd.forward(request, response);
    }
}