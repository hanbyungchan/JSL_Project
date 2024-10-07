        window.addEventListener('scroll', function() {
            const header = document.getElementById('header');
            if (window.scrollY > 50) {
                header.classList.add('scrolled');
            } else {
                header.classList.remove('scrolled');
            }
        });

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
		
		