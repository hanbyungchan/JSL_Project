	const $topBtn = document.querySelector('.btns .moveTopBtn');

    // 버튼 클릭 시 맨 위로 이동
    $topBtn.onclick = () => {
        window.scrollTo({ top: 0, behavior: 'smooth' });
    };

    const $bottomBtn = document.querySelector('.moveBottomBtn');
	// 버튼 클릭 시 페이지 하단으로 이동
    $bottomBtn.onclick = () => {
    	window.scrollTo({ top: document.body.scrollHeight, behavior: 'smooth' });
    };
//=============================================================================햄버거
document.addEventListener('DOMContentLoaded', function () {
    const hamburgerMenu = document.getElementById('hamburger-menu');
    const menu = document.getElementById('menu');

    hamburgerMenu.addEventListener('click', function () {
        if (menu.style.maxHeight) {
            // 메뉴가 열려 있을 때
            menu.style.maxHeight = null;
        } else {
            // 메뉴가 닫혀 있을 때
            menu.style.maxHeight = menu.scrollHeight + "px";
        }
    });
});

//=============================================================================

window.addEventListener('scroll', function() {
    const header = document.getElementById('header');
    if (window.scrollY > 50) {
        header.classList.add('scrolled');
    } else {
        header.classList.remove('scrolled');
    }
});
//=============================================================================

document.addEventListener('DOMContentLoaded', function () {
    const communityMenu = document.querySelector('.community-menu');
    const dropdown = document.querySelector('.category-dropdown');
    let timeoutId;

    // 마우스를 커뮤니티 메뉴에 올렸을 때
    communityMenu.addEventListener('mouseenter', function () {
        clearTimeout(timeoutId); // 타이머 취소
        dropdown.classList.remove('hide-dropdown');
        dropdown.classList.add('show-dropdown');
    });

    // 마우스를 드롭다운 메뉴에 올렸을 때
    dropdown.addEventListener('mouseenter', function () {
        clearTimeout(timeoutId); // 타이머 취소
        dropdown.classList.remove('hide-dropdown');
        dropdown.classList.add('show-dropdown');
    });

    // 마우스를 커뮤니티 메뉴에서 뗐을 때
    communityMenu.addEventListener('mouseleave', function () {
        timeoutId = setTimeout(function () {
            dropdown.classList.remove('show-dropdown');
            dropdown.classList.add('hide-dropdown');
        }, 300); // 0.3초 후에 사라짐
    });

    // 드롭다운에서 마우스를 뗐을 때
    dropdown.addEventListener('mouseleave', function () {
        timeoutId = setTimeout(function () {
            dropdown.classList.remove('show-dropdown');
            dropdown.classList.add('hide-dropdown');
        }, 300); // 0.3초 후에 사라짐
    });
});
//=============================================================================
// 각 게임 항목에 마우스 이벤트 추가
document.addEventListener('DOMContentLoaded', () => {
    const gameItems = document.querySelectorAll('.game-item');
    const previewImage1 = document.querySelector('.preview-image1');
    const previewImage2 = document.querySelector('.preview-image2');
    const previewImage3 = document.querySelector('.preview-image3');
    const previewImage4 = document.querySelector('.preview-image4');

    gameItems.forEach((item, index) => {
        item.addEventListener('mouseenter', () => {
            const game = games[index];
            previewImage1.src = game.image1;
            previewImage2.src = game.image2;
            previewImage3.src = game.image3;
            previewImage4.src = game.image4;

            // 마우스를 올렸을 때 이미지를 보이도록 설정
            previewImage1.classList.add('show');
            previewImage2.classList.add('show');
            previewImage3.classList.add('show');
            previewImage4.classList.add('show');
        });
    });
});

//=============================================================================

window.addEventListener('scroll', function() {
    const footerBorder = document.querySelector('.footer-border');
    const footer = document.querySelector('footer');

    if ((window.innerHeight + window.scrollY) >= document.body.scrollHeight - 1) {
        footerBorder.classList.add('active');
        footer.classList.add('background-gray');
    } else {
        footerBorder.classList.remove('active');
        footer.classList.remove('background-gray');
    }
});
