function showAllAchievements() {
    const achievements = document.querySelectorAll('#achievement-list li');
    achievements.forEach(achievement => {
        achievement.style.display = 'list-item'; // 모두 보이게 함
    });
}

function hideAchievements() {
    const achievements = document.querySelectorAll('#achievement-list li');
    achievements.forEach((achievement, index) => {
        if (index >= 5) {
            achievement.style.display = 'none'; // 다시 숨김
        }
    });
}
chrome.runtime.onMessage.addListener((request, sender, sendResponse) => {
    // 비동기 작업 수행
    doAsyncOperation().then(response => {
        sendResponse(response); // 응답 보내기
    });
    return true; // 비동기 응답을 나타냄
});
chrome.runtime.onMessage.addListener((message, sender, sendResponse) => {
    // 메시지 처리 로직
});