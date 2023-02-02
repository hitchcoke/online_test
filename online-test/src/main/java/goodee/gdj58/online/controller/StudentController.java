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
import goodee.gdj58.online.vo.Student;

@Controller
public class StudentController {
	@Autowired
	StudentService studentService;
	@Autowired
	IdService idService;
	@GetMapping("/employee/studentList")
	public String StudentList(HttpSession session,
			@RequestParam(value="currentPage", defaultValue= "1") int currentPage
			,@RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage
			,@RequestParam(value="searchWord", defaultValue="") String searchWord,
			Model model) {
		int lastPage= studentService.countStu(searchWord, currentPage, rowPerPage);
		List<Student> list=studentService.getStudentList(currentPage, rowPerPage, searchWord);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		
		return "student/studentList";
	}
	
	@GetMapping("/employee/deleteStudent")
	public String DeleteStudent( @RequestParam(value="studentNo") int studentNo, HttpSession session) {

		int row=studentService.deleteStudent(studentNo);
		System.out.print(row);
		
		return "redirect:/employee/studentList";
	}
	
	@GetMapping("/employee/addStudent")
	public String addStudent(HttpSession session, @RequestParam(value="row", defaultValue="0") int row, Model model) {

		model.addAttribute("row", row);
		
		return "student/addStudent";
	}
	
	@PostMapping("/employee/addStudent")
	public String addStudent(HttpSession session, Student t) {
		String ckid = idService.getIdCheck(t.getStudentId());
		if(ckid==null) {
			studentService.insertStudent(t);
			return "redirect:/employee/studentList";
		}else {
			return "redirect:/employee/addStudent?row=1";
		}
		
	}
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
}
