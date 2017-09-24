package core.admin.controller;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.concurrent.CopyOnWriteArraySet;

/**
 * Created by zhang on 2017/5/19.
 */
@ServerEndpoint("/chat")
public class ChatController {
    //静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。
         private static int onlineCount = 0;

           //concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。若要实现服务端与单一客户端通信的话，可以使用Map来存放，其中Key可以为用户标识
   private static CopyOnWriteArraySet<ChatController> webSocketSet = new CopyOnWriteArraySet<ChatController>();
  //与某个客户端的连接会话，需要通过它来给客户端发送数据
    private Session session;

     /**
     25      * 连接建立成功调用的方法
     26      * @param session  可选的参数。session为与某个客户端的连接会话，需要通过它来给客户端发送数据
     27      */
           @OnOpen
         public void onOpen(Session session){
                 this.session = session;
                 webSocketSet.add(this);     //加入set中
                 addOnlineCount();           //在线数加1
                 System.out.println("有新连接加入！当前在线人数为" + getOnlineCount());
             }

                 /**
     37      * 连接关闭调用的方法
     38      */
         @OnClose
        public void onClose(){
              webSocketSet.remove(this);  //从set中删除
              subOnlineCount();           //在线数减1
              System.out.println("有一连接关闭！当前在线人数为" + getOnlineCount());

            }

    /**
     47      * 收到客户端消息后调用的方法
     48      * @param message 客户端发送过来的消息
     49      * @param session 可选的参数
     50      */
         @OnMessage
         public void onMessage(String message, Session session) {
                 System.out.println("来自客户端的消息:" + message);
                 //群发消息
               for(ChatController item: webSocketSet){
                         try {
                                 item.sendMessage(message);
                             } catch (IOException e) {
                                 e.printStackTrace();
                                 continue;
                             }
                    }
            }

    /**
     66      * 发生错误时调用
     67      * @param session
     68      * @param error
     69      */
        @OnError
         public void onError(Session session, Throwable error){
                 System.out.println("发生错误");
                error.printStackTrace();
             }
                /**
     77      * 这个方法与上面几个方法不一样。没有用注解，是根据自己需要添加的方法。
     78      * @param message
     79      * @throws IOException
     80      */
                 public void sendMessage(String message) throws IOException{
        this.session.getBasicRemote().sendText(message);
           //this.session.getAsyncRemote().sendText(message);
          }

          public static synchronized int getOnlineCount() {
                return onlineCount;
           }

     public static synchronized void addOnlineCount() {
                ChatController.onlineCount++;
     }
                 public static synchronized void subOnlineCount() {
                 ChatController.onlineCount--;
            }



}
