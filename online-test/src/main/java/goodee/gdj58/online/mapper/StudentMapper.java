package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Student;

@Mapper
public interface StudentMapper {
	List<Student> selectStudentList(Map<String, Object> paramMap);
	Integer addStudent(Student s);
	Integer deleteStudent(int studentNo);
	Student loginStudent(Student s);
	Integer countStu(String searchWord);
}
