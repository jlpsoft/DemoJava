package pe.com.jlpsoft.demojava.model.dao;

import pe.com.jlpsoft.demojava.model.dto.BeanEmployee;
import pe.com.jlpsoft.demojava.util.connection;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoEmployee {
    private Connection conn;

    public DaoEmployee(){
        conn= connection.getConnection();
    }

    public void addEmployee(BeanEmployee employee){
        try {
            String sql = "INSERT INTO employees(employee_id,job_id," +
                         "manager_id,department_id,first_name,last_name," +
                         "email,phone_number,hire_date,salary,commission_pct)" +
                         "VALUES(?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, employee.getEmployee_id());
            ps.setString(2,employee.getJob_id());
            ps.setInt(3,employee.getManager_id());
            ps.setInt(4,employee.getDepartment_id());
            ps.setString(5,employee.getFirst_name());
            ps.setString(6,employee.getLast_name());
            ps.setString(7,employee.getEmail());
            ps.setString(8,employee.getPhone_number());
            ps.setDate(9,employee.getHire_date());
            ps.setBigDecimal(10,employee.getSalary());
            ps.setBigDecimal(11,employee.getCommission_pct());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(" insert exception");
            e.printStackTrace();
        }
    }

    public void removeEmployee(int employee_id){
        try {
            String sql = "DELETE FROM employees WHERE employee_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, employee_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editEmployee(BeanEmployee employee){
        try {
            String sql = "UPDATE employees set job_id=? ,manager_id=?," +
                         "department_id=?,first_name=?,last_name=?," +
                         "email=?,phone_number=?,hire_date=?," +
                         "salary=?,commission_pct=? where employee_id=?;";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,employee.getJob_id());
            ps.setInt(2,employee.getManager_id());
            ps.setInt(3,employee.getDepartment_id());
            ps.setString(4,employee.getFirst_name());
            ps.setString(5,employee.getLast_name());
            ps.setString(6,employee.getEmail());
            ps.setString(7,employee.getPhone_number());
            ps.setDate(8,employee.getHire_date());
            ps.setBigDecimal(9,employee.getSalary());
            ps.setBigDecimal(10,employee.getCommission_pct());
            ps.setInt(11,employee.getEmployee_id());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List getAllEmployees(){
        List list_employees = new ArrayList();
        try {
            String sql = "SELECT * FROM employees";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                BeanEmployee employee = new BeanEmployee();
                employee.setEmployee_id(rs.getInt("employee_id"));
                employee.setJob_id(rs.getString("job_id"));
                employee.setManager_id(rs.getInt("manager_id"));
                employee.setDepartment_id(rs.getInt("department_id"));
                employee.setFirst_name(rs.getString("first_name"));
                employee.setLast_name(rs.getString("last_name"));
                employee.setEmail(rs.getString("email"));
                employee.setPhone_number(rs.getString("phone_number"));
                employee.setHire_date(rs.getDate("hire_date"));
                employee.setSalary(rs.getBigDecimal("salary"));
                employee.setCommission_pct(rs.getBigDecimal("commission_pct"));
                list_employees.add(employee);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list_employees;
    }

    public BeanEmployee getEmployeeById(int employee_id){
        BeanEmployee employee= new BeanEmployee();
        try {
            String sql = "SELECT * FROM employees WHERE employee_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, employee_id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                employee.setEmployee_id(rs.getInt("employee_id"));
                employee.setJob_id(rs.getString("job_id"));
                employee.setManager_id(rs.getInt("manager_id"));
                employee.setDepartment_id(rs.getInt("department_id"));
                employee.setFirst_name(rs.getString("first_name"));
                employee.setLast_name(rs.getString("last_name"));
                employee.setEmail(rs.getString("email"));
                employee.setPhone_number(rs.getString("phone_number"));
                employee.setHire_date(rs.getDate("hire_date"));
                employee.setSalary(rs.getBigDecimal("salary"));
                employee.setSalary(rs.getBigDecimal("commission_pct"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employee;
    }
}
