package core.admin.util;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by zhang on 2017/6/16.
 */
public abstract class EveryNumber extends UserNumber {


    protected final static SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

    protected DecimalFormat df = null;

    public EveryNumber(int width){
        if(width < 1){
            throw new IllegalArgumentException("width is too small");
        }
        char[] chs = new char[width];
        for(int i = 0; i < width; i++){
            chs[i] = '0';
        }
        df = new DecimalFormat(new String(chs));
    }

    @Override
    protected String process() {
        Date date = new Date();
        int n = getOrderUpdateNumber(date,1);
        return format(date) + format(n);
    }

    protected String format(Date date){return sdf.format(date);}

    protected String format(int num){return df.format(num); }

    protected abstract int getOrderUpdateNumber(Date current,int start );



}
