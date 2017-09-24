package core.admin.util;

/**
 * Created by zhang on 2017/6/16.
 */
public abstract class UserNumber {

    public synchronized String getSerialNumber(){
        return process();
    }

    protected abstract String process();

}
