var MovieRatingFilter = {
    filter_G: function() {
        return $(this).is(':checked') ? $('.col.G').show() : $('.col.G').hide()
    },

    filter_PG: function() {
        return $(this).is(':checked') ? $('.col.PG').show() : $('.col.PG').hide()
    },

    filter_PG_13: function() {
        return $(this).is(':checked') ? $('.col.PG-13').show() : $('.col.PG-13').hide()
    },

    filter_R: function() {
        return $(this).is(':checked') ? $('.col.R').show() : $('.col.R').hide()
    },

    filter_NC_17: function() {
        return $(this).is(':checked') ? $('.col.NC-17').show() : $('.col.NC-17').hide()
    },

    setup: function() {
        let checkbox_container = $(
            `<div class="form-check me-2 mb-0">` +
                `<input type="checkbox" class="form-check-input" id="filter_G" checked/>` +
                `<label class="form-check-label" for="filter_G">G</label>` +
            `</div>` +

            `<div class="form-check me-2 mb-0">` +
                `<input type="checkbox" class="form-check-input" id="filter_PG" checked/>` +
                `<label class="form-check-label" for="filter_PG">PG</label>` +
            `</div>` +
            
            `<div class="form-check me-2 mb-0">` +
                `<input type="checkbox" class="form-check-input" id="filter_PG_13" checked/>` +
                `<label class="form-check-label" for="filter_PG_13">PG-13</label>` +
            `</div>` +

            `<div class="form-check me-2 mb-0">` +
                `<input type="checkbox" class="form-check-input" id="filter_R" checked/>` +
                `<label class="form-check-label" for="filter_R">R</label>` +
            `</div>` +
            
            `<div class="form-check me-2 mb-0">` +
                `<input type="checkbox" class="form-check-input" id="filter_NC_17" checked/>` +
                `<label class="form-check-label" for="filter_NC_17">NC-17</label>` +
            `</div>`
        )

        checkbox_container.insertAfter('#rating-filter')
        $('#filter_G').change(MovieRatingFilter.filter_G)
        $('#filter_PG').change(MovieRatingFilter.filter_PG)
        $('#filter_PG_13').change(MovieRatingFilter.filter_PG_13)
        $('#filter_R').change(MovieRatingFilter.filter_R)
        $('#filter_NC_17').change(MovieRatingFilter.filter_NC_17)
    }
}

$(MovieRatingFilter.setup)  // run setup