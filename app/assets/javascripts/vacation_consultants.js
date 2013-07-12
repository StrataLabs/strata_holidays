$('.select-vcs').on('click', function () {
    var vc_ids = [];
    $('.search_vc_table tr').filter(':has(:checkbox:checked)').each(function() {
      vc_ids.push($(this).attr("id"));
    });
    $.post('/assign-vcs', {vc_ids: vc_ids, cust_req_id: $('.search_vc_table').attr("id")},
    function(data, status, xhr){
      location.href = '/unwinders/user';
        // $(".assigned-vcs").html(data);
    });
    return false;
  });

// select-all-vcs