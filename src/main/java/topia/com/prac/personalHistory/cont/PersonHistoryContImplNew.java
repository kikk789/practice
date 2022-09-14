package topia.com.prac.personalHistory.cont;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import topia.com.prac.entity.UserInfo;
import topia.com.prac.personalHistory.serv.PersonHistoryServImplNew;
import topia.com.prac.vo.ListVO;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class PersonHistoryContImplNew implements PersonHistoryContNew{

    @Autowired
    PersonHistoryServImplNew personHistoryServImplNew;
    public int pageSIZE = 5 ; //한 화면에 보여 줄 레코드의 수
    public int totalPage = 1 ; //전체 페이지 수 (기본 초기화 값)
    public int totalRecord = 0; // 전체 레코드 수 (기본 초기화 값)
    public int pageGroup=5; //한 페이지에 보여 줄 페이지 수
    HashMap<String,Object> unlockedReqMap;
    List<ListVO> userInfoList;
    int pageNUM = 1;
    @Override
    @RequestMapping(value="/practiceList", method= RequestMethod.GET)
    public String userListNew(HttpServletRequest request,
                              Model model,
                              @RequestParam(defaultValue = "1") int pageNUM) {
        System.out.println("kkkk pageNUM-1된 채로 넘어옴" + (pageNUM));
        Map<String,Object> reqMap = (Map<String, Object>) request.getParameterMap();
        unlockedReqMap = new HashMap<String,Object>();


        for( String key : reqMap.keySet() ){
            unlockedReqMap.put(key, ((String[])reqMap.get(key))[0]);
        }

        unlockedReqMap.put("pageSIZE", pageSIZE);
        unlockedReqMap.put("pageNUM", pageNUM);
        this.pageNUM=pageNUM;
        userInfoList = personHistoryServImplNew.userListNew(unlockedReqMap); //전체 리스트

        totalRecord = personHistoryServImplNew.userListNewCount(unlockedReqMap); //전체 레코드 개수
        totalPage= (int)Math.ceil((double)totalRecord / pageSIZE); //전체 페이지 수 (기본 초기화 값)

        int startPage = ((pageNUM-1)/pageGroup) * pageGroup + 1;

        int endPage = startPage + pageGroup -1;

        if (endPage > totalPage){
            endPage = totalPage;
        }

        model.addAttribute("list", userInfoList);
        model.addAttribute("totalRecord", totalRecord);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("pageNUMByController", pageNUM);

        return "practiceList";
    }

    @RequestMapping(value="/deleteList", method= RequestMethod.POST)
    @ResponseBody
    public int deleteList(RedirectAttributes redirectAttributes , HttpServletRequest request){
        String[] chkVal = request.getParameterValues("chkVal");
        int returnValue=0;
        for (String b: chkVal) {
            personHistoryServImplNew.deleteUserInfo(Integer.parseInt(b));
            personHistoryServImplNew.deleteListCareer(Integer.parseInt(b));
            personHistoryServImplNew.deleteListEdu(Integer.parseInt(b));
            personHistoryServImplNew.deleteListLicen(Integer.parseInt(b));
            personHistoryServImplNew.deleteListQualifi(Integer.parseInt(b));
            personHistoryServImplNew.deleteListSkill(Integer.parseInt(b));
            personHistoryServImplNew.deleteListTraining(Integer.parseInt(b));
            personHistoryServImplNew.deleteListImage(Integer.parseInt(b));
        }
        totalRecord = personHistoryServImplNew.userListNewCount(unlockedReqMap); //전체 레코드 개수

        //리턴 받은 data(pageNUM)에 따라 새로고침
        //만약 6페이지에 리스트가 1개밖에 없었는데 1개를 삭제하면
        //5페이지로 이동되게 함
        if (pageNUM !=1 && totalRecord % pageSIZE==0){
            redirectAttributes.addFlashAttribute("pageNUM", pageNUM-1); //필요한가?
            System.out.println("thisOK pageNUM-1  "+ (pageNUM-1)); //필요한가?
            returnValue = pageNUM-1;
        }
        else{
            redirectAttributes.addFlashAttribute("pageNUM", pageNUM); //필요한가?
            System.out.println("thatOK pageNUM  "+ pageNUM); //필요한가?
            returnValue = pageNUM;
        }
        return returnValue;
    }
}
