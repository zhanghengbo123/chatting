package core.admin.testmain;

import redis.clients.jedis.Jedis;

import java.util.List;

/**
 * Created by zhang on 2017/6/15.
 */
public class JedisTest {

    public static void main(String[] args){

        Jedis jedis = new Jedis("localhost");

        jedis.expire("list",1);

        List<String> list = jedis.lrange("list",0,1);
        for(String l : list){
            System.out.println("l = "+ l);
        }
    }
}
