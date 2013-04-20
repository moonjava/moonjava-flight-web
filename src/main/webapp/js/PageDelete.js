var PageDelete = new Class({

  Implements : [ Options ],
  
  initialize : function(options) {
    this.setOptions(options);

    document.id('delete').addEvent('click', function() {
      var res = options.deleteUrl;
      var error = true;
      $$('.del').each(function(el) {
        if (el.checked) {
          error = false;
          new Request.JSON({
            method : 'POST',
            url: res,
            update : document.id(options.id),
            data: { json: el.value  },
            onSuccess: function(response) {
              if(response.response == 'success')
              if(document.id('ok') == null) {
                var el = new Element('div', {
                  'id' : 'ok',
                  'class' : 'alert alert-info fade in',
                  'text' : options.deleteSuccessMsg
                });
                el.inject('notification');
                
                el = new Element('button', {
                  'type' : 'button',
                  'class' : 'close',
                  'text' : '×',
                  'data-dismiss' : 'alert'
                });
                el.inject('ok');
              }
            },
          }).send();
        } else {
          if(document.id('sub') == null && error) {
            var el = new Element('div', {
              'id' : 'sub',
              'class' : 'alert alert-error fade in',
              'text' : options.deleteErrorMsg
            });
            el.inject('notification');
            
            el = new Element('button', {
              'type' : 'button',
              'class' : 'close',
              'text' : '×',
              'data-dismiss' : 'alert'
            });
            el.inject('sub');
          }
        }
      });
    });
  },

});

jQuery(function($) {
  $(".date").mask("99/99/9999 99:99", {
    placeholder : "_"
  });
});