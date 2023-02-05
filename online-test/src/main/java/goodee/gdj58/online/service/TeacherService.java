package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.TeacherMapper;
import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Question;
import goodee.gdj58.online.vo.Teacher;
import goodee.gdj58.online.vo.Test;


@Service
@Transactional 
public class TeacherService {
	@Autowired 
	private TeacherMapper teacherMapper;
	
	public Teacher loginTeacher(Teacher t) {
		return teacherMapper.loginTeacher(t);
	}
	
	public List<Teacher> getTeacherList(int currentPage, int rowPerPage, String searchWord){
		int beginRow= (currentPage-1)*rowPerPage;
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		return teacherMapper.selectTeacherList(paramMap);
	}
	public Integer countTea(String searchWord, int currentPage, int rowPerPage) {
		int count= teacherMapper.countTea(searchWord);
		int lastPage=count/rowPerPage;
		if(count%rowPerPage!=0) {
			lastPage++;
		}
		
		return lastPage;
	}
	
	public Integer insertTeacher(Teacher teacher) {
		
		return teacherMapper.addTeacher(teacher);
	}
	public Integer deleteTeacher(int empNo) {
		
		return teacherMapper.deleteTeacher(empNo);
	}

	public Integer addQuestion(String questionTitle, int questionIdx, int testId) {
		Question q=  new Question();
		q.setQuestionIdx(questionIdx);
		q.setTestId(testId);
		q.setQuestionTitle(questionTitle);
		teacherMapper.addQuestion(q);
		
		if(100%teacherMapper.countQuestionByTest(testId)==0) {
			teacherMapper.activeTest(testId);
		}else {
			teacherMapper.deactiveTest(testId);
		}
		
		return 0;
	}
	public Integer addTest(String testTitle, String testDate, int grade) {
		Test t= new Test();
		t.setGrade(grade);
		t.setTestTitle(testTitle);
		t.setTestDate(testDate);
		
		
		return teacherMapper.addTest(t);
	}
	
	public Integer addExample(Example e) {
	
		return teacherMapper.addExample(e);
		
	}
	
	public List<Test> selectTestList(int grade){
		
		return teacherMapper.selectTestbyTeacher(grade);
	}
	public List<Question> selectTestQuestion(int testId){
		
		return teacherMapper.selectTestQuestion(testId);
	}
	
	public List<Example> selectTestExample(int questionNo){
		
		return teacherMapper.selectTestExample(questionNo);
	}

	public Test testOne(int testId) {
		
		return teacherMapper.testOne(testId);
	}
	public Question questionOne(int questionNo) {
		
		return teacherMapper.questionOne(questionNo);
		
	}
	
	public Example exampleOne(int exampleOne) {
		
		return teacherMapper.exampleOne(exampleOne);
	}
	
	public int deleteTest(int testId) {
		int row=teacherMapper.deleteTest(testId);
		
		if(row!=1) {
			row=teacherMapper.updateTestvi(testId);
		}
		
		return row;
		
	}
	
	public int deleteQuestion(int questionNo, int testId) {
		int row=teacherMapper.deleteQuestion(questionNo);
		if(row!=1) {
			row=teacherMapper.updateQuestionVi(questionNo);
		}
		if(100%teacherMapper.countQuestionByTest(testId)==0) {
			teacherMapper.activeTest(testId);
		}else {
			teacherMapper.deactiveTest(testId);
		}
		return row;
	}
	
	public Integer deleteExample(int exampleNo) {
		return teacherMapper.deleteExample(exampleNo);
	}
	
	public Integer updateTest(Test t) {


		return teacherMapper.updateTest(t);
	}
	
	public Integer updateQuestion(Question q) {

		return teacherMapper.updateQuestion(q);

	}
	
	public Integer updateExample(Example e) {
		
		
		return teacherMapper.updateExample(e);
	}
	
	public Integer countQuestion(int testId) {
		
		int count = teacherMapper.countQuestionByTest(testId);
		
		return count;
	}
}
