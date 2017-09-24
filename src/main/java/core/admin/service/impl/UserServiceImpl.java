package core.admin.service.impl;

import core.admin.domain.User;
import core.admin.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;

/**
 * Created by zhang on 2017/6/16.
 */
@Service("userService")
public class UserServiceImpl implements UserService {

    private static final Logger logger = Logger.getLogger(UserServiceImpl.class);

    @Autowired
    private Jedis jedis;

    @Override
    public long save(User user) {

        long rows = 0;

         try{
             String id = user.getId();
            System.out.println(id+"&&&&&&&&&&&&&&&&&&&&&&&&&&");
             if(id != null){

                rows = jedis.hset(id,id,user.toString());
             }
             String str = jedis.hget(id,id);

             System.out.print(str+"dddddddddddddd");
         }catch (Exception e){
             logger.error(e.getMessage(),e);
         }
        return rows;
    }
}
