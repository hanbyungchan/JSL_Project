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