function loadSelectTest(select_id)
{
    var select = $('#'+select_id);
    var dataSource =select.attr('data-source');

    alert(dataSource);
}

function loadSelects()
{
    $('select[data-source]').each(function() {
        var $select = $(this);

        $.ajax({
            url: $select.attr('data-source'),
        }).then(function(options) {
            options.map(function(option) {
                var $option = $('<option>');

                $option
                    .val(option[$select.attr('data-valueKey')])
                    .text(option[$select.attr('data-displayKey')]);

                $select.append($option);
            });
        });
    });
}

loadSelects();
