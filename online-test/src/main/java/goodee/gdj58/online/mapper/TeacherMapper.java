package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Question;
import goodee.gdj58.online.vo.Teacher;
import goodee.gdj58.online.vo.Test;

@Mapper
public interface TeacherMapper {
	//emp에서 관리할 강사
	List<Teacher> selectTeacherList(Map<String, Object> paramMap);
	//강사추가by emp
	Integer addTeacher(Teacher t);
	//강사삭제
	Integer deleteTeacher(int teacherNo);
	//로그인
	Teacher loginTeacher(Teacher t);
	//강사 리스트 페이징 필요카운트
	Integer countTea(String searchWord);
	//시험리스트
	List<Test> selectTestbyTeacher(int grade);
	//문제리스트
	List<Question> selectTestQuestion(int testId);
	//보기리스트
	List<Example> selectTestExample(int questionNo);
	//문제추가
	Integer addQuestion(Question q);
	//보기추가
	Integer addExample(Example e);
	//문제추가
	Integer addTest(Test t);
	
	Test testOne(int testId);
	Question questionOne(int questionNo);
	Example exampleOne(int exampleNo);
	
	Integer deleteTest(int testId);
	Integer deleteQuestion(int questionNo);
	Integer deleteExample(int exampleNo);
	
	//삭제 실패시 vision을바꿔 안보이게하기
	Integer updateTestvi(int testId);
	Integer updateQuestionVi(int questionNo);
	
	//update 문
	
	Integer updateTest(Test t);
	Integer updateQuestion(Question q);
	Integer updateExample(Example e);
	
	//test의 active가 100%0일때만 활성화 점수도 표시를 위한 count문과 update 문
	
	Integer countQuestionByTest(int testId);
	Integer activeTest(int testId);
	Integer deactiveTest(int testId);
}
