// 슬라이드 쇼 기능
let currentIndex = 0;
const slides = document.querySelectorAll('.slide');
const dots = document.querySelectorAll('.dot');
const totalSlides = slides.length;

// 슬라이드가 존재하는 경우에만 실행
if (totalSlides > 0 && dots.length > 0) {

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

        if (slides[currentIndex] && dots[currentIndex]) {
            slides[currentIndex].classList.add('active');
            dots[currentIndex].classList.add('active');
        }

        const sliderWrapper = document.getElementById('slider-wrapper');
        if (sliderWrapper) {
            sliderWrapper.style.transform = `translateX(-${currentIndex * 100}%)`;
        }
    }

    // 'prev-slide' 버튼이 존재하는지 확인 후 이벤트 리스너 추가
    const prevSlideButton = document.getElementById('prev-slide');
    if (prevSlideButton) {
        prevSlideButton.addEventListener('click', function() {
            showSlide(currentIndex - 1);
        });
    }

    // 'next-slide' 버튼이 존재하는지 확인 후 이벤트 리스너 추가
    const nextSlideButton = document.getElementById('next-slide');
    if (nextSlideButton) {
        nextSlideButton.addEventListener('click', function() {
            showSlide(currentIndex + 1);
        });
    }

    // 'dot' 요소들이 존재할 경우에만 이벤트 리스너 추가
    if (dots.length > 0) {
        dots.forEach((dot, index) => {
            dot.addEventListener('click', () => showSlide(index));
        });
    }

    // 슬라이드 자동 재생 설정
    setInterval(() => {
        showSlide(currentIndex + 1);
    }, 5000);
}
