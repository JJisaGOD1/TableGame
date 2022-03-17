package com.tablegame.service.booking;

import java.io.File;
import java.text.SimpleDateFormat;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.tablegame.model.bean.booking.Booking;

@Service
public class EmailService {
	
	@Autowired
	private JavaMailSender mailSender;
	
	public void sendEmailImg(String toEmail,Booking book) throws MessagingException {
		MimeMessage mimeMessage = mailSender.createMimeMessage();
		
		 SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
        helper.setFrom("jack902221@gmail.com");
        helper.setTo(toEmail);
        helper.setSubject("主旨：瘋桌遊-訂位成功通知");
        
        
        helper.setText("<html><body><div style='text-align:center;'>"
        		+ "<img src=\"cid:Test\" width='500px'>"
        +"<h2>訂位成功_有任何問題_歡迎來電<h2>"
        +"\n"+"姓名: "+book.getUser().getCusName()
        +"--\n--"+"訂位人數: "+book.getNumber()
        +"--\n--"+"時段: "+book.getPeriod()
        +"--\n--"+"時間: "+ft.format(book.getReservation_date())
        +"--\n--"+"桌號: "+book.getSeveral()
        +"--\n--"+"備註: "+book.getRemark()
        + "<h3>讓我們一起投入桌遊的世界吧</h3>"
        + "<a href=\"http://localhost:8080/homepage/\"><h3>官方網址<h3></a>"
		+ "<h3>Best Regards</h3></div></body></html>", true);

        
        
        
         FileSystemResource file = new FileSystemResource
        		 (new File("C:/Git/tableGame/src/main/webapp/uploaded/dice-logo-mail.jpg"));
        
        helper.addInline("Test", file);
       

        mailSender.send(mimeMessage);
        
	}
	
	public void sendEmailText(String toEmail,Booking book) {
		 SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
		SimpleMailMessage message = new SimpleMailMessage();//寄文字訊息
		message.setFrom("jack902221@gmail.com");
		message.setTo(toEmail);
		message.setSubject("主旨：瘋桌遊-訂位成功通知");
		message.setText("訂位成功,有任何問題,歡迎來電"+"\n"+"姓名"+book.getUser().getCusName()+"\n"+
		        "訂位人數："+book.getNumber()+"\n"+"時段: "+book.getNumber()+"\n"+"桌號: "+book.getSeveral()+"\n"
		        +"備註:"+book.getRemark()+"\n"+"時間"+ft.format(book.getReservation_date()));
		
		mailSender.send(message);
	}
}
