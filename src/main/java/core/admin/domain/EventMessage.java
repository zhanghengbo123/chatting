package core.admin.domain;

import java.io.Serializable;
import java.util.Arrays;

/**
 * Created by zhang on 2017/9/24.
 */
public class EventMessage implements Serializable {
    private String queueName;

    private String exchangeName;

    private byte[] eventData;

    public EventMessage(String queueName, String exchangeName, byte[] eventData) {
        this.queueName = queueName;
        this.exchangeName = exchangeName;
        this.eventData = eventData;
    }

    public EventMessage() {
    }

    public String getQueueName() {
        return queueName;
    }

    public String getExchangeName() {
        return exchangeName;
    }

    public byte[] getEventData() {
        return eventData;
    }

    @Override
    public String toString() {
        return "EopEventMessage [queueName=" + queueName + ", exchangeName="
                + exchangeName + ", eventData=" + Arrays.toString(eventData)
                + "]";
    }
}
