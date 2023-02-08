package goodee.gdj58.online.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import goodee.gdj58.online.vo.DateData;
import goodee.gdj58.online.vo.Paper;
import goodee.gdj58.online.vo.Score;
import goodee.gdj58.online.vo.Student;
import goodee.gdj58.online.vo.Test;
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
	
	@GetMapping("student/paper")
	public String paper(HttpSession session, @RequestParam(value="testId" ) int testId, Model model,
			 @RequestParam(value="row" ,defaultValue="0") int row) {
		Student loginStu = (Student)session.getAttribute("loginStu");
		Paper p = new Paper();
		p.setStudentNo(loginStu.getStudentNo());
		p.setTestId(testId);
		if(studentService.scoreCk(p)==1) {
			return "redirect:/student/home?row=1";
		}
		Test t= teacherService.testOne(testId);
		model.addAttribute("t", t);
		List<Paper> list = studentService.selectForPaper(testId);
		List<Paper> answer= studentService.paperCkAnswer(p);
		model.addAttribute("row", row);
		
		model.addAttribute("answer", answer);
		model.addAttribute("list", list);
		model.addAttribute("testId", testId);
		return "student/paper";
	}
	
	@PostMapping("student/addPaper")
	public String addPaper(HttpSession session, @RequestParam(value="testId" ) int testId,
			@RequestParam(value="questionNo" ) int questionNo,
			@RequestParam(value="answer" ) int answer) {
		
		Paper p = new Paper();
		Student loginStu = (Student)session.getAttribute("loginStu");
		p.setStudentNo(loginStu.getStudentNo());
		p.setAnswer(answer);
		p.setTestId(testId);
		p.setQuestionNo(questionNo);
		
		studentService.addPaper(p);
		
		return "redirect:/student/paper?testId="+testId;
	}
	
	@PostMapping("student/addScore")
	public String addScore(HttpSession session, @RequestParam(value="testId") int testId) {
		Student loginStu = (Student)session.getAttribute("loginStu");
		Paper p = new Paper();
		p.setTestId(testId);		
		p.setStudentNo(loginStu.getStudentNo());
		if(studentService.CkPaper(p)==1) {
			studentService.insertScore(p);
			return "redirect:/student/answerPaper?testId="+p.getTestId();
		}else {
			return "redirect:/student/paper?testId="+p.getTestId()+"&row=1";
		}
	}
	
	@GetMapping("student/myScore")
	public String myScore(HttpSession session, Model model) {
		Student loginStu = (Student)session.getAttribute("loginStu");
		List<Score> list = studentService.myScoreByStudentNo(loginStu.getStudentNo());
		model.addAttribute("list", list);
		
		return "student/myScore";
	}
	
	@PostMapping("/loginStu")
	public String logingStu(HttpSession session, 
			@RequestParam(value="Id") String id,
			 @RequestParam(value="Pw") String pw) {
		Student stu = new Student();
		stu.setStudentId(id);
		stu.setStudentPw(pw);
		
		Student loginStu = (Student)studentService.loginStudent(stu); 
		if(loginStu!=null) {
			
			session.setAttribute("loginStu", loginStu);
			return "redirect:/student/home";
		}
		
		
		return "redirect:/login?row=1";
	}
	
	@GetMapping("student/home")
	public String calendar(Model model, HttpServletRequest request, DateData dateData, HttpSession session, @RequestParam(value="row" ,defaultValue="0") int row){
		Student loginStu = (Student)session.getAttribute("loginStu"); 
		List<Test> tlist = teacherService.selectTestList(loginStu.getGrade());
		model.addAttribute("tlist", tlist);
			
		Calendar cal = Calendar.getInstance();
		DateData calendarData;
			//검색 날짜
		if(dateData.getDate().equals("")&&dateData.getMonth().equals("")){
			dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)),String.valueOf(cal.get(Calendar.MONTH)),String.valueOf(cal.get(Calendar.DATE)),null);
		}
			//검색 날짜 end

		Map<String, Integer> today_info =  dateData.today_info(dateData);
		List<DateData> dateList = new ArrayList<DateData>();
			
			//실질적인 달력 데이터 리스트에 데이터 삽입 시작.
			//일단 시작 인덱스까지 아무것도 없는 데이터 삽입
		for(int i=1; i<today_info.get("start"); i++){
			calendarData= new DateData(null, null, null, null);
			dateList.add(calendarData);
			}
			
			//날짜 삽입
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			if(i==today_info.get("today")){
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "today");
			}else{
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "normal_date");
			}
			dateList.add(calendarData);
			}

			//달력 빈곳 빈 데이터로 삽입
		int index = 7-dateList.size()%7;
			
		if(dateList.size()%7!=0){
				
		for (int i = 0; i < index; i++) {
			calendarData= new DateData(null, null, null, null);
			dateList.add(calendarData);
			}
		}
		System.out.println(dateList);
			
			//배열에 담음
		model.addAttribute("row", row);
		model.addAttribute("dateList", dateList);		//날짜 데이터 배열
		model.addAttribute("today_info", today_info);
		return "student/home";
		}
	
	@GetMapping("student/answerPaper")
	public String answerPaper(HttpSession session, @RequestParam(value="testId" ) int testId, Model model,
			 @RequestParam(value="row" ,defaultValue="0") int row) {
		Student loginStu = (Student)session.getAttribute("loginStu");
		Paper p = new Paper();
		p.setStudentNo(loginStu.getStudentNo());
		p.setTestId(testId);
		Test t= teacherService.testOne(testId);
		model.addAttribute("t", t);
		List<Paper> list = studentService.selectForPaper(testId);
		List<Paper> answer= studentService.paperCkAnswer(p);
		model.addAttribute("row", row);
		
		model.addAttribute("answer", answer);
		model.addAttribute("list", list);
		
		
		
		return "student/answerPaper";
	}
	
	
}
