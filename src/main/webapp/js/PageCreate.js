var PageCreate = new Class({

  Implements : [ Options ],

  initialize : function(options) {
    this.setOptions(options);

    document.id(options.id).addEvent('click', function(e) {

      new Event(e).stop();

      var required = $$('.required');
      if(required[0].value == '')
        $$('.required').setProperty('title', 'teste');
      
      
//      new Request.JSON({
//        method : 'POST',
//        enctype : 'multipart/form-data',
//        url : '/moonjava-flight-web/base/aeronave/create',
//        data : {
//          nome : 'qq'
//        },
//        onSuccess : function(response) {
//          alert('ok');
//        },
//      }).send();
      
    });
  }

});