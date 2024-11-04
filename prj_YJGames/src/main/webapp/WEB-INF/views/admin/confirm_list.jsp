<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>JSL Games</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<link rel="icon" type="image/png" href="img/logo.png">
	    <!-- CSS 연동 -->
	    <link rel="stylesheet" href="css/styles.css">
	    <link rel="stylesheet" href="css/index.css">
	    <link rel="stylesheet" href="css/game_regist.css">
	    <!-- Font Awesome 아이콘 -->
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
	    <%@ include file = "../scripts.jsp"%>
        <style>
        	h2 {
        		text-align:center;
        		font-size:40px;
        		color:white;
        	}
        	th {
        		font-size:25px;
        		color:white;
        	}
        	.content {
	            width: 50%;
	            height: auto;
	            margin: 20px auto 0; /* 수평 가운데 정렬 */
	            text-align: center;
        	}
        	.list {
        		width:100%;
        		
        	}
            a {
                font-size: 25px;
                text-decoration-line: none;
                margin-left: 10px;
                color:green;
            }
            .publisher {
                font-size: 25px;
                color:white;
                text-align: center;
                padding: auto;
            }
            .select_all {
            	font-size:17px;
            	color:white;
            	text-align:left;
            	padding-left:10px;
            }
            .check_all {
            	margin-left:4px;
            	width: 20px; /*Desired width*/
				height: 20px; /*Desired height*/
				cursor: pointer;
            }
            .check {
            	width: 20px; /*Desired width*/
				height: 20px; /*Desired height*/
				cursor: pointer;
            }
        </style>
    <script type="text/javascript">
	    $(document).ready(function() {
	        // 전체 선택 체크박스 클릭 이벤트
	        $('#selectAll').click(function() {
	            $('.check').prop('checked', this.checked);
	        });
	    });
    	function goGenreSearch(no){
			game.t_genre.value=no;
			game.method="post";
			game.action="Search";
			game.submit();	
		}
    	function goView(s_no) {
    		game.method="post";
    		game.action="Game?t_gubun=view&t_pageNo="+s_no;
    		game.submit();
		}
    	function Contain_game(a,b) {
    		game.t_id.value = b;
			game.t_pageNo.value = a;
			$.ajax({
				 type:"post",
			  	 url:"Contain",
			  	 data: {
			  			t_u_id: game.t_id.value,
			            t_g_code: game.t_pageNo.value
			        },
			  	 dataType:"text",
			  	 error:function(){
			  		alert("a");
			  	 },
				 success:function(data){ 
				 	var result = $.trim(data); 
				 	game.result.value = result;
					 if(result =="1"){alert("You have added the game to your cart.");}
					 else if(result =="3"){alert("This game has already been purchased.");}
					 else if(result =="4"){alert("The game is already in your cart.");}
					 else{alert("The game is already in your cart or has failed.");}
				 } 
			  });
	  	}
    	function goAlert() {
			alert("please Login!");
			game.method="post";
    		game.action="Game?t_gubun=goSignin";
    		game.submit();	
		}
    	function goConfirmForm(code) {
    		game.method = "post";
    		game.action = "Game?t_gubun=GameConfirmView&t_g_code="+code;
    		game.submit();
    	}
    	function goConfirm() {
    		listconfirm.method = "post";
    		listconfirm.action = "";
    		listconfirm.submit();
    	}
    	
    </script>
</head>
    <body>
    	<form name="game">
        	<input type="hidden" name="t_gubun">
            <input type="hidden" name="t_pageNo">
            <input type="hidden" name="t_id">
            <input type="hidden" name="t_g_code">
		</form>
	<%@ include file = "../header.jsp"%>
            <div class="main-image">
                <img src="img/main-image.jpg" alt="메인 이미지">
            </div>
        
        <!-- ================================================================== -->	
        <h2>Game List for Confirm</h2>
        <form name="listconfirm">
        <div class="content">
            <table border="1" class="list">
            	<colgroup>
            		<col width="40%">
            		<col width="40%">
            		<col width="20%">
            	</colgroup>
	            <tr>
	                <th>Publisher</th>
	                <th>Game Name</th>
	                <td class="select_all">Select All<input type="checkbox" id="selectAll" class="check_all"></th> <!-- 전체 선택 체크박스 -->
	            </tr>
            	<c:forEach items="${dtos}" var="dto">
	                <tr>
	                    <td class="publisher">${dto.getG_developer()}</td>
	                    <td><a href="javascript:goConfirmForm('${dto.getG_code()}')">${dto.getG_name()}</a></td>
	                    <td><input type="checkbox" class="check" value="${dto.getG_code()}"></td>
	                </tr>
                </c:forEach>
            </table>
                <input type = "button" onclick="goConfirm()" value = "Confirm" class="buttons">
        </div>
        </form>
        <script src="js/main.js"></script>
    </body>
    <%@ include file = "../footer.jsp"%>
</html>