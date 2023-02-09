package goodee.gdj58.online.restController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.online.service.IdService;

@RestController
public class IdRestController {
	
	@Autowired
	IdService idService;
	
	@GetMapping("/idCk")
	public String idCk(String id) {
		
		if(idService.getIdCheck(id)==null) {
			return "YES";
		}
		
		return "NO";
	}

}
