package goodee.gdj58.online.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.IdService;
import goodee.gdj58.online.service.StudentService;
import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Student;

@Controller
public class StudentController {
	@Autowired
	StudentService studentService;
	@Autowired
	IdService idService;
	
	
	@GetMapping("/student/studentList")
	public String StudentList(HttpSession session,
			@RequestParam(value="currentPage", defaultValue= "1") int currentPage
			,@RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage,
			Model model) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp==null) {
			return "redirect:/employee/loginEmp";
		}
		List<Student> list=studentService.getStudentList(currentPage, rowPerPage);
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		
		return "student/studentList";
	}
	
	@GetMapping("/student/deleteStudent")
	public String DeleteStudent( @RequestParam(value="studentNo") int studentNo, HttpSession session) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp==null) {
			return "redirect:/employee/loginEmp";
		}
		int row=studentService.deleteStudent(studentNo);
		System.out.print(row);
		
		return "redirect:/student/studentList";
	}
	
	@GetMapping("/student/addStudent")
	public String addStudent(HttpSession session, @RequestParam(value="row", defaultValue="0") int row, Model model) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp==null) {
			return "redirect:/employee/loginEmp";
		}
		model.addAttribute("row", row);
		
		return "student/addStudent";
	}
	
	@PostMapping("/student/addStudent")
	public String addStudent(HttpSession session, Student t) {
		String ckid = idService.getIdCheck(t.getStudentId());
		if(ckid==null) {
			studentService.insertStudent(t);
			return "redirect:/student/studentList";
		}else {
			return "redirect:/student/addStudent?row=1";
		}
		
	}
	
}
