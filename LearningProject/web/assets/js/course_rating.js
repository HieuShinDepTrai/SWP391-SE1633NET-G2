function rating() {
    let star = document.querySelectorAll('.star-rating-element'); 
    star.forEach(function(current) {
        current.addEventListener('click', function() {
            console.log(this);
        })
    })
}

