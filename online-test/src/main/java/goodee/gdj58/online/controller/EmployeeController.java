package goodee.gdj58.online.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.EmployeeService;
import goodee.gdj58.online.vo.Employee;

@Controller 
public class EmployeeController {
	
	@Autowired
	EmployeeService employeeService;
	
	@GetMapping("/employee/loginEmp")
	public String loginEmp(HttpSession session) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp!=null) {
			return "redirect:/employee/empList";
		}
		
		return "employee/loginEmp";
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/employee/loginEmp";
	}
	
	@PostMapping("/employee/loginEmp")
	public String loginEmp(HttpSession session, Employee employee) {
		Employee loginEmp= employeeService.loginEmp(employee);
		
		if(loginEmp!=null) {
			
			session.setAttribute("loginEmp", loginEmp);
			
			return "redirect:/employee/empList";
		}
		
		return "redirect:/employee/loginEmp";
		
		
	}
	
	
	@GetMapping("/employee/addEmp")
	public String addEmp(HttpSession session) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp==null) {
			return "redirect:/employee/loginEmp";
		}
		
		return "employee/addEmp";
	}
	
	@PostMapping("/employee/addEmp")
	public String addEmp(Employee employee) {//employee를 선언 하고 필드명과 input 명을 동일 하게 해주면 setter가 실행돼 들어간다
		
		employeeService.insertEmployee(employee);
	
		return "redirect:/employee/empList"; //sendRedirect , CM-> C
	}
	
	@GetMapping("/employee/empList")
	public String empList(Model model, HttpSession session,
			@RequestParam(value="currentPage", defaultValue= "1") int currentPage
			,@RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage) {
		//request.getParameter를 대신함 알파로 (형변환도 해줌, 디폴트도 정할수 있음)
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp==null) {
			return "redirect:/employee/loginEmp";
		}
		List<Employee> list = employeeService.getEmployeeList(currentPage, rowPerPage);
		
		//request.setAttribute("list", list);
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		//model를 사용하여 view에서 볼 수 있게한다
		
		return "employee/empList";
	}
	@GetMapping("/employee/deleteEmp")
	public String deleteEmp(@RequestParam(value="empNo") int empNo, HttpSession session) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp==null) {
			return "redirect:/employee/loginEmp";
		}
		employeeService.deleteEmployee(empNo);
		
		return "redirect:/employee/empList";
	}
}
