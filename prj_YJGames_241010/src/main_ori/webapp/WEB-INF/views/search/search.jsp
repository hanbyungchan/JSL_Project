<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>JSL Games</title>

        <link rel="icon" type="image/png" href="img/logo.png" />

        <!-- CSS 연동 -->
        <link rel="stylesheet" href="css/styles.css" />
        <link rel="stylesheet" href="css/gamesearch.css" />

        <!-- Font Awesome 아이콘 -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    </head>
    <body>
        <header class="header" id="header">
            <div class="header-content">
                <div class="logo">
                    <img src="img/logo.png" alt="사이트 로고" />
                </div>
                <nav class="menu" id="menu">
                    <ul>
                        <li><a href="#">STORE</a></li>
                        <li><a href="#">COMMUNITY</a></li>
                        <li><a href="#">SUPPORT</a></li>
                        <li><a href="#">Ex</a></li>
                        <li><a href="#">SIGN IN</a></li>
                    </ul>
                </nav>
                <div class="icons">
                    <a href="#"><i class="fas fa-search"></i></a>
                    <a href="#"><i class="fas fa-shopping-cart"></i></a>
                </div>
            </div>
        </header>

<script type="text/javascript">
	function goSearch(){//새로고침 하면서 보낸 정보만을 정렬하게끔
		
		
		
		/* for(var i=0; i<srch.elements['t_genre'].length; i++){
	    	if(srch.elements['t_genre'][i].checked){
	    		alert(srch.elements['t_genre'][i].value);
	    		checkBoxData[i] = srch.elements['t_genre'][i].value;
	    	}
		} */
		
		
		srch.method="post";
		srch.action="Search";
		srch.submit();
	}
	function goViewStore(no){
		srch.t_storeNo.value=no;
		//srch.t_gubun.value="";
		srch.method="post";
		srch.action="";//view 링크 달 것. t_gubun 필요하면 위의 주석 이용
		srch.submit();
	}

