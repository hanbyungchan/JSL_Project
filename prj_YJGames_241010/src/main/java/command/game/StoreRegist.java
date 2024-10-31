package command.game;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.CommonExecute;
import common.CommonUtil;
import dao.GameDao;
import dto.GameRegiDto;
import dto.StoreRegiDto;

public class StoreRegist implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		GameDao dao = new GameDao();
		int maxSize = 1024 * 1024 * 100;
		MultipartRequest mpr = null;
		String msg = "Store registration failed!";
		try {
			String s_page_no = mpr.getParameter("t_s_page_no");
			String t_s_game_name = mpr.getParameter("t_s_game_name"); // 변경된 부분
	        
	        // t_s_game_name에서 게임 코드와 이름을 분리
	        String s_game_code = "";
	        String s_game_name = "";
	        if (t_s_game_name != null && !t_s_game_name.isEmpty()) {
	            String[] gameDetails = t_s_game_name.split(","); // 쉼표로 분리
	            if (gameDetails.length == 2) {
	                s_game_code = gameDetails[0]; // 게임 코드
	                s_game_name = gameDetails[1]; // 게임 이름
	            }
	        }
	        mpr = new MultipartRequest(request, CommonUtil.GameFileDir(s_game_code), maxSize, "utf-8", new DefaultFileRenamePolicy());
			String s_info_txt = mpr.getParameter("t_s_info_txt");
			String s_date = mpr.getParameter("t_s_date");
			String s_sale = mpr.getParameter("t_s_sale");
			String s_spec_1 = mpr.getParameter("t_s_spec_1");
			String s_spec_2 = mpr.getParameter("t_s_spec_2");
			String s_spec_3 = mpr.getParameter("t_s_spec_3");
			String s_spec_4 = mpr.getParameter("t_s_spec_4");
			String s_spec_5 = mpr.getParameter("t_s_spec_5");
			String s_img_main = mpr.getFilesystemName("t_s_img_main");
			String s_img_1 = mpr.getFilesystemName("t_s_img_1");
			String s_img_2 = mpr.getFilesystemName("t_s_img_2");
			String s_img_3 = mpr.getFilesystemName("t_s_img_3");
			String s_icon = mpr.getFilesystemName("t_s_icon");
			String s_video_1 = mpr.getFilesystemName("t_s_video_1");
			String s_video_2 = mpr.getFilesystemName("t_s_video_2");
			String s_video_3 = mpr.getFilesystemName("t_s_video_3");
			
			System.out.println(s_info_txt);
			
			
			StoreRegiDto dto = new StoreRegiDto(s_page_no, s_game_code, s_game_name, s_info_txt, s_date, s_spec_1, s_spec_2, s_spec_3, s_spec_4, s_spec_5, s_img_main, s_img_1, s_img_2, s_img_3, s_icon, s_video_1, s_video_2, s_video_3, Integer.parseInt(s_sale));
			
			int result = dao.RegistStore(dto);
			if(result != 0) msg = "Store registration completed";
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "Game");
		
	}

}
