$(document).ready(function(){
console.log("hello");
  $('#comptitle').typeahead({
    highlight: true,
    hint : true
  },
  {
    name: 'titles',
    display: 'title',

    source: function(query,sync, process) {

     $.ajax({
        url: 'http://localhost:8087/autosearch/',
        type: 'post',
//         contentType : 'application/json; charset=utf-8',
        dataType: 'json',
   //     data: JSON.stringify(data),
         data : query
      }).done(function(response){
          var len = response.length;
         
          console.log(len);

        
        return process(response);
      });
    },
      templates: {
    suggestion: function (data) {
        return '<div>'+data.title+'<br><span>'+data.description+'</span></div>' ;
    },

  }
//    templates : {
    //  suggestion : Handlebars.compile('<div><p>{{title}}</p><p>{{description}}</p></div>')
//    }

});
});
