var Page = new Class({

  Implements : [ Options ],
  
  initialize : function(options) {
    this.setOptions(options);
    this.service();

    document.id('refresh').addEvent('click', function(refresh) {
      document.id(options.id).load(options.serviceUrl);
      $$('input').set('value', '');
    });

    document.id('delete').addEvent('click', function() {
      var res = options.deleteUrl;
      var error = true;
      $$('.del').each(function(el) {
        if (el.checked) {
          error = false;
          new Request.JSON({
            method : 'POST',
            url: res,
            onSuccess: function(response) {
              alert(response);
            },
            data: {
              json: el.value
            }
          }).send();
        } else {
          if(document.id('sub') == null && error) {
            var el = new Element('div', {
              'id' : 'sub',
              'class' : 'alert alert-error fade in',
              'text' : options.deleteErrorMsg
            });
            el.inject('error');
            
            el = new Element('button', {
              'type' : 'button',
              'class' : 'close',
              'text' : '×',
              'data-dismiss' : 'alert'
            });
            el.inject('sub');
          }
//          document.id('error').setProperty('class', 'alert fade in');
        }
      });
//      window.location = options.page;
    });
  },

  service : function() {
    document.id(this.options.id).load(this.options.serviceUrl);
  },

  finder : function(val) {
    this.val = val;
    new Request.HTML({
      method : 'get',
      url : this.options.serviceUrl,
      data : this.val,
      update : document.id(this.options.id)
    }).send();
  },

});

jQuery(function($) {
  $(".date").mask("99/99/9999 99:99", {
    placeholder : "_"
  });
});