package goodee.gdj58.online.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelloConroller {
//	@GetMapping("/test") //get방식을 받는mapping , PostMapping은 post방식을 받는다 
//	public String test() {//return 타입 view이름이 없을 시 메서드 이름이 view 이름이 된다 
//		System.out.print("test");
//		 //view(jsp)
//	}
//
//	@RequestMapping(value="/test2")//Get, Post 방식 상관 없이 받을 수 있는 Mapping 
//	public String test2() {
//		System.out.println("test");
//		
//		return "test2";
//	}
	
	@GetMapping("/test")
	public ModelAndView test() {
		System.out.print("test");
		ModelAndView mv = new ModelAndView();
		//MAV란 객체를 사용하여 return하는 방법 
		mv.setViewName("test");
		
		return mv;
	}
}
