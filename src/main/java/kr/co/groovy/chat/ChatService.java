package kr.co.groovy.chat;

import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class ChatService {

    private final ChatMapper chatMapper;

    public ChatService(ChatMapper chatMapper) {
        this.chatMapper = chatMapper;
    }

    public int insertChatRoom(Map<String, Object> roomData) {
        int result = chatMapper.insertChatRoom(roomData);
        return result;
    }

    public int insertChatMember(String emplId) {
        int result = chatMapper.insertChatMember(emplId);
        return result;
    }

}
