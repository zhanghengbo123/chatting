package core.admin.controller;

import core.admin.service.QrCodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by zhang on 2017/6/12.
 */
@RestController
@RequestMapping("/qr")
public class QrCodeController {

    @Autowired
    private QrCodeService qrCodeService;

    @RequestMapping(value = "/create",method = RequestMethod.POST)
    public void create(@RequestParam(value = "content") String content){
        try{
            if(content != null){
                qrCodeService.createQrCode(content);
            }
        }catch (Exception e){
            e.printStackTrace();
        }

    }
}
