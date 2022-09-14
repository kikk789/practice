package topia.com.prac.personalHistory.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import topia.com.prac.entity.UserInfo;
import topia.com.prac.vo.ListVO;

import java.util.List;

@Repository
public class AbstractDAONew {
    @Autowired
    SqlSessionTemplate sqlSession;

    //@SuppressWarnings("rawtypes")
    public List<ListVO> selectList(String queryId, Object params){
        //printQueryId(queryId);
        System.out.println("queryId "+ queryId);
        System.out.println("params "+ params);
        return sqlSession.selectList(queryId, params);
    }

    public int selectOne(String queryId, Object params){
        return sqlSession.selectOne(queryId, params);
    }

    public int deleteUserInfo(String queryId, int userIdx){

        return sqlSession.delete(queryId,userIdx);
    }

    public int deleteListCareer(String queryId, int userIdx) {
        return sqlSession.delete(queryId,userIdx);
    }

    public int deleteListEdu(String queryId, int userIdx) {
        return sqlSession.delete(queryId,userIdx);
    }

    public int deleteListLicen(String queryId, int userIdx) {
        return sqlSession.delete(queryId,userIdx);
    }

    public int deleteListQualifi(String queryId, int userIdx) {
        return sqlSession.delete(queryId,userIdx);
    }

    public int deleteListSkill(String queryId, int userIdx) {
        return sqlSession.delete(queryId,userIdx);
    }

    public int deleteListTraining(String queryId, int userIdx) {
        return sqlSession.delete(queryId,userIdx);
    }
    public int deleteListImage(String queryId, int userIdx) {
        return sqlSession.delete(queryId,userIdx);
    }

    public String selectImageNameByIdx(String queryId, int userIdx) {
        return sqlSession.selectOne(queryId,userIdx);
    }
}
