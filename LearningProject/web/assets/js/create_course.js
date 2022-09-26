let thumbnail = document.querySelector('#thumbnail');
let avatar_preview = document.querySelector('.image-thumbnail');
thumbnail.addEventListener('change', (e) => {
    if(e.target.files.length) {
        const src = URL.createObjectURL(e.target.files[0]);
        avatar_preview.src = src;
        avatar_preview.style.display = 'block';
        $('.icon').css('display', 'none');
        $('.course-thumbnail-img').css('border', 'none');
    }
})