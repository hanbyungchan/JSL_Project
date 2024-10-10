//=========================================================================================================

document.addEventListener('DOMContentLoaded', function() {
    let currentIndex = 0;
    let autoSlideTimer; // 자동 슬라이드 타이머를 저장할 변수
    const gallery = document.getElementById('media-gallery');
    const mediaItems = gallery.children;
    const totalItems = mediaItems.length;

    function resetAutoSlideTimer() {
        // 이전 타이머가 있으면 초기화
        if (autoSlideTimer) {
            clearTimeout(autoSlideTimer);
        }

        const currentItem = mediaItems[currentIndex];
        const isVideo = currentItem.getAttribute('data-video-src');

        if (isVideo) {
            const video = document.getElementById('main-video');
            autoSlideTimer = setTimeout(() => {
                showNextMedia(1);
            }, video.duration * 1000 + 1000); // 동영상 재생 시간 + 1초 후 다음 미디어로 이동
        } else {
            autoSlideTimer = setTimeout(() => {
                showNextMedia(1);
            }, 5000); // 이미지일 경우 5초 후 다음 미디어로 이동
        }
    }

    function changeMedia(type, src) {
        const mainMedia = document.getElementById('main-media');
        const previousThumbnail = mediaItems[currentIndex];

        // 기존 활성화된 썸네일의 줌인 효과 제거
        if (previousThumbnail) {
            previousThumbnail.classList.remove('active-thumbnail');
        }

        if (mainMedia.querySelector('video, img')) {
            mainMedia.querySelector('video, img').style.transform = 'translateY(-100%)'; // 기존 미디어가 위로 사라짐
        }

        setTimeout(() => {
            if (type === 'video') {
                mainMedia.innerHTML = `<video id="main-video" src="${src}" width="100%" height="100%" controls autoplay muted></video>`;
                const video = document.getElementById('main-video');
                video.play();
                video.muted = true; // 자동 재생 시 음소거 설정

                video.addEventListener('ended', function() {
                    resetAutoSlideTimer(); // 비디오가 끝나면 자동 슬라이드 타이머 초기화
                });
            } else if (type === 'img') {
                mainMedia.innerHTML = `<img src="${src}" width="100%" height="100%" alt="이미지">`;
            }

            setTimeout(() => {
                const newMediaElement = mainMedia.querySelector('video, img');
                if (newMediaElement) {
                    newMediaElement.style.transform = 'translateY(0)'; // 새 미디어가 아래에서 나타남
                }
            }, 50);

            mediaItems[currentIndex].classList.add('active-thumbnail');
        }, 500);

        resetAutoSlideTimer(); // 미디어가 바뀔 때마다 타이머 초기화
    }

    function showNextMedia(direction) {
        // 자동 슬라이드 타이머 초기화
        resetAutoSlideTimer();

        const previousIndex = currentIndex;
        currentIndex = (currentIndex + direction + totalItems) % totalItems;
        const currentItem = mediaItems[currentIndex];
        const isVideo = currentItem.getAttribute('data-video-src');

        // 이전 썸네일에서 줌아웃 효과 적용
        mediaItems[previousIndex].classList.remove('active-thumbnail');

        changeMedia(isVideo ? 'video' : 'img', isVideo ? currentItem.getAttribute('data-video-src') : currentItem.getAttribute('src'));
    }

    // 좌우 버튼 클릭 시 미디어 변경
    document.getElementById('prev-btn').addEventListener('click', function() {
        showNextMedia(-1); // 수동으로 이전 미디어로 넘기면 타이머가 초기화됨
    });

    document.getElementById('next-btn').addEventListener('click', function() {
        showNextMedia(1); // 수동으로 다음 미디어로 넘기면 타이머가 초기화됨
    });

    // 썸네일 클릭 시 미디어 변경 및 타이머 초기화
    Array.from(mediaItems).forEach((item, index) => {
        item.addEventListener('click', () => {
            const isVideo = item.getAttribute('data-video-src');

            // 현재 활성화된 썸네일에서 줌아웃 효과 제거
            mediaItems[currentIndex].classList.remove('active-thumbnail');

            currentIndex = index; // 현재 인덱스 업데이트
            changeMedia(isVideo ? 'video' : 'img', isVideo ? item.getAttribute('data-video-src') : item.getAttribute('src'));

            // 클릭된 썸네일에 줌인 효과 적용
            item.classList.add('active-thumbnail');
        });
    });

    // 페이지 최초 로드 시 첫 번째 미디어를 자동으로 재생
    changeMedia('video', mediaItems[0].getAttribute('data-video-src'));
});




//=========================================================================================================



// 펼치기/접기 버튼으로 추가 콘텐츠 표시/숨기기 기능
function toggleContent() {
    const content = document.querySelector('.extra-content');
    const btn = document.getElementById('toggle-btn');

    if (content.style.maxHeight && content.style.maxHeight !== '0px') {
        // 콘텐츠가 펼쳐져 있는 경우 (접기)
        content.style.maxHeight = '0px';
        btn.textContent = '펼치기'; // 버튼 텍스트를 "펼치기"로 변경
    } else {
        // 콘텐츠가 숨겨져 있는 경우 (펼치기)
        content.style.maxHeight = content.scrollHeight + 'px';
        btn.textContent = '접기'; // 버튼 텍스트를 "접기"로 변경
    }
}

// 페이지 로드 시 추가 콘텐츠는 숨김 상태로 설정
window.onload = function() {
    const content = document.querySelector('.extra-content');
    content.style.maxHeight = '0px'; // 페이지 로드 시 콘텐츠 숨기기
};






