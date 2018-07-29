//= require arctic_admin/base
//= require activestorage


$(document).ready(function(){
    var $opts = $('select[select_all="true"] option')

    for (var i = 0; i < $opts.length; i++){
        $opts[i].selected = true;
    }
})
