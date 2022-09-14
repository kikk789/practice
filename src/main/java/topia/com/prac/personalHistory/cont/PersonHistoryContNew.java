package topia.com.prac.personalHistory.cont;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

public interface PersonHistoryContNew {
    public String userListNew(HttpServletRequest request, Model model, int pageNUM);
}
