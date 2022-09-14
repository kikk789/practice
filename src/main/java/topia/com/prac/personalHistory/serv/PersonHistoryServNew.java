package topia.com.prac.personalHistory.serv;

import topia.com.prac.entity.UserInfo;
import topia.com.prac.vo.ListVO;

import java.util.HashMap;
import java.util.List;

public interface PersonHistoryServNew {

    public List<ListVO> userListNew(HashMap<String, Object> reqMap);
}
