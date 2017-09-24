package core.admin.controller;

import core.admin.domain.AdminUser;
import core.admin.util.SendMail;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by zhang on 2017/6/26.
 */
@RestController
@RequestMapping("/mail")
public class MailController {

    @RequestMapping(value = "/send",method = RequestMethod.POST)
    public String mail(AdminUser adminUser){

        SendMail sendMail = new SendMail(adminUser);

        sendMail.start();




        return "index";
    }
}
