
const visualSlider = document.querySelector('.visual-slider');
const slideList = document.querySelector('.slide-list');
const inners = document.querySelectorAll('.inner');

let currentIndex = 0;

inners.forEach((inner) => {
    inner.style.width = `${visualSlider.clientWidth}px`;
})

slideList.style.width = `${visualSlider.clientWidth * inners.length}px`;

// const slickPrev = document.querySelector('.slick-prev');
// const slickNext = document.querySelector('.slick-next');

// slickPrev.addEventListener('click', () => {
//     currentIndex--;
//     currentIndex = currentIndex < 0 ? 0 : currentIndex;
//     slideList.style.marginLeft = `-${visualSlider.clientWidth * currentIndex}px`;
//     clearInterval(interval);
//     interval = getInterval();
// });

// slickNext.addEventListener('click', () => {
//     currentIndex++;
//     currentIndex = currentIndex >= inners.length ? inners.length - 1 : currentIndex;
//     slideList.style.marginLeft = `-${visualSlider.clientWidth * currentIndex}px`;
//     clearInterval(interval);
//     interval = getInterval();
// });

const getInterval = () => {
    return setInterval(() => {
        currentIndex++;
        currentIndex = currentIndex >= inners.length ? 0 : currentIndex;
        slideList.style.marginLeft = `-${visualSlider.clientWidth * currentIndex}px`;
    }, 3000);
}

let interval = getInterval();
