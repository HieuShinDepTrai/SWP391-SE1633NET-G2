let course_section = document.querySelectorAll(".course-lesson-container");
course_section.forEach(function (current) {
  let course_lesson = current.children[1];
  current.children[0].onclick = function () {
    if (course_lesson.style.display === "none") {
      course_lesson.style.display = "block";
    } else {
      course_lesson.style.display = "none";
    }
  };
  // current.onclick = function() {
  //     console.log(this);
  // let course_lesson = this.children[1];
  // console.log(course_lesson);
  // if(course_lesson.style.display === 'none') {
  //     course_lesson.style.display = 'block';
  // } else {
  //     course_lesson.style.display = 'none';
  // }
  // }
});

function auto_height(elem) {
  /* javascript */
  elem.style.height = "28px";
  elem.style.height = elem.scrollHeight + "px";
}

function active_comment_button(current) {
  let submit_comment = $(current).parent().next().children(".submit-comment");
  if (current.value !== "") {
    $(submit_comment).addClass("submit-comment-active");
  } else {
    $(submit_comment).removeClass("submit-comment-active");
  }
}

function show_reply_post_comment(elem) {
    $(elem).parent().next().toggleClass('d-none');
}

$("#course-comment-close").click(function(){
    $('.course-comment-container').hide();
});

$('.lesson-comment').click(function(){
    $('.course-comment-container').show();
})


function disableOn(input) {
    var put = document.querySelector('.content-comment');
    
    put.disabled = false;
    
    
    input.classList.add('d-none');
    document.querySelector('#Save').classList.remove('d-none')
}
