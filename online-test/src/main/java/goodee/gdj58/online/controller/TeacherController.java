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
import goodee.gdj58.online.service.TeacherService;
import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Question;
import goodee.gdj58.online.vo.Score;
import goodee.gdj58.online.vo.Student;
import goodee.gdj58.online.vo.Teacher;
import goodee.gdj58.online.vo.Test;

@Controller
public class TeacherController {
	@Autowired
	TeacherService teacherService;

	@Autowired
	StudentService studentService;
	
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
		
			teacherService.insertTeacher(t);
			return "redirect:/employee/teacherList";
		
		
	}
	
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// emp 영역
	@GetMapping("/teacher/updateTea")
	public String updateTea(HttpSession session, @RequestParam(value="row", defaultValue="0") int row, Model model) {
		model.addAttribute("row", row);
		return  "teacher/updateTea";
	}
	
	@PostMapping("/teacher/updateTea")
	public String updateTea(HttpSession session, @RequestParam(value="oldPw") String oldPw, @RequestParam(value="newPw") String newPw) {
		Teacher tea = (Teacher)session.getAttribute("loginTea");
		int row=teacherService.updateTea(newPw, oldPw, tea.getTeacherId());
		if(row==0) {
			return "redirect:/teacher/updateTea?row=1";
		}
		
		return "redirect:/teacher/testList";
		
		
	}
	
	
	
	
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
	public String questionList(Model model, @RequestParam(value="testId") int testId,
			@RequestParam(value="row", defaultValue="0") int row) {
		List<Question> list= teacherService.selectTestQuestion(testId);
		model.addAttribute("list", list);
		Test t= teacherService.testOne(testId);
		int count= teacherService.countQuestion(testId);
		model.addAttribute("row", row);
		int score = 0;
		if(count!=0) {
			score=100/count;
		}
		int idx= 1;
		for(Question q : list) {
			idx++;
		}
		model.addAttribute("testId", testId);
		model.addAttribute("idx", idx);
		model.addAttribute("score", score);
		model.addAttribute("t", t);
		
		
		return "teacher/questionList";
	}
	
	@GetMapping("/teacher/exampleList")
	public String exampleList(Model model, @RequestParam(value="questionNo") int questionNo,
			@RequestParam(value="testId") int testId) {
		
		List<Example> list= teacherService.selectTestExample(questionNo);
		model.addAttribute("list", list);
		Question q = teacherService.questionOne(questionNo);
		model.addAttribute("q", q);
		int idx= 1;
		for(Example e : list) {
			idx++;
		}
		model.addAttribute("idx", idx);
		model.addAttribute("testId", testId);
		
		
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
								,@RequestParam(value="exampleNo") int exampleNo,
								@RequestParam(value="testId") int testId) {
		int row=teacherService.deleteExample(exampleNo);
		
		return "redirect:/teacher/exampleList?questionNo="+questionNo+"&testId="+testId+"&row="+row;
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
			@RequestParam(value="testId") int testId,
			Example e) {

			teacherService.addExample(e);
		
		return "redirect:/teacher/exampleList?questionNo="+questionNo+"&testId="+testId;
	}
	
	@PostMapping("/teacher/updateTest")
	public String updateTest(Test t) {
		teacherService.updateTest(t);
		
		return "redirect:/teacher/questionList?testId="+t.getTestId();
	}
	@PostMapping("/teacher/updateQuestion")
	public String updateQuestion(Question q,@RequestParam(value="testId") int testId) {
		teacherService.updateQuestion(q);
		
		return "redirect:/teacher/exampleList?questionNo="+q.getQuestionNo()+"&testId="+testId;
	}
	@PostMapping("/teacher/updateExample")
	public String updateExample(Example e,@RequestParam(value="testId") int testId) {
		teacherService.updateExample(e);

		return "redirect:/teacher/exampleList?questionNo="+e.getQuestionNo()+"&testId="+testId;
	}
	
	
	@GetMapping("/teacher/scoreList")
	public String scoreListByGrade(HttpSession session,Model model) {
		Teacher loginTea = (Teacher)session.getAttribute("loginTea");
		
		List<Score> list= teacherService.selectScoreListByGrade(loginTea.getGrade());
		model.addAttribute("list", list);

		return "teacher/scoreList";
	}
	
	@GetMapping("/teacher/myScoreByTeacher")
	public String myScore(HttpSession session, Model model, @RequestParam(value="studentNo") int studentNo
			,@RequestParam(value="studentName") String studentName) {
		
		List<Score> list = studentService.myScoreByStudentNo(studentNo);
		model.addAttribute("list", list);
		model.addAttribute("studentName", studentName);
		
		return "teacher/myScoreByTeacher";
	}
	
}
