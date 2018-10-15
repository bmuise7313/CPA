const uri = 'api/song';
const uri2 = 'api/review';
let songs = null;
function getCount(data) {
    const el = $('#counter');
    let name = 'song';
    if (data) {
        if (data > 1) {
            name = 'songs';
        }
        el.text(data + ' ' + name);
    } else {
        el.html('No ' + name);
    }
}

$(document).ready(function () {
    getData();
    closeInput();
});

function getData() {
    $.ajax({
        type: 'GET',
        url: uri,
        success: function (data) {
            $('#songs').empty();
            getCount(data.length);
            $.each(data, function (key, item) {


                $('<tr><td>' + item.artist + '</td > ' +
                    '<td>' + item.name + '</td>' +
                    '<td><button onclick="editItem(' + item.id + ')">Edit</button></td>' +
                    '<td><button onclick="deleteItem(' + item.id + ')">Delete</button></td>' +
                    '<td><button onclick="addReview(' + item.id + ')">Add Review</button></td>' +
                    '</tr>').appendTo($('#songs'));
            });

            songs = data;
        }
    });
}
function getSingle() {
    const item = {
        'name': $('#find-name').val(),
    };
    $.ajax({
        type: 'GET',
        url: uri,
        data: JSON.stringify(item),
        success: function (data) {
            $('#songs').empty();
            getCount(data.length);


                $('<tr><td>' + item.artist + '</td > ' +
                    '<td>' + item.name + '</td>' +
                    '<td><button onclick="editItem(' + item.id + ')">Edit</button></td>' +
                    '<td><button onclick="deleteItem(' + item.id + ')">Delete</button></td>' +
                    '<td><button onclick="addReview(' + item.id + ')">Add Review</button></td>' +
                    '</tr>').appendTo($('#songs'));

            songs = data;
        }
    });
}
function addReview(id) {
    $.each(songs, function (key, item) {
        if (item.id === id) {
            $('#add-songId').val(item.id);
            $('#add-SongName').val(item.name);
        }
    });
    $('#spoiler2').css({ 'display': 'block' });
}

$('.my-form2').on('submit', function () {
    const item = {
        'reviewName': $('#add-reviewName').val(),
        'songName': $('#add-SongName').val(),
        'songId': $('#add-songId').val(),
        'review': $('#add-review').val(),
    };

    $.ajax({
        type: 'POST',
        accepts: 'application/json',
        url: uri2,
        contentType: 'application/json',
        data: JSON.stringify(item),
        error: function (jqXHR, textStatus, errorThrown) {
            alert('here');
        },
        success: function (result) {
        }
    });

    closeInput();
    return false;
});

function addItem() {
    const item = {
        'name': $('#add-name').val(),
        'artist': $('#add-artist').val(),
    };

    $.ajax({
        type: 'POST',
        accepts: 'application/json',
        url: uri,
        contentType: 'application/json',
        data: JSON.stringify(item),
        error: function (jqXHR, textStatus, errorThrown) {
            alert('here');
        },
        success: function (result) {
            getData();
            $('#add-name').val('');
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
    $.each(songs, function (key, item) {
        if (item.id === id) {
            $('#edit-name').val(item.name);
            $('#edit-id').val(item.id);
            $('#edit-artist').val(item.artist);
        }
    });
    $('#spoiler').css({ 'display': 'block' });
}

$('.my-form').on('submit', function () {
    const item = {
        'name': $('#edit-name').val(),
        'artist': $('#edit-artist').val(),
        'id': $('#edit-id').val()
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
    $('#spoiler2').css({ 'display': 'none' });
}
