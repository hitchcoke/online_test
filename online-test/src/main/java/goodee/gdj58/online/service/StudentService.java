package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.StudentMapper;
import goodee.gdj58.online.mapper.TeacherMapper;
import goodee.gdj58.online.vo.Paper;
import goodee.gdj58.online.vo.Score;
import goodee.gdj58.online.vo.Student;

@Service
@Transactional 
public class StudentService {
	@Autowired 
	private StudentMapper studentMapper;
	@Autowired
	private TeacherMapper teacherMapper;
	
	public List<Student> getStudentList(int currentPage, int rowPerPage, String searchWord){
		int beginRow= (currentPage-1)*rowPerPage;
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		return studentMapper.selectStudentList(paramMap);
	}
	public Integer countStu(String searchWord, int currentPage, int rowPerPage) {
		int count= studentMapper.countStu(searchWord);
		int lastPage=count/rowPerPage;
		if(count%rowPerPage!=0) {
			lastPage++;
		}
		
		return lastPage;
	}
	
	public Integer insertStudent(Student Student) {
		
		return studentMapper.addStudent(Student);
	}
	public Integer deleteStudent(int empNo) {
		
		return studentMapper.deleteStudent(empNo);
	}
	public Student loginStudent(Student student) {
		
		return studentMapper.loginStudent(student);
	}
	public List<Paper> selectForPaper(int testId){
		
		
		return studentMapper.selectForPaper(testId);
	}
	
	public Integer addPaper(Paper p) {
		
		try{studentMapper.addPaper(p);
		
			
		}catch(Exception e) {
			studentMapper.updatePaper(p);
		}
		
		return 1;
	}
	
	public Integer insertScore(Paper p) {
		//test의 총 문제 갯수
		int countQuestion = teacherMapper.countQuestionByTest(p.getTestId());
		//test에서 맞은 갯수
		int countAnswer= studentMapper.selectForScore(p);
		
		
		//100/문제갯수* 맞은 문제 내 점수
		int score=100/countQuestion*countAnswer;
		
		Score s= new Score();
		
		s.setScore(score);
		s.setStudentNo(p.getStudentNo());
		s.setTestId(p.getTestId());
		
		return studentMapper.insertScore(s);
		
		
		
	}
	public List<Score> myScoreByStudentNo(int studentNo){
		
		
		return studentMapper.myScoreByStudentNo(studentNo);
	}
	
	public Integer CkPaper(Paper p) {
	
		int countQuestion = teacherMapper.countQuestionByTest(p.getTestId());
		int countAnswer= studentMapper.paperCkCount(p);
		if(countAnswer==countQuestion) {
			return 1;
		}
			return 0;
		
		
	}
	
	public List<Paper> paperCkAnswer(Paper p){
		return studentMapper.paperCkAnswer(p);
	}
	public Integer scoreCk(Paper p) {
		return studentMapper.scoreCk(p);
	}
}
