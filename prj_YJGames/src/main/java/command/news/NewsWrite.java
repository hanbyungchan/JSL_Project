package command.news;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.CommonExecute;
import common.CommonUtil;
import dao.NewsDao;
import dto.NewsDto;

public class NewsWrite implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		NewsDao dao = new NewsDao();
		HttpSession session = request.getSession();
		 int maxSize = 1024 * 1024 * 100;
	        MultipartRequest mpr = null;
	        String msg = "It has been Registered.";
	        try {
	            mpr = new MultipartRequest(request, CommonUtil.NewsFileDir(), maxSize, "utf-8", new DefaultFileRenamePolicy());
	            String n_no = dao.AutoCode();
	            String n_title = mpr.getParameter("t_title");
	            n_title = n_title.replace("'", "&#39;");  // SQL Injection 방지
	            String n_content = mpr.getParameter("n_content");
	            n_content = n_content.replace("'", "&#39;");  // SQL Injection 방지
	            String n_uploader = (String)session.getAttribute("sessionId");
	            String n_upload_date = CommonUtil.getToday();
	            String g_code = mpr.getParameter("g_code");
	            String n_attach = mpr.getFilesystemName("t_g_file");
	            if (n_attach == null) {
	            	n_attach = "";
	            }
	            NewsDto dto = new  NewsDto(n_no, n_title, n_content, n_attach, n_uploader, n_upload_date, g_code);
	    		
	    		int result = dao.NewsSave(dto);
	    		if(result == 0) {
	    			msg = "Registration failed..";
	    		}
	        } catch (IOException e) {
	            e.printStackTrace();
	        }

		request.setAttribute("t_gubun", "list");
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "Game");
	}

}
