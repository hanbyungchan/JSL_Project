package common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;


public class CommonUtil {
	//자료실 폴더 경로
	public static String GameFileDir(String game_code) {
			String baseDir = "C:/Users/JSLHRD/git/repository/prj_YJGames/src/main/webapp/img";
		    // 게임 코드로 새로운 폴더 이름 설정
		    String sanitizedGameCode = sanitizeFileName(game_code); // 유효한 폴더 이름으로 변환
		    String newDir = baseDir + "/" + sanitizedGameCode;

		    // 새로운 폴더 생성
		    File dir = new File(newDir);
		    if (!dir.exists()) {
		        dir.mkdirs(); // 폴더가 존재하지 않으면 생성
		    }

		    return newDir; // 새로운 폴더 경로 반환
	}
	// 유효한 파일 이름으로 변환하는 메소드
	private static String sanitizeFileName(String fileName) {
		// 유효하지 않은 문자를 '_'로 대체
		return fileName.replaceAll("[<>:\"/\\|?*]", "_");
	}
	//자료실 폴더 경로
	public static String GameFileDir() {
		String dir ="C:\\Users\\JSLHRD\\git\\repository\\prj_YJGames\\src\\main\\webapp\\exe";
		return dir;
	}
	//자료실 폴더 경로
	public static String getPdsDir() {
		String dir ="E:/Track16기_김여준/java_project/homepage_one/WebContent/attach/pds";
		return dir;
	}
	//공지사항 폴더 경로
	public static String getNoticeDir() {
		String dir ="E:/Track16기_김여준/java_project/homepage_one/WebContent/attach/notice";
		return dir;
	}
	public static String getToday() {
		Date time = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String today = sdf.format(time);
		return today;
	}
	public static String getYear() {
		Date time = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		String today = sdf.format(time);
		return today;
	}
	//오늘 날짜 년월일시분초
		public static String getTodayTime() {
			Date time = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String today = sdf.format(time);
			return today;
		}
		public static String pageListPost(int current_page,int total_page, int pageNumber_count){
			int pagenumber;    //화면에 보여질 페이지 인덱스수
			int startpage;     //화면에 보여질 시작 페이지 번호
			int endpage;       //화면에 보여질 마지막 페이지 번호
			int curpage;       //이동하고자 하는 페이지 번호
			
			String strList=""; //리턴될 페이지 인덱스 리스트

			pagenumber = pageNumber_count;   //한 화면의 페이지 인덱스수
			
			//시작 페이지 번호 구하기
			startpage = ((current_page - 1)/ pagenumber) * pagenumber + 1;
			//마지막 페이지 번호 구하기
			endpage = (((startpage -1) + pagenumber) / pagenumber)*pagenumber;
			//총페이지수가 계산된 마지막 페이지 번호보다 작을 경우
			//총페이지수가 마지막 페이지 번호가 됨
			
			if(total_page <= endpage)  endpage = total_page;
						
			//첫번째 페이지 인덱스 화면이 아닌경우
			if(current_page > pagenumber){
				curpage = startpage -1;  //시작페이지 번호보다 1적은 페이지로 이동
				strList = strList +"<a href=javascript:goPage('"+curpage+"') ><i class='fa fa-angle-double-left'></i></a>";
			}
							
			//시작페이지 번호부터 마지막 페이지 번호까지 화면에 표시
			curpage = startpage;
			while(curpage <= endpage){
				if(curpage == current_page){
					strList = strList +"<a class='active'>"+current_page+"</a>";
				} else {
					strList = strList +"<a href=javascript:goPage('"+curpage+"')>"+curpage+"</a>";
				}
				curpage++;
			}
			//뒤에 페이지가 더 있는 경우
			if(total_page > endpage){
				curpage = endpage+1;
				strList = strList + "<a href=javascript:goPage('"+curpage+"') ><i class='fa fa-angle-double-right'></i></a>";
			}
			return strList;
		}			
}
