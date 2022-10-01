let thumbnail = document.querySelector('#thumbnail');
let avatar_preview = document.querySelector('.image-thumbnail');
thumbnail.addEventListener('change', (e) => {
    if (e.target.files.length) {
        const src = URL.createObjectURL(e.target.files[0]);
        avatar_preview.src = src;
        avatar_preview.style.display = 'block';
        $('.icon').css('display', 'none');
        $('.course-thumbnail-img').css('border', 'none');
    }
})

function createObjective() {
    let section_create = document.createElement('div');
    let section_list = document.querySelector('.section-list');
    $(section_create).addClass('section-create mb-2');
    $(section_create).append(`<div class="section-title">1. Section 1</div>`);
    section_list.appendChild(section_create);
}
