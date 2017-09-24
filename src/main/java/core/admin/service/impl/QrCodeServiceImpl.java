package core.admin.service.impl;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
import core.admin.service.QrCodeService;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by zhang on 2017/6/12.
 */
@Service("qrCodeService")
public class QrCodeServiceImpl implements QrCodeService {


    @Override
    public void createQrCode(String content) {
        int height = 300;
        int width = 300;
        String format = "png";
        Map map = new HashMap();
        map.put(EncodeHintType.CHARACTER_SET,"utf-8");
        map.put(EncodeHintType.MARGIN,0);
        map.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.M);

        try{
            BitMatrix bitMatrix = new MultiFormatWriter().encode(content, BarcodeFormat.QR_CODE,width,height,map);
            MatrixToImageWriter.writeToPath(bitMatrix,format,new File("d:/test/baidu.png").toPath());
        }catch (Exception e){

        }

    }
}
