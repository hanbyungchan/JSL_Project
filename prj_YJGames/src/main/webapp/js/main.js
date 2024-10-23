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
        clearTimeout(timeoutId); // 사라지는 타이머가 있다면 취소
        dropdown.style.maxHeight = '500px';
        dropdown.style.opacity = '1';
        dropdown.style.visibility = 'visible';
    });

    // 마우스를 드롭다운 메뉴에 올렸을 때 (유예 시간 제공)
    dropdown.addEventListener('mouseenter', function () {
        clearTimeout(timeoutId); // 사라지는 타이머가 있다면 취소
        dropdown.style.maxHeight = '500px';
        dropdown.style.opacity = '1';
        dropdown.style.visibility = 'visible';
    });

    // 마우스를 커뮤니티 메뉴 또는 드롭다운 메뉴에서 뗐을 때
    communityMenu.addEventListener('mouseleave', hideDropdownWithDelay);
    dropdown.addEventListener('mouseleave', hideDropdownWithDelay);

    function hideDropdownWithDelay() {
        timeoutId = setTimeout(function () {
            dropdown.style.maxHeight = '0';
            dropdown.style.opacity = '0';
            dropdown.style.visibility = 'hidden';
        }, 500); // 0.5초 후에 사라짐
    }
});

//=============================================================================

// 슬라이드 쇼 기능
let currentIndex = 0;
const slides = document.querySelectorAll('.slide');
const dots = document.querySelectorAll('.dot');
const totalSlides = slides.length;

function showSlide(index) {
    if (index < 0) {
        currentIndex = totalSlides - 1;
    } else if (index >= totalSlides) {
        currentIndex = 0;
    } else {
        currentIndex = index;
    }

    slides.forEach(slide => slide.classList.remove('active'));
    dots.forEach(dot => dot.classList.remove('active'));
    slides[currentIndex].classList.add('active');
    dots[currentIndex].classList.add('active');

    document.getElementById('slider-wrapper').style.transform = `translateX(-${currentIndex * 100}%)`;
}

document.getElementById('prev-slide').addEventListener('click', function() {
    showSlide(currentIndex - 1);
});

document.getElementById('next-slide').addEventListener('click', function() {
    showSlide(currentIndex + 1);
});

dots.forEach((dot, index) => {
    dot.addEventListener('click', () => showSlide(index));
});

setInterval(() => {
    showSlide(currentIndex + 1);
}, 5000);

// ======================
// 최신 게임 섹션 이미지 변경 기능
// ======================

const games = [
    {
        image1: "img/4/1.jpg",
        image2: "img/4/2.jpg",
        image3: "img/4/3.jpg",
        image4: "img/4/4.jpg"
    },
    {
        image1: "img/1/1.jpg",
        image2: "img/1/2.jpg",
        image3: "img/1/3.jpg",
        image4: "img/1/4.jpg"
    },
	{
		image1: "img/8/1.jpg",
        image2: "img/8/2.jpg",
        image3: "img/8/3.jpg",
        image4: "img/8/4.jpg"
    },
	{
		image1: "img/6/1.jpg",
        image2: "img/6/2.jpg",
        image3: "img/6/3.jpg",
        image4: "img/6/4.jpg"
    },
	{
		image1: "img/5/1.jpg",
        image2: "img/5/2.jpg",
        image3: "img/5/3.jpg",
        image4: "img/5/4.jpg"
    },
	{
		image1: "img/7/1.jpg",
        image2: "img/7/2.jpg",
        image3: "img/7/3.jpg",
        image4: "img/7/4.jpg"
    },
	{
		image1: "img/3/1.jpg",
        image2: "img/3/2.jpg",
        image3: "img/3/3.jpg",
        image4: "img/3/4.jpg"
    },
    // 필요한 추가 게임 데이터들
];

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

