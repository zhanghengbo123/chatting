package core.admin.util;

import core.admin.domain.AdminUser;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

/**
 * Created by zhang on 2017/6/26.
 */
public class SendMail extends Thread {

    private String from = "863568474@qq.com";

    private String username = "863568474@qq.com";

    private String password = "zhbzhb123456.";

    private String host = "smtp.qq.com";

    private AdminUser adminUser;

    public SendMail(AdminUser adminUser){
        this.adminUser = adminUser;
    }

    @Override
    public void run(){

        try {
            Properties prop = new Properties();
            prop.setProperty("mail.host",host);
            prop.setProperty("mail.transport.protocol","smtp");
            prop.setProperty("mail.smtp.auth","true");
            Session session = Session.getInstance(prop);
            session.setDebug(true);
            Transport transport = session.getTransport();
            transport.connect(host,username,password);
            Message message = createMail(session,adminUser);

            transport.sendMessage(message,message.getAllRecipients());

            transport.close();

        }catch (Exception e){
            throw new RuntimeException(e);
        }
    }

    public Message createMail(Session session,AdminUser adminUser) throws Exception{
        MimeMessage message = new MimeMessage(session);

        message.setFrom(from);

        message.setRecipient(Message.RecipientType.TO,new InternetAddress(adminUser.getMail()));

        message.setSubject("用户注册邮件");
        String info = "恭喜您，注册成功，用户名：" + adminUser.getName();

        message.setContent(info,"text/html;charset=utf-8");

        message.saveChanges();;

        return message;


    }
}
