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
import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Question;
import goodee.gdj58.online.vo.Teacher;
import goodee.gdj58.online.vo.Test;

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
	
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// emp 영역
	
	
	@PostMapping("/loginTea")
	public String logingTea(HttpSession session, 
			@RequestParam(value="Id") String id,
			 @RequestParam(value="Pw") String pw) {
		Teacher tea = new Teacher();
		tea.setTeacherId(id);
		tea.setTeacherPw(pw);
		
		Teacher loginTea = teacherService.loginTeacher(tea);
		if(loginTea!=null) {
			
			session.setAttribute("loginTea", loginTea);
			return "redirect:/teacher/testList";
		}
		
		
		return "redirect:/login?row=1";
	}
	
	@GetMapping("/teacher/testList")
	public String testList(HttpSession session
			, Model model) {
		Teacher loginTea= (Teacher)session.getAttribute("loginTea");
		List<Test> list= teacherService.selectTestList(loginTea.getGrade());
		model.addAttribute("list", list);
		return "teacher/testList";
	}
	
	@GetMapping("/teacher/questionList")
	public String questionList(Model model, @RequestParam(value="testId") int testId) {
		List<Question> list= teacherService.selectTestQuestion(testId);
		model.addAttribute("list", list);
		Test t= teacherService.testOne(testId);
		int count= teacherService.countQuestion(testId);
		int score = 100/count;
		model.addAttribute("score", score);
		model.addAttribute("t", t);
		
		
		return "teacher/questionList";
	}
	
	@GetMapping("/teacher/exampleList")
	public String exampleList(Model model, @RequestParam(value="questionNo") int questionNo) {
		
		List<Example> list= teacherService.selectTestExample(questionNo);
		model.addAttribute("list", list);
		Question q = teacherService.questionOne(questionNo);
		model.addAttribute("q", q);
		
		
		return "teacher/exampleList";
	}
	@GetMapping("/teacher/deleteTest")
	public String deleteTest(@RequestParam(value="testId") int testId) {
		int row=teacherService.deleteTest(testId);
		
		return "redirect:/teacher/testList?row="+row;
	}
	
	@GetMapping("/teacher/deleteQuestion")
	public String deleteQuestion(@RequestParam(value="questionNo") int questionNo
								,@RequestParam(value="testId") int testId) {
		teacherService.deleteQuestion(questionNo, testId);
		
		return "redirect:/teacher/questionList?testId="+testId;
	}
	
	@GetMapping("/teacher/deleteExample")
	public String deleteExample(@RequestParam(value="questionNo") int questionNo
								,@RequestParam(value="exampleNo") int exampleNo) {
		teacherService.deleteExample(exampleNo);
		
		return "redirect:/teacher/exampleList?questionNo="+questionNo;
	}
	
	@GetMapping("/teacher/addTest")
	public String addTest(HttpSession session,Model model) {
		Teacher loginTea = (Teacher)session.getAttribute("loginTea");
		model.addAttribute("loginTea", loginTea);
		
		
		return "teacher/addTest";
	}
	@PostMapping("/teacher/addTest")
	public String addTest(HttpSession session,
			@RequestParam(value="testTitle") String testTitle,
			@RequestParam(value="testDate") String testDate) {
		Teacher loginTea = (Teacher)session.getAttribute("loginTea");
		teacherService.addTest(testTitle, testDate, loginTea.getGrade());
		return "redirect:/teacher/testList";
	}
	
	@GetMapping("/teacher/addQuestion")
	public String addQuestion(@RequestParam(value="testId") int testId, Model model) {
		model.addAttribute("testId", testId);
		
		return "teacher/addQuestion";
	}
	
	@PostMapping("/teacher/addQuestion")
	public String addQuestion(@RequestParam(value="testId") int testId,
			@RequestParam(value="questionIdx") int questionIdx,
			@RequestParam(value="questionTitle") String questionTitle) {
			teacherService.addQuestion(questionTitle, questionIdx, testId);
		return "redirect:/teacher/questionList?testId="+testId;
	}
	
	@PostMapping("/teacher/addExample")
	public String addExample(@RequestParam(value="questionNo") int questionNo,
			Example e) {

			teacherService.addExample(e);
		
		return "redirect:/teacher/exampleList?questionNo="+questionNo;
	}
	
	@PostMapping("/teacher/updateTest")
	public String updateTest(Test t) {
		teacherService.updateTest(t);
		
		return "redirect:/teacher/questionList?testId="+t.getTestId();
	}
	@PostMapping("/teacher/updateQuestion")
	public String updateQuestion(Question q) {
		teacherService.updateQuestion(q);
		
		return "redirect:/teacher/exampleList?questionNo="+q.getQuestionNo();
	}
	@PostMapping("/teacher/updateExample")
	public String updateExample(Example e) {
		teacherService.updateExample(e);

		return "redirect:/teacher/exampleList?questionNo="+e.getQuestionNo();
	}
}
