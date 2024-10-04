document.addEventListener('DOMContentLoaded', function() {
    const introSection = document.getElementById('intro-section');
    const enterButton = document.getElementById('enter-btn');

    // "접속" 버튼 클릭 시 인트로 화면 숨기기
    enterButton.addEventListener('click', function() {
        introSection.style.display = 'none';  // 인트로 화면 숨기기
        document.body.classList.remove('hide-content');  // 메인 페이지 표시
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
        name: "OneShot: World Machine Edition",
        description: "탐험, 퍼즐, 선택적 중요성, 풍부한 스토리",
        price: "₩8,800",
        discount: "-20%",
        image: "img/game1.jpg"
    },
    {
        name: "Rogue Waters",
        description: "전략 RPG, 탐험",
        price: "₩25,600",
        discount: "-20%",
        image: "img/game1.jpg"
    },
	{
        name: "Rogue 111111",
        description: "전략 RPG, 탐험",
        price: "₩25,600",
        discount: "-20%",
        image: "img/game1.jpg"
    },
	{
        name: "Rogue 222222",
        description: "전략 RPG, 탐험",
        price: "₩25,600",
        discount: "-20%",
        image: "img/game1.jpg"
    },
	{
        name: "Rogue 333333",
        description: "전략 RPG, 탐험",
        price: "₩25,600",
        discount: "-20%",
        image: "img/game2.jpg"
    },
	{
        name: "Rogue 444444",
        description: "전략 RPG, 탐험",
        price: "₩25,600",
        discount: "-20%",
        image: "img/game1.jpg"
    },
	{
        name: "Rogue 55555",
        description: "전략 RPG, 탐험",
        price: "₩25,600",
        discount: "-20%",
        image: "img/game1.jpg"
    },
    // 필요한 추가 게임 데이터들
];

const gameItems = document.querySelectorAll('.game-item');
const previewImage = document.getElementById('preview-image');
const previewTitle = document.getElementById('preview-title');
const previewText = document.getElementById('preview-text');

// 각 게임 항목에 마우스 이벤트 추가
gameItems.forEach((item, index) => {
    item.addEventListener('mouseenter', () => {
        const game = games[index];
        previewImage.src = game.image;
        previewTitle.textContent = game.name;
        previewText.textContent = game.description;
    });
});
