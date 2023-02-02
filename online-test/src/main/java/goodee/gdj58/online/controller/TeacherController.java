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
import goodee.gdj58.online.vo.Teacher;

@Controller
public class TeacherController {
	@Autowired
	TeacherService teacherService;
	@Autowired
	IdService idService;
	
	
	@GetMapping("/employee/teacherList")
	public String teacherList(HttpSession session,
			@RequestParam(value="currentPage", defaultValue= "1") int currentPage
			,@RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage
			,@RequestParam(value="searchWord", defaultValue="") String searchWord,
			Model model) {

		List<Teacher> list=teacherService.getTeacherList(currentPage, rowPerPage, searchWord);
		int lastPage= teacherService.countTea(searchWord, currentPage, rowPerPage);
		int row=1;
		if(currentPage>3) {
			row=currentPage-2;
		}
		model.addAttribute("row", row);
		model.addAttribute("list", list);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		
		return "teacher/teacherList";
	}
	
	@GetMapping("/employee/deleteTeacher")
	public String DeleteTeacher( @RequestParam(value="teacherNo") int teacherNo, HttpSession session) {

		int row=teacherService.deleteTeacher(teacherNo);
		System.out.print(row);
		
		return "redirect:/employee/teacherList";
	}
	
	@GetMapping("/employee/addTeacher")
	public String addTeacher(HttpSession session, @RequestParam(value="row", defaultValue="0") int row, Model model) {

		model.addAttribute("row", row);
		
		return "teacher/addTeacher";
	}
	
	@PostMapping("/employee/addTeacher")
	public String addTeacher(HttpSession session, Teacher t) {
		String ckid = idService.getIdCheck(t.getTeacherId());
		if(ckid==null) {
			teacherService.insertTeacher(t);
			return "redirect:/employee/teacherList";
		}else {
			return "redirect:/employee/addTeacher?row=1";
		}
		
	}
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
}
