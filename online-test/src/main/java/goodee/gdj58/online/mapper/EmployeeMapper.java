package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Employee;

//기본적으로 dao 가져야 할 클래스를 만들어주고 상속받아 준다 
@Mapper 
public interface EmployeeMapper {
	  //이런식으로 쿼리만 annontation 안에 넣어주면 Mapper라는 SpringBean에서 부족한 부분으로 채워준다  
	List<Employee> selectEmployeeList(Map<String, Object> paramMap); //public, abstract 컴파일러가 만들어준다(인터페이스의 특징) 
	Integer addEmployee(Employee employee);
	Integer deleteEmployee(int empNo);
	Employee loginEmp(Employee emp);
}
