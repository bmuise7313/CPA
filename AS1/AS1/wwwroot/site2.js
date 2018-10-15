const uri = 'api/review';
let reviews = null;
function getCount(data) {
    const el = $('#counter');
    let name = 'review';
    if (data) {
        if (data > 1) {
            name = 'reviews';
        }
        el.text(data + ' ' + name);
    } else {
        el.html('No ' + name);
    }
}

$(document).ready(function () {
    getData();
});

function getData() {
    $.ajax({
        type: 'GET',
        url: uri,
        success: function (data) {
            $('#reviews').empty();
            getCount(data.length);
            $.each(data, function (key, item) {


                $('<tr><td>' + item.reviewName + '</td > ' +
                    '<td>' + item.songName + '</td>' +
                    '<td>' + item.review + '</td>' +
                    '<td><button onclick="editItem(' + item.id + ')">Edit</button></td>' +
                    '<td><button onclick="deleteItem(' + item.id + ')">Delete</button></td>' +
                    '</tr>').appendTo($('#reviews'));
            });

            reviews = data;
        }
    });
}

function deleteItem(id) {
    $.ajax({
        url: uri + '/' + id,
        type: 'DELETE',
        success: function (result) {
            getData();
        }
    });
}

function editItem(id) {
    $.each(reviews, function (key, item) {
        if (item.id === id) {
            $('#edit-reviewName').val(item.reviewName);
            $('#edit-id').val(item.id);
            $('#edit-SongName').val(item.songName);
            $('#edit-review').val(item.review);
        }
    });
    $('#spoiler').css({ 'display': 'block' });
}

$('.my-form').on('submit', function () { 
    const item = {
        'reviewName': $('#edit-reviewName').val(),
        'songName': $('#edit-SongName').val(),
        'review': $('#edit-review').val()
    };

    $.ajax({
        url: uri + '/' + $('#edit-id').val(),
        type: 'PUT',
        accepts: 'application/json',
        contentType: 'application/json',
        data: JSON.stringify(item),
        success: function (result) {
            getData();
        }
    });

    closeInput();
    return false;
});

function closeInput() {
    $('#spoiler').css({ 'display': 'none' });
}
