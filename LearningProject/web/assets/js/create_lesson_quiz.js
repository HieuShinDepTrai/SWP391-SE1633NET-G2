function addAnswer() {
    let answerContent = $("#addAnswer").val();
    let isAnswer = $("#isAnswer").prop('checked');
    if (answerContent !== "") {
        if (isAnswer) {
            $("#AnswerList").append(`
            <div class="mb-3">
                <input type="hidden" name="answer" value="${answerContent}-true">
                <div class="card card-body w-50 bg-success text-white d-inline-block">
                    ${answerContent}
                </div>
                <div class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editAnswerModal" onclick="editAnswer($(this).prev())">Edit</div>
                <div class="btn btn-danger d-inline-block" onclick="remove(this.parentNode)">Remove</div>
            </div>
            `);
        } else {
            $("#AnswerList").append(`
            <div class="mb-3">
                <input type="hidden" name="answer" value="${answerContent}-false">
                <div class="card card-body w-50 bg-danger text-white d-inline-block">
                    ${answerContent}
                </div>
                <div class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editAnswerModal" onclick="editAnswer($(this).prev())">Edit</div>
                <div class="btn btn-danger d-inline-block" onclick="remove(this.parentNode)">Remove</div>
            </div>
            `);
        }
        $("#addAnswer").val('');
        $("#isAnswer").prop('checked', false);
        $('#addAnswerModal').modal('toggle');
    } else {
        window.alert("Answer content is empty");
    }
}

function remove(current) {
    current.remove();
}
let editAnswerObj = null;
function editAnswer(current) {
    editAnswerObj = current;
    let answerContent = $(current).html().trim();
    // console.log(answerContent);
    let isAnswer = false;

    if ($(current).hasClass("bg-success")) {
        isAnswer = true;
    }

    $("#editAnswer").val(answerContent);

    if (isAnswer) {
        $("#editIsAnswer").prop("checked", true);
    } else {
        $("#editIsAnswer").prop("checked", false);
    }
    // console.log($(editAnswerObj).text());
}

function saveEditAnswer() {
    let editAnswerContent = document.getElementById("editAnswer");
    let isAnswer = document.getElementById("editIsAnswer");

    $(editAnswerObj).html(editAnswerContent.value);

    let valueHidden = $(editAnswerObj).prev();
    if(isAnswer.checked) {
        $(valueHidden).val(editAnswerContent.value + "-true");
        console.log($(valueHidden).val());
    } else {
        $(valueHidden).val(editAnswerContent.value + "-false");
                console.log($(valueHidden).val());
    }
    
    //Nếu như tích answer và obj là btn-danger → đổi màu
    if (isAnswer.checked && $(editAnswerObj).hasClass("bg-danger")) {
        $(editAnswerObj).removeClass("bg-danger");
        $(editAnswerObj).addClass("bg-success");
    } 
    
    //Nếu như bỏ tích answer mà obj là btn-success → đổi 
    if (!isAnswer.checked && $(editAnswerObj).hasClass("bg-success")) {
        $(editAnswerObj).removeClass("bg-success");
        $(editAnswerObj).addClass("bg-danger");
    } 
    
    editAnswerObj = null;
    $('#editAnswerModal').modal('toggle');
}


//function sendParameter(param) {
//    let index = param.getAttribute("index");
////    $.ajax({
////        url: "/LearningProject/QuizQuestion",
////        type: "post",
////        data: {
////
////        },
////        success: function (response) {
////
////        }
////    });
//    $("#editQuestionModal").modal("show");
//}