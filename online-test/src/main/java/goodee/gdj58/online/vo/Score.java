package goodee.gdj58.online.vo;

import lombok.Data;

@Data
public class Score {
	private int studentNo;
	private String studentName;
	private int testId;
	private int score;
	private String testTitle;
	private String testDate;
}
