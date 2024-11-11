package command.rank;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.RankDao;
import dto.RankDto;

public class Rank implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		RankDao dao = new RankDao();
		ArrayList<RankDto> dtos = dao.getRankList();
		
		request.setAttribute("dtos", dtos);
		
		
	}

}
