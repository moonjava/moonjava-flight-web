var PageStatus = new Class({

  Implements : [ Options ],
  
  options : {
    updateUrl : ''
  },

  initialize : function(options) {
    this.setOptions(options);
    this.service();

    document.id('refresh').addEvent('click', function(refresh) {
      document.id(options.id).load(options.serviceUrl);
      $$('input').set('value', '');
    });

    document.id('update').addEvent('click', function() {
      var res = options.updateUrl;
      $$('.upd').each(function(el) {
        if (el.checked) {
          new Request.JSON({
            method : 'post',
            url : res + '/' + el.value,
            data : {
              status : document.id('status').get('value')
            },
            emulation : false
          }).send();
        }
      });
      window.location = options.page;
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