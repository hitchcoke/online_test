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
import goodee.gdj58.online.service.IdService;
import goodee.gdj58.online.vo.Employee;

@Controller 
public class EmployeeController {
	
	@Autowired
	EmployeeService employeeService;
	
	@Autowired
	IdService idService;
	
	@GetMapping("/employee/modifyEmpPw")
	public String modifyEmpPw(HttpSession session, @RequestParam(value="row", defaultValue="0") int row, Model model) {
		
		model.addAttribute("row", row);
		return "employee/modifyEmpPw";
		
	}
	
	@PostMapping("/employee/modifyEmpPw")
	public String modifyEmpPw(HttpSession session, @RequestParam(value="oldPw") String oldPw, @RequestParam(value="newPw") String newPw) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
	
		System.out.println(oldPw + newPw +loginEmp.getEmpNo());
		int row=employeeService.updateEmpPw(loginEmp.getEmpNo(), oldPw, newPw);
		System.out.println(row);
		if(row==0) {
			return "redirect:/employee/modifyEmpPw?row=1";
		}
		
		return "redirect:/employee/empList";
	}
	
	
	@GetMapping("/loginEmp")
	public String loginEmp(HttpSession session, @RequestParam(value="row", defaultValue="0") int row, Model model) {
		
		model.addAttribute("row", row);
		return "employee/loginEmp";
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/loginEmp";
	}
	
	@PostMapping("/loginEmp")
	public String loginEmp(HttpSession session, Employee employee) {
		Employee loginEmp= employeeService.loginEmp(employee);
		
		if(loginEmp!=null) {
			
			session.setAttribute("loginEmp", loginEmp);
			
			return "redirect:/employee/empList";
		}
		
		return "redirect:/loginEmp?row=1";
		
		
	}
	
	
	@GetMapping("/employee/addEmp")
	public String addEmp(HttpSession session, @RequestParam(value="row", defaultValue="0") int row, Model model) {

		model.addAttribute("row", row);
		return "employee/addEmp";
	}
	
	@PostMapping("/employee/addEmp")
	public String addEmp(Employee employee) {//employee를 선언 하고 필드명과 input 명을 동일 하게 해주면 setter가 실행돼 들어간다
		String ckId= idService.getIdCheck(employee.getEmpId());
		
		if(ckId==null) {
			employeeService.insertEmployee(employee);
			
			return "redirect:/employee/empList";
		}else {
			return "redirect:/employee/addEmp?row=1";
		}
		
		 //sendRedirect , CM-> C
	}
	
	@GetMapping("/employee/empList")
	public String empList(Model model, HttpSession session,
			@RequestParam(value="currentPage", defaultValue= "1") int currentPage
			,@RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage
			,@RequestParam(value="searchWord", defaultValue="") String searchWord) {
		//request.getParameter를 대신함 알파로 (형변환도 해줌, 디폴트도 정할수 있음)

		List<Employee> list = employeeService.getEmployeeList(currentPage, rowPerPage, searchWord);
		int lastPage= employeeService.countEmp(searchWord, currentPage, rowPerPage);
		//request.setAttribute("list", list);
		
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("lastPage", lastPage);
		//model를 사용하여 view에서 볼 수 있게한다
		
		return "employee/empList";
	}
	@GetMapping("/employee/deleteEmp")
	public String deleteEmp(@RequestParam(value="empNo") int empNo, HttpSession session) {

		employeeService.deleteEmployee(empNo);
		
		return "redirect:/employee/empList";
	}
}
