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

public class NewsUpdate implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		NewsDao dao = new NewsDao();
		HttpSession session = request.getSession();
		 int maxSize = 1024 * 1024 * 100;
	        MultipartRequest mpr = null;
	        String msg = "It has been Updated.";
	        try {
	            mpr = new MultipartRequest(request, CommonUtil.NewsFileDir(), maxSize, "utf-8", new DefaultFileRenamePolicy());
	            String n_no = mpr.getParameter("n_no");
	            String n_title = mpr.getParameter("t_title");
	            n_title = n_title.replace("'", "&#39;");  // SQL Injection 방지
	            String n_content = mpr.getParameter("n_content");
	            n_content = n_content.replace("'", "&#39;");  // SQL Injection 방지
	            String n_update_date = CommonUtil.getToday();
	            String g_code = mpr.getParameter("g_code");
	            String ori_attach = mpr.getParameter("ori_attach");
	            String n_attach = mpr.getFilesystemName("t_g_file");
	            if (n_attach == null) {
	            	if(ori_attach == null) {n_attach = "";}
	            	else if(ori_attach != null) {n_attach = ori_attach;}
	            }
	            NewsDto dto = new  NewsDto(n_no, n_title, n_content, n_attach, n_update_date);
	    		int result = dao.NewsUpdate(dto);
	    		if(result == 0) {
	    			msg = "Update failed..";
	    		}
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
		request.setAttribute("t_gubun", "list");
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "Game");
	}

}
