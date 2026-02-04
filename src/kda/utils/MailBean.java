package kda.utils;


import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import kda.common.data.KDA_MAIL;
import kda.mypage.MyPageHController;


public class MailBean {

	private Log log = LogFactory.getLog(MailBean.class);
	

	public boolean sendMail(KDA_MAIL mail) throws Exception {
		return sendMail(mail.getFrom(), mail.getFromName(), mail.getToEmail(), mail.getMailTitle(),mail.getMailBody());
	}


	public boolean sendMail ( String from, String fromName, String toEmail, String mailTitle, String mailBody )  {
		
		// final String username = "kabdols1@gmail.com";
		// final String password = "dkwhd08280";
		// final String username = "aracaracarac@gmail.com";
		// final String password = "dkwhd0828";
		Properties props = new Properties();
		props.put("mail.smtp.host", "210.127.55.231");
		
		// props.put("mail.smtp.auth", "true");
		// props.put("mail.smtp.starttls.enable", "true");
		// props.put("mail.smtp.port", "587");

		Session sess = Session.getInstance(props, null);
		boolean isSuccess = true;
		try {

			// create a message
			Message msg = new MimeMessage(sess);
			InternetAddress fadd = new InternetAddress();

			// 추후에 다량 발송을 위해서
			InternetAddress[] address = { new InternetAddress(toEmail) };

			fadd.setAddress(from); // 보내는 사람 email
			fadd.setPersonal(fromName, "EUC-KR");// 보내는 사람이름

			msg.setRecipients(Message.RecipientType.TO, address);
			msg.setFrom(fadd);
			msg.setSubject(mailTitle);
			msg.setSentDate(new Date());

			msg.setContent(mailBody, "text/html;charset=euc-kr"); // HTML형식
			Transport.send(msg);
		} catch (MessagingException me) {
			log.error(me);
			isSuccess = false;
		} catch (Exception e) {
			isSuccess = false;
			return isSuccess;
		}
		
		return isSuccess;
	}	
	
public boolean sendMailCc ( String from, String fromName, String toEmail, String mailTitle, String mailBody, String ccEmail )  {
		
		// final String username = "kabdols1@gmail.com";
		// final String password = "dkwhd08280";
		// final String username = "aracaracarac@gmail.com";
		// final String password = "dkwhd0828";
		Properties props = new Properties();
		props.put("mail.smtp.host", "210.127.55.231");
		
		// props.put("mail.smtp.auth", "true");
		// props.put("mail.smtp.starttls.enable", "true");
		// props.put("mail.smtp.port", "587");

		Session sess = Session.getInstance(props, null);
		boolean isSuccess = true;
		try {

			// create a message
			Message msg = new MimeMessage(sess);
			InternetAddress fadd = new InternetAddress();

			// 추후에 다량 발송을 위해서
			InternetAddress[] address = { new InternetAddress(toEmail) };
			InternetAddress[] ccAddress = { new InternetAddress(ccEmail) };

			fadd.setAddress(from); // 보내는 사람 email
			fadd.setPersonal(fromName, "EUC-KR");// 보내는 사람이름

			msg.setRecipients(Message.RecipientType.TO, address);
			msg.addRecipients(Message.RecipientType.CC, ccAddress);
			msg.setFrom(fadd);
			msg.setSubject(mailTitle);
			msg.setSentDate(new Date());

			msg.setContent(mailBody, "text/html;charset=euc-kr"); // HTML형식
			Transport.send(msg);
		} catch (MessagingException me) {
			log.error(me);
			isSuccess = false;
		} catch (Exception e) {
			isSuccess = false;
			return isSuccess;
		}
		return isSuccess;
	}	
}	
