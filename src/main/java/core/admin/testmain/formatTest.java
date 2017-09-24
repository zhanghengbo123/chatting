package core.admin.testmain;

import java.text.DecimalFormat;

/**
 * Created by zhang on 2017/6/16.
 */
public class formatTest {

    public static void main(String[] args){
        char[] chs = new char[4];
        for(int i = 0; i < 4; i++){
            chs[i] = '0';
        }
        DecimalFormat sf = new DecimalFormat(new String(chs));
        System.out.println(sf.format(1));
    }
}
