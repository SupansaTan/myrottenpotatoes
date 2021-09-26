import { Modal } from 'bootstrap';
var MoviePopup = {
    setup: function() {
      // add hidden 'div' to end of page to display popup:
      // var popupDiv = $('<div id="movieInfo" class="modal fade" tabindex="-1"></div>');
      // popupDiv.hide().appendTo($('body'));
      $(document).on('click', '.movie-title', MoviePopup.getMovieInfo);
    }

    ,getMovieInfo: async function()  {
      const data = await $.ajax({type: 'GET',
                      url: $(this).attr('url'),
                      timeout: 5000,
                      // success: (MoviePopup.showMovieInfo),
                      // error: function(xhrObj, textStatus, exception) { alert('Error!'); }
                      // 'success' and 'error' functions will be passed 3 args
                    })
      $("#movie-info-container").html(data);
      let c = document.getElementById('movie-info-container')
      let infoModal = new Modal(document.getElementById('movie-info-container'), {
        keyboard: true,
      });
      console.log(c);
      infoModal.show()

        //infoModal.show()
        
      
    }

    ,showMovieInfo: function(data, requestStatus, xhrObject) {
      // var movieInfo_modal = new bootstrap.Modal(document.getElementById('movie-info'))
      // movieInfo_modal.show()
      $('#movie-info').modal('show');
      // $('#movieInfo').
      //   css({'left': oneFourth,  'width': 2*oneFourth, 'top': 250}).
      //   html(data).
      //   show();
      // make the Close link in the hidden element work
      // $('#closeLink').click(MoviePopup.hideMovieInfo);
      return(false);  // prevent default link action
    }

    ,hideMovieInfo: function() {
      $('#movie-info').modal('hide');
      return(false);
    }
};

$(MoviePopup.setup);