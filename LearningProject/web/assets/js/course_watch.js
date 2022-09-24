let course_section = document.querySelectorAll('.course-lesson-container');
course_section.forEach(function(current) {
    let course_lesson = current.children[1];
    current.children[0].onclick = function() {
        if(course_lesson.style.display === 'none') {
            course_lesson.style.display = 'block';
        } else {
            course_lesson.style.display = 'none';
        }
    }
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
})