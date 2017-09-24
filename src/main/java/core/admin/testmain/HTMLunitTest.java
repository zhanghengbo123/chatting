package core.admin.testmain;

import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.HtmlInput;
import com.gargoylesoftware.htmlunit.html.HtmlPage;

/**
 * Created by zhang on 2017/4/27.
 */
public class HTMLunitTest {

    public static void main(String [] args) throws Exception{
        WebClient webClient = new WebClient();
        webClient.getOptions().setJavaScriptEnabled(false);
        webClient.getOptions().setCssEnabled(false);

        HtmlPage page =  webClient.getPage("http://www.baidu.com");
       /* String pageText = page.getTitleText();
        System.out.println("百度网页的标题为："+pageText);
        pageText = page.asXml();
        System.out.println("百度网页的xml为："+pageText);
        pageText = page.asText();
        System.out.println("百度网页的text为："+pageText);*/

        HtmlInput htmlInput =  (HtmlInput) page.getHtmlElementById("kw");
        System.out.println(htmlInput.toString()+"--------------------");
        htmlInput.setValueAttribute("李小璐");
        System.out.println(htmlInput.toString()+"--------------------");
        HtmlInput h2 = (HtmlInput)page.getHtmlElementById("su");
        HtmlPage hp = h2.click();
        System.out.println("搜索结果为："+ hp.asText());
    }

}
