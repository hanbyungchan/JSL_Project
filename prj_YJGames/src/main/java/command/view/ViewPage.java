package command.view;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.GameDao;
import dto.ViewDto;

public class ViewPage implements CommonExecute {

	@Override
	public void execute(HttpServletRequest req) {
		GameDao dao = new GameDao();
		
		String no = req.getParameter("t_pageNo");
		//nothing2
		
		ViewDto dto = dao.StorePageView(Integer.parseInt(no));
		req.setAttribute("dto", dto);
		
	}

}
