var filterificCounter = function(seconds) {
    var cnt = 0;
    console.log('init counter');
    return function() {
        cnt += 1;
        _this = this;
        console.log('change event');
        setTimeout(function(_cnt, node) {
            if(cnt != _cnt) return;
            filterificSendRequest(node);
            console.log('Sending ajax request');
        }, seconds * 1000, cnt, _this);
    };
};

function filterificSendRequest(node) {
    var form = node.form;
    var url  = form.getAttribute('action');
    var data = encodeURIComponent(node.name) + '=' + encodeURIComponent(node.value);
    Rails.ajax({
        type: 'GET',
        url: url,
        data: data,
        dataType: 'script'
    });
}

// function setFilterrificFormListeners(filter_forms) {
//     filter_forms.forEach(function (filter_form) {
//         filter_form.addEventListener('change', function () {
//             submitFilterForm
//         });
//     });
// }

function setFilterrificInputListeners(filter_inputs) {
    filter_inputs.forEach(function (filter_input) {
        var counter = filterificCounter(0.5);
        filter_input.addEventListener('keydown', counter);
    });
}

document.addEventListener("turbolinks:load", function() {
    // var filter_forms = document.getAll('#filterrific_filter');
    // if (filter_forms.length > 0) setFilterrificFormListeners(filter_forms);

    var filter_inputs = document.getAll('.filterrific-periodically-observed');
    if (filter_inputs.length >0) setFilterrificInputListeners(filter_inputs);
});
