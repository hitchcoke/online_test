package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Teacher;

@Mapper
public interface TeacherMapper {
	List<Teacher> selectTeacherList(Map<String, Object> paramMap);
	Integer addTeacher(Teacher t);
	Integer deleteTeacher(int teacherNo);
	Teacher loginTeacher(Teacher t);
}
