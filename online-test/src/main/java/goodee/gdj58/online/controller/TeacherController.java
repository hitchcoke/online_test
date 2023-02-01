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
import goodee.gdj58.online.service.TeacherService;
import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Teacher;

@Controller
public class TeacherController {
	@Autowired
	TeacherService teacherService;
	@Autowired
	IdService idService;
	
	
	@GetMapping("/teacher/teacherList")
	public String teacherList(HttpSession session,
			@RequestParam(value="currentPage", defaultValue= "1") int currentPage
			,@RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage,
			Model model) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp==null) {
			return "redirect:/employee/loginEmp";
		}
		List<Teacher> list=teacherService.getTeacherList(currentPage, rowPerPage);
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		
		return "teacher/teacherList";
	}
	
	@GetMapping("/teacher/deleteTeacher")
	public String DeleteTeacher( @RequestParam(value="teacherNo") int teacherNo, HttpSession session) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp==null) {
			return "redirect:/employee/loginEmp";
		}
		int row=teacherService.deleteTeacher(teacherNo);
		System.out.print(row);
		
		return "redirect:/teacher/teacherList";
	}
	
	@GetMapping("/teacher/addTeacher")
	public String addTeacher(HttpSession session, @RequestParam(value="row", defaultValue="0") int row, Model model) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp==null) {
			return "redirect:/employee/loginEmp";
		}
		model.addAttribute("row", row);
		
		return "teacher/addTeacher";
	}
	
	@PostMapping("/teacher/addTeacher")
	public String addTeacher(HttpSession session, Teacher t) {
		String ckid = idService.getIdCheck(t.getTeacherId());
		if(ckid==null) {
			teacherService.insertTeacher(t);
			return "redirect:/teacher/teacherList";
		}else {
			return "redirect:/teacher/addTeacher?row=1";
		}
		
	}
	
}
