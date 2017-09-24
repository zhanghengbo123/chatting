package core.admin.testmain;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by zhang on 2017/5/26.
 */
public class DownloadImageTest {

    public static void writeFile(HttpEntity imgEntity,String fileAddress){
        File file = new File(fileAddress);
        FileOutputStream outputStream = null;

        try{
            outputStream = new FileOutputStream(file);
            if(imgEntity != null){
                InputStream inputStream;
                inputStream = imgEntity.getContent();
                byte[] b = new byte[8*1024];
                int count;
                while ((count = inputStream.read(b)) != -1){
                    outputStream.write(b,0,count);
                }
            }

        }catch (Exception e){
            e.printStackTrace();
        } finally {
            try {
                outputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public static void main(String[] args){

        System.out.println("正在下载图片.........");

        SimpleDateFormat docFormat = new SimpleDateFormat("yyyy-MM-dd");
        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpGet httpGet = new HttpGet("http://cn.bing.com/");
        CloseableHttpResponse response = null;

        try{
            response = httpClient.execute(httpGet);
            Pattern p = Pattern.compile("g_img=\\{url:.*\\.jpg");
            Matcher matcher = p.matcher(EntityUtils.toString(response.getEntity()));
            String address = null;
            if (matcher.find()){
                address = matcher.group().split("'")[1].split("'")[0];


            } else {
                System.exit(0);
            }
            System.out.println("图片保存地址："+address);
            System.out.println("正在下载........");

            HttpGet getImage = new HttpGet(address);
            CloseableHttpResponse httpResponse = httpClient.execute(getImage);
            HttpEntity entity = httpResponse.getEntity();
            writeFile(entity,"d:/img/"+docFormat.format(new Date())+".jpg");
        }catch (Exception e){
            e.printStackTrace();
        }

    }
}
