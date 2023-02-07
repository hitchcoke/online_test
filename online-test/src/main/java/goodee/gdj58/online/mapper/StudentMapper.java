package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Paper;
import goodee.gdj58.online.vo.Score;
import goodee.gdj58.online.vo.Student;

@Mapper
public interface StudentMapper {
	
	//emp, teacher 에서 활용할 리스트 
	List<Student> selectStudentList(Map<String, Object> paramMap);
	Integer addStudent(Student s);
	Integer deleteStudent(int studentNo);
	Integer countStu(String searchWord);
	
	//
	Student loginStudent(Student s);
	Integer updateStu(Map<String, Object> paramMap);
	List<Score> myScoreByStudentNo(int studentNo);
	
	
	//시험지관련메서드
	Integer selectForScore(Paper p);
	Integer addPaper(Paper p);
	Integer updatePaper(Paper p);
	Integer insertScore(Score s);
	List<Paper> selectForPaper(int testId);
	List<Paper> paperCkAnswer(Paper p);
	Integer paperCkCount(Paper p);
	Integer scoreCk(Paper p);
		
}
