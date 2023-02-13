package goodee.gdj58.online.restController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.online.service.StudentService;
import goodee.gdj58.online.service.TeacherService;
import goodee.gdj58.online.vo.Score;

@RestController
public class ChartRestController {
	@Autowired
	StudentService studentService;
	@Autowired
	TeacherService teacherService;
	
	@GetMapping("/chartScore")
	public List<Score> chartScore(int studentNo){
		List<Score> list = studentService.myScoreByStudentNo(studentNo);
		
		
		return list;
	}
	@GetMapping("/scoreList")
	public List<Score> scoreList(int grade){
		List<Score> list= teacherService.selectScoreListByGrade(grade);
		return list;
	}
}
