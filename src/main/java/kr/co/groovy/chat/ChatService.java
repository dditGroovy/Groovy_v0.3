package kr.co.groovy.chat;

import kr.co.groovy.vo.ChatRoomVO;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ChatService {

    private final ChatMapper chatMapper;

    public ChatService(ChatMapper chatMapper) {
        this.chatMapper = chatMapper;
    }

    public int insertChatRoom(Map<String, Object> roomData) {
        return chatMapper.insertChatRoom(roomData);
    }

    public int insertChatMember(String emplId) {
        return chatMapper.insertChatMember(emplId);
    }

    public List<ChatRoomVO> loadChatRooms(String emplId) {
        return chatMapper.loadChatRooms(emplId);
    }

}
