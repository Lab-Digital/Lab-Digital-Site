$(function(){
   $('#submit').click(function() {
      $form = $('#proposal');
      $.post(
         "/handler/proposal",
         {
            mode: 'Insert',
            params: {
                  name: $form.find('#top_form_name').val(),
                  email: $form.find('#top_form_mail').val(),
                  phone: $form.find('#top_form_phone').val(),
                  task: $form.find('#top_form_quest').val()
            }
         },
         function(data) {
            if (data.result) {
               $form.find('.form-control').each(function() {
                  $(this).val('');
               });
               $.fancybox(
                  '<span style="color: green; font-weight: bold;">Заявка отправлена! Спасибо!</span>',
                  {
                     'autoDimensions'  : false,
                     'width'           : 350,
                     'height'          : 'auto',
                     'transitionIn'    : 'none',
                     'transitionOut'   : 'none'
                  }
               );
            } else {
              $.fancybox(
                  '<span style="color: red; font-weight: bold;">' + data.message + '</span>',
                  {
                     'autoDimensions'  : false,
                     'width'           : 350,
                     'height'          : 'auto',
                     'transitionIn'    : 'none',
                     'transitionOut'   : 'none'
                  }
               );
            }
         },
         "json"
      );
      return false;
   });
});