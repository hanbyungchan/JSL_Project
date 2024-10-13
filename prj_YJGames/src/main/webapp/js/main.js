document.getElementById('search-icon').addEventListener('click', function(event) {
    event.preventDefault(); // 기본 동작 방지
    const searchBox = document.getElementById('search-box');
    
    // 검색창의 active 상태를 토글
    if (searchBox.classList.contains('active')) {
        searchBox.classList.remove('active');
    } else {
        searchBox.classList.add('active');
    }
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
        name: "Banana",
        description: "action,RPG,FPS",
        price: "Free",
        discount: "",
        image: "img/4/4.jpg"
    },
    {
        name: "Monster Hunter: World",
        description: "action,RPG,FPS",
        price: "$25.75",
        discount: "-60%",
        image: "img/1/1.jpg"
    },
	{
        name: "EA SPORTS FC™ 25",
        description: "action,RPG,FPS",
        price: "₩25,600",
        discount: "-60%",
        image: "img/8/1.jpg"
    },
	{
        name: "trickcal Revive",
        description: "action,RPG,FPS",
        price: "₩25,600",
        discount: "-20%",
        image: "img/6/1.jpg"
    },
	{
        name: "Stardew Valley",
        description: "action,RPG,FPS",
        price: "₩25,600",
        discount: "-20%",
        image: "img/5/1.jpg"
    },
	{
        name: "Terraria",
        description: "action,RPG,FPS",
        price: "₩25,600",
        discount: "-20%",
        image: "img/7/1.jpg"
    },
	{
        name: "Grand Theft Auto V",
        description: "action,RPG,FPS",
        price: "₩25,600",
        discount: "-20%",
        image: "img/3/1.jpg"
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
