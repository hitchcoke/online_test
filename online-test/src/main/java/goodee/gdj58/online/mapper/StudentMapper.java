package goodee.gdj58.online.mapper;

import java.util.HashMap;
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
	
	Integer insertPaper(Paper p);
	Integer updatePaper(Paper p);
	
	Integer insertScore(Score s);
	 
		
}
