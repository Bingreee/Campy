package campy.com.controller;

import java.security.SecureRandom;
import java.util.Date;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import campy.com.dto.EmailDto;
import campy.com.service.EmailService;

@RestController
public class EmailController {
	
	@Autowired
	private EmailService emailService;
	
	@RequestMapping("/send")
	public String[] sendMail(String emailAddress) throws Exception {

		EmailDto email = new EmailDto();

		String receiver = emailAddress; // Receiver.

		String subject = "Campy 회원가입 인증번호";

		String number = makeRandom();
		
		String content = "인증 번호는 "+number+"입니다.";
		
		email.setReceiver(receiver);
		email.setSubject(subject);
		email.setContent(content);

		Boolean result = emailService.sendMail(email);

		return new String[] {number, result.toString()};

	}
	private String makeRandom() {
		Random r = new Random();
		String number = "";
		for(int i = 0;i < 6; i++) {
			number += r.nextInt(10);
		}
		System.out.println("number:"+number);
		return number;
	}
	
	@RequestMapping("/sendPw")
	public String[] sendPwMail(String emailAddress) throws Exception {

		EmailDto email = new EmailDto();

		String receiver = emailAddress; // Receiver.

		String subject = "Campy 비밀번호 변경을 위한 인증문자";

		String randomPw = getRamdomPassword(8);
		
		String content = "인증문자는 "+randomPw+"입니다.";
		
		email.setReceiver(receiver);
		email.setSubject(subject);
		email.setContent(content);

		Boolean result = emailService.sendMail(email);

		return new String[] {randomPw, result.toString()};

	}
	
	public String getRamdomPassword(int size) {
		char[] charSet = new char[] {
		'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
		'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
		'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
		'!', '@', '#', '$', '%', '^', '&' };
		StringBuffer sb = new StringBuffer();
		SecureRandom sr = new SecureRandom();
		sr.setSeed(new Date().getTime());
		int idx = 0;
		int len = charSet.length;
		for (int i=0; i<size; i++) {
		idx = sr.nextInt(len); 
		sb.append(charSet[idx]);
		}
		return sb.toString();
		}
}

