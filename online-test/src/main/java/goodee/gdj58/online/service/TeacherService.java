package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.TeacherMapper;
import goodee.gdj58.online.vo.Teacher;


@Service
@Transactional 
public class TeacherService {
	@Autowired 
	private TeacherMapper teacherMapper;
	
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
	public Teacher loginEmp(Teacher teacher) {
		
		return teacherMapper.loginTeacher(teacher);
	}
	

}
