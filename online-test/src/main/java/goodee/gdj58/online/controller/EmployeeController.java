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
	
	
	@GetMapping("/login")
	public String loginEmp(HttpSession session, @RequestParam(value="row", defaultValue="0") int row, Model model) {
		
		model.addAttribute("row", row);
		return "employee/loginEmp";
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}
	
	@PostMapping("/loginEmp")
	public String loginEmp(HttpSession session, 
			 @RequestParam(value="Id") String id,
			 @RequestParam(value="Pw") String pw) {
		Employee e= new Employee();
		e.setEmpId(id);
		e.setEmpPw(pw);
		Employee loginEmp= employeeService.loginEmp(e);
		
		if(loginEmp!=null) {
			
			session.setAttribute("loginEmp", loginEmp);
			
			return "redirect:/employee/empList";
		}
		
		return "redirect:/login?row=1";
		
		
	}
	
	
	@GetMapping("/employee/addEmp")
	public String addEmp(HttpSession session, @RequestParam(value="row", defaultValue="0") int row, Model model) {

		model.addAttribute("row", row);
		return "employee/addEmp";
	}
	
	@PostMapping("/employee/addEmp")
	public String addEmp(Employee employee) {//employee??? ?????? ?????? ???????????? input ?????? ?????? ?????? ????????? setter??? ????????? ????????????
		
		
		
			employeeService.insertEmployee(employee);
			
			return "redirect:/employee/empList";
		
		 //sendRedirect , CM-> C
	}
	
	@GetMapping("/employee/empList")
	public String empList(Model model, HttpSession session,
			@RequestParam(value="currentPage", defaultValue= "1") int currentPage
			,@RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage
			,@RequestParam(value="searchWord", defaultValue="") String searchWord) {
		//request.getParameter??? ????????? ????????? (???????????? ??????, ???????????? ????????? ??????)

		List<Employee> list = employeeService.getEmployeeList(currentPage, rowPerPage, searchWord);
		int lastPage= employeeService.countEmp(searchWord, currentPage, rowPerPage);
		//request.setAttribute("list", list);
		int row=1;
		if(currentPage>3) {
			row=currentPage-2;
		}
		model.addAttribute("row", row);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("lastPage", lastPage);
		//model??? ???????????? view?????? ??? ??? ????????????
		
		return "employee/empList";
	}
	@GetMapping("/employee/deleteEmp")
	public String deleteEmp(@RequestParam(value="empNo") int empNo, HttpSession session) {

		employeeService.deleteEmployee(empNo);
		
		return "redirect:/employee/empList";
	}
}
