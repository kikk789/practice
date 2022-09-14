package topia.com.prac.personalHistory.serv;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import topia.com.prac.entity.UserInfo;
import topia.com.prac.personalHistory.dao.AbstractDAONew;
import topia.com.prac.vo.ListVO;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class PersonHistoryServImplNew implements PersonHistoryServNew{

    @Autowired
    private AbstractDAONew dbCon;

    public int pageSIZE = 10 ; //한 화면에 보여 줄 레코드의 수
    public int totalPage = 1 ; //전체 페이지 수 (기본 초기화 값)
    public int totalRecord = 0; // 전체 레코드 수 (기본 초기화 값)

    @Override
    public List<ListVO> userListNew(HashMap<String, Object> reqMap) {

        HashMap<String, Object> resMap = new HashMap<String, Object>();

        List<ListVO> list;
        list = dbCon.selectList("personalHistoryNew.userListNew", reqMap);
        resMap.put("list", list);

        return list;
    }

    public int userListNewCount(HashMap<String, Object> reqMap){

        totalRecord = dbCon.selectOne("personalHistoryNew.userListCountNew", reqMap);

        return totalRecord;
    }

    public int deleteUserInfo(int userIdx){
        return dbCon.deleteUserInfo("personalHistoryNew.deleteListInfo", userIdx);
    }
    public int deleteListCareer(int userIdx){
        return dbCon.deleteListCareer("personalHistoryNew.deleteListCareer", userIdx);
    }
    public int deleteListEdu(int userIdx){
        return dbCon.deleteListEdu("personalHistoryNew.deleteListEdu", userIdx);
    }
    public int deleteListLicen(int userIdx){
        return dbCon.deleteListLicen("personalHistoryNew.deleteListLicen", userIdx);
    }
    public int deleteListQualifi(int userIdx){
        return dbCon.deleteListQualifi("personalHistoryNew.deleteListQualifi", userIdx);
    }
    public int deleteListSkill(int userIdx){
        return dbCon.deleteListSkill("personalHistoryNew.deleteListSkill", userIdx);
    }
    public int deleteListTraining(int userIdx){
        return dbCon.deleteListTraining("personalHistoryNew.deleteListTraining", userIdx);
    }
    public int deleteListImage(int userIdx){
        String path = "C:\\Users\\gaebal\\Documents\\workspace-sts-3.9.18.RELEASE\\practice\\src\\main\\webapp\\resources\\upload";
        try{
            //MultipartFile file=null;
            String savedName = dbCon.selectImageNameByIdx("personalHistoryNew.selectImageByIdx", userIdx);

            File file = new File(path, savedName);
            file.delete();

            //업로드 된 이미지가 없으면 그냥 catch문 실행됨.
        }catch (Exception e){
            System.out.println("Message "+ e.getMessage());
        }

        return dbCon.deleteListImage("personalHistoryNew.deleteListImage", userIdx);
    }


}
