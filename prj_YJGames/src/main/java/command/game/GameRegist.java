package command.game;

import java.io.IOException;

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
			g_name = g_name.replace("'", "&#39;");
			String g_price = mpr.getParameter("t_g_price");
			String g_developer = mpr.getParameter("t_g_developer");
			String g_grade = mpr.getParameter("t_g_grade");
			String g_file = mpr.getFilesystemName("t_g_file");
			if(g_file == null) {
				g_file = "";
			}
			String genre_code = mpr.getParameter("t_genre_code");
			
			GameRegiDto dto = new GameRegiDto(g_code, g_name, g_file, g_developer, g_grade, genre_code, Double.parseDouble(g_price));
			
			int result = dao.RegistGame(dto);
			if(result == 2) msg = "Game registration completed";
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "Game");
		
	}

}
