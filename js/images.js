$(function(){

  function checkDisable() {
    $('button.upload').each(function() {
      $btnUpload = $(this);
      $data = JSON.parse($btnUpload.siblings('input').val());

      if ($btnUpload.parent('form').siblings('ul').children('li').length >= $data.count) {
        $btnUpload.hide();
      } else {
        $btnUpload.show();
      }
    });
  }

  checkDisable();

  $('div.in ul li button').click(function() {
    $button = $(this);
    $.post(
      "/handler/image",
      {
        type: 'Image',
        mode: 'Delete',
        params: {
          id: $button.attr('data')
        }
      },
      function(data) {
        if (data.result) {
          $button.parent().empty().remove();
          checkDisable();
        } else {
          alert(data.message);
        }
      },
      "json"
    );
    return false;
  });
});