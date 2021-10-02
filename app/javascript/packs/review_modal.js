import { Modal } from 'bootstrap';

var ReviewPopup = {
  setup: function() {
    $(document).on('click', '.btn.add-review', ReviewPopup.getInfo);
  }

  ,getInfo: async function()  {
    const data = await $.ajax({
      type: 'GET',
      url: $(this).attr('url'),
      timeout: 5000,
      //success: (ReviewPopup.showModal(data)),
      //error: function(xhrObj, textStatus, exception) { alert('Error!'); }
    })
    ReviewPopup.showModal(data)
  }

  ,showModal: function(data) {
    $("#review-modal-container").html(data);
    let reviewModal = new Modal(document.getElementById('review-modal-container'), {
      keyboard: true,
    });
    reviewModal.show()
  }
};

$(ReviewPopup.setup);
$(document).on('click', 'input[name="review[potatoes]"]', highlightPotatoes);

function highlightPotatoes() {
  let vote = $('input[name="review[potatoes]"]:checked').val()
  
  for(let i=1; i<6; i++) {
    if(i <= vote) {
      $('input[type="radio"][id="' + i + '"]').addClass('highlight')
      $('label#' + i).find('img').addClass('highlight')
      $('label#' + i).find('img').removeClass('not-selected')
    }
    else {
      $('input[type="radio"][id="' + i + '"]').removeClass('highlight')
      $('label#' + i).find('img').removeClass('highlight')
      $('label#' + i).find('img').addClass('not-selected')
    }
  }
}