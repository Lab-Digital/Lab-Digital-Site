$(function(){
   function incPage(value) {
      $('#to_left').attr('data-page',  parseInt($('#to_left').attr('data-page')) + value);
      $('#to_right').attr('data-page', parseInt($('#to_right').attr('data-page')) + value);
   }

   function appendArticles($ul, articles) {
      for (var i = 0; i < articles.length; i++) {
         $ul.append(
            "<li><article><a href='/news/" + articles[i].news_url + "'>" +
            (articles[i].news_photo_id ? "<img src='/scripts/uploads/" + articles[i].news_photo_id + "_s.jpg' />" : "") +
            "<h1>" + articles[i].news_head + "</h1>" +
            "<p>" + articles[i].news_description + "</p>" +
            "</a></article></li>"
         );
      };
   }

   function getNews(p) {
      var result = false;
      $.post(
         "/handler/news",
         {
            page: p - 1
         },
         function(data) {
            result = data.result;
            if (result) {
               console.log(data.news);
               $('#to_left').attr('data-pages-amount', data.pages_amount);
               $('#to_right').attr('data-pages-amount', data.pages_amount);
               var $news = $('#news section.middle');
               $news.find('ul').empty();
               appendArticles($news.find('#left_news'), data.news.left);
               appendArticles($news.find('#middle_news'), data.news.middle);
               appendArticles($news.find('#right_news'), data.news.right);
               var left_page = parseInt($('#to_left').attr('data-page'));
               var pages_amount = parseInt($('#to_left').attr('data-pages-amount'));
               enableButton('left');
               enableButton('right');
               if (pages_amount == 0 || ((left_page == pages_amount) && left_page == 1)) {
                  hideButton('left');
                  hideButton('right');
               }
               if (left_page == 1) {
                  disableButton('left');
               }
               if (parseInt($('#to_right').attr('data-page')) == pages_amount) {
                  disableButton('right');
               }
            }
         },
         "json"
      );
      return result;
   }

   $("body").on('click', '#to_left.enabled', function() {
      incPage(-1);
      getNews($(this).attr('data-page'));
   });

   $("body").on('click', '#to_right.enabled', function() {
      incPage(1);
      getNews($(this).attr('data-page'));
      //enableButton('left');
   });
   getNews(1);
});

function hideButton(button) {
   $('#to_' + button).hide();
}

function disableButton(button) {
   $('#to_' + button).removeClass('enabled').addClass('disabled');
}

function enableButton(button) {
   $('#to_' + button).removeClass('disabled').addClass('enabled');
}