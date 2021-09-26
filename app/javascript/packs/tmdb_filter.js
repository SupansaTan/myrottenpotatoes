let reverseDate = true;

window.sort_date = function() {
    /* get container of all movies */
    let movie_div = document.getElementsByClassName("row-cols-4")[0]

    /* get all movie elements */
    let movies_wrapper = movie_div.getElementsByClassName("movie-container")
    let movies_wrap_list = []
    
    for(let i = 0; i < movies_wrapper.length; i++) {
        let movie_wrap = movies_wrapper[i]
        let release_date = movie_wrap.getElementsByClassName("date-wrapper")[0].
            getElementsByClassName("release-date")[0].innerHTML;
        
        let movie = {
            'release_date': release_date? new Date(release_date) : new Date('3000-01-01'),
            'html_elements': movie_wrap
        }
        movies_wrap_list.push(movie)
    }

    /* sort ascending */
    movies_wrap_list.sort(function(a, b) {
        let firstDate = a.release_date
        let secondDate = b.release_date

        return new Date(firstDate) - new Date(secondDate)
    })

    reverseDate ? movies_wrap_list.reverse() : null  // sort descending

    /* change arrow on button */
    if(reverseDate){
        reverseDate = false
        $('#arrow').removeClass('fas fa-chevron-down')
        $('#arrow').addClass('fas fa-chevron-up')
    }
    else {
        reverseDate = true
        $('#arrow').removeClass('fas fa-chevron-up')
        $('#arrow').addClass('fas fa-chevron-down')
    }

    /* clear old movie container and replace with all movies were sorted */
    movie_div.innerHTML = ""
    movies_wrap_list.forEach((movie) => {
        document.getElementsByClassName("row-cols-4")[0].innerHTML += movie.html_elements.outerHTML
    })
}