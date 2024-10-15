package command.game;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.GameDao;
import dto.HomeDto;

public class IndexList implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		GameDao dao = new GameDao();
		ArrayList<HomeDto> dtos1 = dao.NewList();
		ArrayList<HomeDto> dtos2 = dao.SaleList1();
		ArrayList<HomeDto> dtos3 = dao.SaleList2();
		request.setAttribute("t_dtos1", dtos1);
		request.setAttribute("t_dtos2", dtos2);
		request.setAttribute("t_dtos3", dtos3);

	}

}
