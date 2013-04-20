var PageSearch = new Class({
  
  Implements : [ Options ],
  
  initialize : function(options) {
    this.setOptions(options);
    this.service();
    
    document.id('refresh').addEvent('click', function(refresh) {
      document.id(options.id).load(options.serviceUrl);
      $$('input').set('value', '');
    });
    
    var el =  $$('input');
    Array.each(el, function(key) {
      key.addEvent('keyup', function() {
        var json = {};
        for(var i = 0; i < el.length; i++) {
          json[el[i].id] = el[i].value;
        }
        new Request.HTML({
          method : 'get',
          url : options.serviceUrl,
          data : json,
          update : document.id(options.id)
        }).send();
      });
    });
  },
  
  service : function() {
    document.id(this.options.id).load(this.options.serviceUrl);
  },
  
});