(function($){
    $.fn.customPaginate = function(options){
      var paginationContainer = this;
      var itemsToPaginate;
      var defaults = {
        itemsPerPage : 15
      };
      var settings = {};
      $.extend(settings,defaults,options);

      var itemsPerPage = settings.itemsPerPage
      itemsToPaginate = $(settings.itemsToPaginate);
      var numberOfPaginationLinks = Math.ceil(itemsToPaginate.length / itemsPerPage);
      // $("<ul></ul>").prependTo(paginationContainer);

      for(var index = 0; index < numberOfPaginationLinks ; index++){
        paginationContainer.append("<a href='#' class='page gradient'>"+ (index + 1) +'</a>')
      }
      itemsToPaginate.filter(":gt("+ (itemsPerPage -1) +")").hide();

      paginationContainer.find(".page.gradient").on('click',function(){
        var linkNumber = $(this).text();
        var itemsToHide = itemsToPaginate.filter(":lt("+ ((linkNumber - 1) * itemsPerPage) +")");
        $.merge(itemsToHide, itemsToPaginate.filter(":gt("+ ((linkNumber * itemsPerPage) - 1) +")"));
        itemsToHide.hide();
        var itemsToShow = itemsToPaginate.not(itemsToHide);
        itemsToShow.show();
      });
    }
  }(jQuery));