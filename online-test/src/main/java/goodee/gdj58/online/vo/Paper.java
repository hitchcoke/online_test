package goodee.gdj58.online.vo;

import lombok.Data;

@Data 
public class Paper {
	private int testId;
	private String testTitle;
	private String testDate;
	private int grade;
	private int questionNo;
	private int paperNo;
	private int studentNo;
	private int answer;
	private int exampleNo;
	
	private int questionIdx;
	private String questionTitle;

	private int exampleIdx;
	private String exampleOx;
	private String exampleTitle;
}