</script>

        <div class="main-image">
            <img src="img/main-image.jpg" alt="메인 이미지" />
        </div>

        <script src="js/main.js"></script>

        <div class="search_content">
            <div class="search_result slider-header">
                <h3>Result</h3>

                <div class="underline"></div>
                <div class="game-box">
                <c:forEach items="${dtos}" var="dto">
                <c:if test="${dto.getG_sale_price() eq '0'}">
                <div class="game-result">
                    <a href="javascript:goViewStore('${dto.getS_page_no()}')">
                        <span class="img">
                            <img src="img/${dto.getG_code()}/${dto.getG_file()}" alt="카테고리 이미지 1" />
                        </span>
                        <p class="result-title">${dto.getG_name()}</p>
                        <p class="search-price-box">
                            <span class="search-discounted-price">FREE!!</span>
                        </p>
                    </a>
                </div>
                </c:if>
                <c:if test="${dto.getG_sale_price() ne '0'}">
                <div class="game-result">
                    <a href="javascript:goViewStore('${dto.getS_page_no()}')">
                        <span class="img">
                            <img src="img/${dto.getG_code()}/${dto.getG_file()}" alt="카테고리 이미지 1" />
                        </span>
                        <p class="result-title">${dto.getG_name()}</p>
                        <p class="search-price-box">
                            <span class="search-discount-rate">-${dto.getS_sale()}%%</span>
                            <span class="search-discounted-price">$${dto.getG_sale_price()}</span>
                            <span class="search-original-price">$${dto.getG_price()}</span>
                        </p>
                    </a>
                </div>
                </c:if>
                </c:forEach>
                
                <!-- 
                -----------*------------------------------------------*-----------------------
                <c:forEach items="${dtos}" var="dto">
                    <div class="game-result">
                        <a href="javascript:goViewStore('${dto.getS_page_no()}')">
                            <span class="img">
                                <img src="img/${dto.getG_code()}/${dto.getG_file()}" alt="카테고리 이미지 1" />
                            </span>
                            <p>${dto.getG_name()}</p>
                            <span class="price">$${dto.getG_price()}</span>
                            <span class="discount">-${dto.getS_sale()}%</span>
                        </a>
                    </div>
                </c:forEach>
                 -->
                
                
                </div>
            </div>
			
            <div class="search_filter">
                <div class="filter-menu">
                    <!-- 검색창을 필터 메뉴 상단에 배치 -->
                    <!-- 장르 dto 받아와서 반복문 돌리기 -->
                    <form name="srch">
                    <div class="search-bar">
                   		<input type="hidden" name="t_storeNo">
                   		<input type="hidden" name="t_gubun">
                        <input type="text" name="t_search" value="${dto.getS_txt()}" placeholder="Search games, categories..." />
                    </div>

                    <h3>Filter By</h3>

                    <!-- 가격 필터 -->
                    <div class="filter-group">
                        <label>Price Range:</label>
                        <select name="t_price">
                            <option value="9999" <c:if test="${price eq '9999'}">selected</c:if>>All Prices</option>
                            <option value="0" <c:if test="${price eq '0'}">selected</c:if>>Free</option>
                            <option value="10" <c:if test="${price eq '10'}">selected</c:if>>$10 or less</option>
                            <option value="20" <c:if test="${price eq '20'}">selected</c:if>>$20 or less</option>
                            <option value="50" <c:if test="${price eq '50'}">selected</c:if>>$50 or less</option>
                        </select>
                    </div>
					
                    <!-- 장르 필터 -->
                    <div class="filter-group">
                        <label id="genreLabel">Genre:</label>
                        <span class="toggle-arrow" id="genreArrow">▶</span>
                        <div class="genre-options" id="genreOptions">
                        
                        <c:forEach items="${genreDtos}" var="dto">
                            <input type="checkbox" name="t_genre" <c:forEach items="${genreList}" var="g"><c:if test="${g eq dto.getGenre_code()}">checked</c:if></c:forEach> value="${dto.getGenre_code()}" />
                            <label for="${dto.getGenre_name()}">${dto.getGenre_name()}</label><br />
                        </c:forEach>
                        <!--     <input type="checkbox" id="action" name="t_genre" value="4" />
                            <label for="action">Action</label><br />
                            
                            <input type="checkbox" id="adventure" name="t_genre" value="5" />
                            <label for="adventure">Adventure</label><br />
                            
                            <input type="checkbox" id="simulation" name="t_genre" value="8" />
                            <label for="simulation">Simulation</label><br />
                            
                            <input type="checkbox" id="horror" name="t_genre" value="14" />
                            <label for="simulation">Horror</label><br />
                             -->
                             <!-- 
                             나중에 세 html파일 받아서 다듬어줘야 함.
                              -->
                        </div>
                    </div>
                    </form>
                    
                    <!-- 검색 버튼 -->
                    <button class="apply-button" onclick="goSearch()">Search</button>
                    
                </div>

                <script>
                    const genreArrow = document.getElementById('genreArrow');
                    const genreOptions = document.getElementById('genreOptions');
                    const genreLabel = document.getElementById('genreLabel');

                    function toggleGenreOptions() {
                        // 장르 옵션을 토글
                        genreOptions.style.display = genreOptions.style.display === 'block' ? 'none' : 'block';

                        // 화살표 회전 애니메이션
                        genreArrow.classList.toggle('rotate');

                        genreLabel.classList.toggle('rotate');
                    }

                    // 화살표 클릭 시
                    genreArrow.addEventListener('click', toggleGenreOptions);

                    // 장르 label 클릭 시
                    genreLabel.addEventListener('click', toggleGenreOptions);
                    
                	
                </script>
            </div>
        </div>
    </body>
</html>

<!-- 푸터 -->
<footer class="footer">
    <div class="footer-container">
        <div class="footer-logo">
            <img src="img/logo.png" alt="사이트 로고" />
        </div>
        <div class="footer-links">
            <ul>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Contact</a></li>
                <li><a href="#">Privacy Policy</a></li>
                <li><a href="#">Terms of Service</a></li>
            </ul>
        </div>
        <div class="footer-social">
            <a href="#"><i class="fab fa-facebook-f"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-youtube"></i></a>
        </div>
        <div class="footer-copyright">
            <p>&copy; 2024 Futuristic Gaming Platform. All rights reserved.</p>
        </div>
    </div>
</footer>
    