package core.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by zhang on 2017/6/17.
 */
@RequestMapping("/admin")
@Controller
public class AdminController {

    @RequestMapping(value = "/login")
    public String login(){
        return "login";
    }

}
