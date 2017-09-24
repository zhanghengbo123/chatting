package core.admin.util;

import java.io.File;
import java.util.Date;
import java.util.List;

/**
 * Created by zhang on 2017/6/16.
 */
public class FileEveryDayNumber extends EveryNumber {

    public static FileEveryDayNumber fileEveryDayNumber = null;

    File file  = null;

    private final static String FIELD_SEPARATOR = ",";

    public static FileEveryDayNumber shareInstance(){
        if(fileEveryDayNumber == null){
            fileEveryDayNumber = new FileEveryDayNumber(3,"userinfo");
        }
          return fileEveryDayNumber;
    }

    public FileEveryDayNumber(int width ,String fileName){
        super(width);
        file = new File(fileName);
    }

    @Override
    protected int getOrderUpdateNumber(Date current, int start) {
        String date = format(current);
        int num = start;
        if(file.exists()){
            List<String> list = FileUtil.readList(file);
            String[] data = list.get(0).split(FIELD_SEPARATOR);
            if(date.equals(data[0])){
                num = Integer.parseInt(data[1]);
            }
        }
        FileUtil.rewrite(file,date + FIELD_SEPARATOR + (num + 1));

        return num;
    }
}
