package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.EmployeeMapper;
import goodee.gdj58.online.vo.Employee;

@Service 
@Transactional 
public class EmployeeService {
	@Autowired 
	private EmployeeMapper employeeMapper;
	
	public List<Employee> getEmployeeList(int currentPage, int rowPerPage){
		int beginRow= (currentPage-1)*rowPerPage;
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		return employeeMapper.selectEmployeeList(paramMap);
	}
	
	public Integer insertEmployee(Employee employee) {
		
		return employeeMapper.addEmployee(employee);
	}
	public Integer deleteEmployee(int empNo) {
		
		return employeeMapper.deleteEmployee(empNo);
	}
	public Employee loginEmp(Employee employee) {
		
		return employeeMapper.loginEmp(employee);
	}
}