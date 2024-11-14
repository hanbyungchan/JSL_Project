package command.game;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.CommonExecute;
import common.CommonUtil;
import dao.GameDao;
import dto.GameRegiDto;

public class GameRegist implements CommonExecute {

    @Override
    public void execute(HttpServletRequest request) {
        GameDao dao = new GameDao();
        
        int maxSize = 1024 * 1024 * 100;
        MultipartRequest mpr = null;
        String msg = "Game registration failed!";
        try {
            mpr = new MultipartRequest(request, CommonUtil.GameFileDir(), maxSize, "utf-8", new DefaultFileRenamePolicy());
            String g_code = mpr.getParameter("t_g_code");
            String g_name = mpr.getParameter("t_g_name");
            g_name = g_name.replace("'", "&#39;");  // SQL Injection 방지
            String g_price = mpr.getParameter("t_g_price");
            String g_developer = mpr.getParameter("t_g_developer");
            String g_grade = mpr.getParameter("t_g_grade");
            String g_file = mpr.getFilesystemName("t_g_file");
            if (g_file == null) {
                g_file = "";
            }
            // t_genre_code를 List<String>으로 변환
            String[] t_genre_code_array = mpr.getParameterValues("t_genre_code");
            List<String> t_genre_code = (t_genre_code_array != null) ? Arrays.asList(t_genre_code_array) : null;
            

            // DTO 생성
            GameRegiDto dto = new GameRegiDto(g_code, g_name, g_file, g_developer, g_grade, t_genre_code, "0", Double.parseDouble(g_price));  // 수정된 부분
            
            int result = dao.RegistGame(dto);
            if (result != 0) msg = "Game registration completed";
            // g_code를 사용하여 UpdateStats 호출
            int statsResult = dao.UpdateStats(g_code);  // GameDao에 UpdateStats 메서드 추가 필요
            if (statsResult > 0) {
            	msg += " and stats updated successfully.";
            } else {
            	msg += " but stats update failed.";
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        request.setAttribute("t_msg", msg);
        request.setAttribute("t_url", "Game");
    }
}