/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

async function doSubmit() {
    // get video id from video-link
    try {
        const videoLink = document.querySelector('input[name="video_url"]').value;
        const videoId = videoLink.split('watch?v=')[1];

        const API_KEY = "AIzaSyBBcUOX-BytFmB96iWqMBIsRLzTgP0hhWQ"

        // use google api for get video detail
        const duration = await fetch(`https://www.googleapis.com/youtube/v3/videos?id=${videoId}&part=contentDetails&key=${API_KEY}`).then(res => res.json()).then(res => res.items[0].contentDetails.duration);
        console.log(duration);
        const parseDuration = (d) => {
            const match = d.match(/PT(\d+H)?(\d+M)?(\d+S)?/);
            const hours = (parseInt(match[1]) || 0);
            const minutes = (parseInt(match[2]) || 0);
            const seconds = (parseInt(match[3]) || 0);
            return hours * 3600 + minutes * 60 + seconds;
        };

        // parse duration to seconds
        const durationInSeconds = parseDuration(duration);

        // set video-length value
        document.querySelector('input[name="duration"]').value = durationInSeconds * 1000;
        document.querySelector('form[data-type="video"]').submit();
        //document.querySelector('form').submit();
    } catch (error) {
        alert('Invalid video link');
    }
}