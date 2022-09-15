var profile = document.querySelector('.link-profile');
var course = document.querySelector('.link-course');
var menu = document.querySelectorAll('.menu');

function resetMenu() {
    menu.forEach((item) => {
        item.classList.remove('menu-active');
    })
}


function reset() {
    profile.classList.remove('active');
    course.classList.remove('active');
}

function profile_link(menu) {
    reset();
    resetMenu();
    profile.classList.add('active');
    menu.classList.add('menu-active');
}

function course_link(menu) {
    reset();
    resetMenu();
    course.classList.add('active');
    menu.classList.add('menu-active');
}


var avatar_preview = document.querySelector('.avatar-preview img');
var formFile = document.querySelector('.modal-body #formFile');

formFile.addEventListener('change', (e) => {
    if (e.target.files.length) {
        const src = URL.createObjectURL(e.target.files[0]);
        avatar_preview.src = src;
    }
})

/* Disable input form */
var isDisaled = true;
function disableOff(button) {
    var input = document.querySelectorAll('.account-information-section input');
    input.forEach((item) => {
        item.disabled = false;
    })
    button.innerHTML = "Save";
    isDisaled = false;
}