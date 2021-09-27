import { Modal } from 'bootstrap';

var MoviePopup = {
  setup: function() {
    $(document).on('click', '.movie-title', MoviePopup.getMovieInfo);
  }

  ,getMovieInfo: async function()  {
    const data = await $.ajax({
      type: 'GET',
      url: $(this).attr('url'),
      timeout: 5000,
      // success: (MoviePopup.showMovieInfo),
      // error: function(xhrObj, textStatus, exception) { alert('Error!'); }
      // 'success' and 'error' functions will be passed 3 args
    })
    MoviePopup.showMovieInfo(data)
  }

  ,showMovieInfo: function(data) {
    $("#movie-info-container").html(data);
    let infoModal = new Modal(document.getElementById('movie-info-container'), {
      keyboard: true,
    });
    infoModal.show()
  }
};

$(MoviePopup.setup);