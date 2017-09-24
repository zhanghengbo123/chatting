package core.admin.controller;

import core.admin.domain.User;
import core.admin.service.UserService;
import core.admin.util.FileEveryDayNumber;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by zhang on 2017/6/16.
 */
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/create",method = RequestMethod.POST)
    @ResponseBody
    public String create(User user, ModelMap map){
        if(user != null){
            user.setId(FileEveryDayNumber.shareInstance().getSerialNumber());
        }
        long rows = userService.save(user);
        map.addAttribute("id",rows);
        if(rows > 0){
            return "user-list.jsp";
        }
        return "index.jsp";
    }

}
