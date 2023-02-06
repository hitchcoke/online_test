package goodee.gdj58.online.controller;

import java.util.HashMap;
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
import goodee.gdj58.online.service.TeacherService;
import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Question;
import goodee.gdj58.online.vo.Student;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class StudentController {
	@Autowired
	StudentService studentService;
	
	@Autowired
	TeacherService teacherService;
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
		int row=1;
		if(currentPage>3) {
			row=currentPage-2;
		}
		model.addAttribute("row", row);
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
	
	@GetMapping("/paper")
	public String paper(HttpSession session, @RequestParam(value="testId" ) int testId, Model model) {
		List<Question> qList= teacherService.selectTestQuestion(testId);
		
		model.addAttribute("qList", qList);
		for(Question q : qList) {
			List<Example> eList = teacherService.selectTestExample(q.getQuestionNo());
			model.addAttribute(q.getQuestionNo()+q.getQuestionTitle(), eList);		

			
			log.debug("\u001B[31m"+'1'+q.getQuestionNo()+'2'+q.getQuestionTitle()+'3');
			
		}
	
		
		
		
		
		
		return "student/paper";
	}
	
	
}
