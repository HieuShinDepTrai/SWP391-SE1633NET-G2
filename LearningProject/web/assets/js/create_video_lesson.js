function video_preview() {
    // let src = current.value;
    console.log($('#video-url').val());
    let video_url = $('#video-url').val();
    let video_id = youtube_parser(video_url);
    $('#url-preview').attr('src', 'https://www.youtube.com/embed/' + video_id);
    $('#url-preview').css('display', 'block');
    console.log($('#url-preview').attr('src'));
    $('.icon-youtube').css('display', 'none');
}

function youtube_parser(url){
    var regExp = /^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#&?]*).*/;
    var match = url.match(regExp);
    return (match&&match[7].length==11)? match[7] : false;
}