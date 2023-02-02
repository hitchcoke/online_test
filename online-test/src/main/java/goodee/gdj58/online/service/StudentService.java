package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.StudentMapper;
import goodee.gdj58.online.vo.Student;

@Service
@Transactional 
public class StudentService {
	@Autowired 
	private StudentMapper studentMapper;
	
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
}
