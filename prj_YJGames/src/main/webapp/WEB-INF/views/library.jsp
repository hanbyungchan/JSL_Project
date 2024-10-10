<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게임 라이브러리</title>
    <link rel="stylesheet" href="css/Library.css">
</head>
<script type="text/javascript">
function performSearch() {
	//걍 만들어봄 헷갈리면 지워 검색버튼 누르면 진행되는건데  빈칸이면 alert뜨게함
    const query = document.getElementById('search-input').value;
    if (query) {
        // 여기에 실제 검색 기능을 구현하면 됩니다.
        console.log("검색어:", query);
        // 예: location.href = "/search?query=" + query; (검색 페이지로 이동)
    } else {
        alert("검색어를 입력하세요.");
    }
}
</script>
<body>
    <div class="container">
        <!-- 사이드바 (게임 리스트) -->
        <div class="sidebar">
           <div class="search">
			    <input type="text" placeholder="검색..." id="search-input">
			    <button class="search-icon" onclick="performSearch()">🔍</button> <!-- 버튼으로 변경 -->
			</div>
            <div class="recent">
                <h2>Recently</h2>
                <ul>
                    <li>Wallpaper Engine</li>
                    <li>Stoneshard</li>
                    <li>Empire of Sin</li>
                    <li>Frostpunk</li>
                </ul>
            </div>
            <div class="game-list">
                <h2>October</h2>
                <ul>
                    <li>3DMark</li>
                    <li>Gladiator Guild Manager</li>
                    <li>Frontier of Fortune</li>
                </ul>
                <h2>September</h2>
                <ul>
                    <li>GUNBIRD</li>
                    <li>The Last Spell</li>
                    <li>Surviving Mars</li>
                </ul>
               
            </div>
             <div class="game-list">
              <h2>All games</h2>
                <ul>
                    <li>GUNBIRD</li>
                    <li>The Last Spell</li>
                    <li>Surviving Mars</li>
                    <li>GUNBIRD</li>
                    <li>The Last Spell</li>
                    <li>Surviving Mars</li>
                    <li>GUNBIRD</li>
                    <li>The Last Spell</li>
                    <li>Surviving Mars</li>
                </ul>
                </div>
        </div>

        <!-- 메인 콘텐츠 -->
        <div class="main-content">
            <!-- 많이 한 플레이 섹션 -->
            <hr class="divider">
            <h2>Played a lot</h2>
            <div class="game-thumbnails-slider">
                <div class="game">
                    <img src="https://cdn.akamai.steamstatic.com/store/home/store_home_share.jpg" alt="Mass Effect">
                    <p>Mass Effect</p>
                </div>
                <div class="game">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTuH3nuQ8g3bFzLJr-qiMBc1sDjylre6U0vw&s" alt="Skyrim">
                    <p>Skyrim</p>
                </div>
                <div class="game">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTuH3nuQ8g3bFzLJr-qiMBc1sDjylre6U0vw&s" alt="Company of Heroes">
                    <p>Company of Heroes</p>
                </div>
                
                <div class="game">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTuH3nuQ8g3bFzLJr-qiMBc1sDjylre6U0vw&s" alt="Bioshock Infinite">
                    <p>Bioshock Infinite</p>
                </div>
                <div class="game">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTuH3nuQ8g3bFzLJr-qiMBc1sDjylre6U0vw&s" alt="Bioshock Infinite">
                    <p>Bioshock Infinite</p>
                </div>
                <div class="game">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTuH3nuQ8g3bFzLJr-qiMBc1sDjylre6U0vw&s" alt="Bioshock Infinite">
                    <p>Bioshock Infinite</p>
                </div>
            </div>

            <!-- 다음 플레이 섹션 -->
            <hr class="divider">
            <h2>Next play</h2>
            <div class="game-thumbnails-slider">
                <div class="game">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTuH3nuQ8g3bFzLJr-qiMBc1sDjylre6U0vw&s" alt="Total War: Attila">
                    <p>Total War: Attila</p>
                </div>
                <div class="game">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTuH3nuQ8g3bFzLJr-qiMBc1sDjylre6U0vw&s" alt="Total War: Empire">
                    <p>Total War: Empire</p>
                </div>
                <div class="game">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTuH3nuQ8g3bFzLJr-qiMBc1sDjylre6U0vw&s" alt="For Honor">
                    <p>For Honor</p>
                </div>
                <div class="game">
                    
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTuH3nuQ8g3bFzLJr-qiMBc1sDjylre6U0vw&s" alt="Bioshock Infinite">
                    <p>Bioshock Infinite</p>
                </div>
                <div class="game">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTuH3nuQ8g3bFzLJr-qiMBc1sDjylre6U0vw&s" alt="Bioshock Infinite">
                    <p>Bioshock Infinite</p>
                </div>
                <div class="game">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTuH3nuQ8g3bFzLJr-qiMBc1sDjylre6U0vw&s" alt="Bioshock Infinite">
                    <p>Bioshock Infinite</p>
                </div>
                <div class="game">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTuH3nuQ8g3bFzLJr-qiMBc1sDjylre6U0vw&s" alt="Bioshock Infinite">
                    <p>Bioshock Infinite</p>
                </div>
            </div>

            <!-- 모든 게임 섹션 -->
            <hr class="divider">
            <h2>All games</h2>
            <div class="game-thumbnails-slider">
                <div class="game">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTuH3nuQ8g3bFzLJr-qiMBc1sDjylre6U0vw&s" alt="Bioshock Infinite">
                    <p>Bioshock Infinite</p>
                </div>
                <div class="game">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTuH3nuQ8g3bFzLJr-qiMBc1sDjylre6U0vw&s" alt="Divinity Original Sin 2">
                    <p>Divinity Original Sin 2</p>
                </div>
                <div class="game">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTuH3nuQ8g3bFzLJr-qiMBc1sDjylre6U0vw&s" alt="Skyrim">
                    <p>Skyrim</p>
                </div>
                 <div class="game">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTuH3nuQ8g3bFzLJr-qiMBc1sDjylre6U0vw&s" alt="Skyrim">
                    <p>Skyrim</p>
                </div>
                 <div class="game">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTuH3nuQ8g3bFzLJr-qiMBc1sDjylre6U0vw&s" alt="Skyrim">
                    <p>Skyrim</p>
                </div>
                 <div class="game">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTuH3nuQ8g3bFzLJr-qiMBc1sDjylre6U0vw&s" alt="Skyrim">
                    <p>Skyrim</p>
                </div>
                 <div class="game">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTuH3nuQ8g3bFzLJr-qiMBc1sDjylre6U0vw&s" alt="Skyrim">
                    <p>Skyrim</p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>