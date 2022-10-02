function khovloz(current) {
    console.log(current);
    let sectionNameModal = document.getElementById("valueEdit");
    let CourseID = $("#CourseID").val();
    let parentElement = $(current).parent();
    let sectionID = $(parentElement).next();
    let sectionName = $(sectionID).next();
    console.log(sectionNameModal);
    sectionNameModal.value = sectionName.html();
    console.log(sectionNameModal.value);

    console.log(sectionID.html());
    console.log(sectionName.html());
    $.ajax({
        url: "/LearningProject/CreateSection",
        type: "get", //send it through get method
        data: { 
            courseId: CourseID,
            sectionID: sectionID.html(),
            SectionName: sectionName.html(),
            edit: 'true',
        },
        success: function(response) {
          //Do Something
        },
        error: function(xhr) {
          //Do Something to handle error
        }
    });
}

$.ajax({
    url: "/LearningProject/CreateSection",
    type: "get", //send it through get method
    data: { 
      
    },
    success: function(response) {
      //Do Something
    },
    error: function(xhr) {
      //Do Something to handle error
    }
});