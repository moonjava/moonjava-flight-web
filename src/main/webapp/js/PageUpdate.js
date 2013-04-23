var PageUpdate = new Class({

  Implements : [ Options ],

  initialize : function(options) {
    this.setOptions(options);

    document.id('update').addEvent('click', function() {
      var res = options.page;
      var elem = $$('.del');
      var hasItem = false;
      for ( var i = 0; i < elem.length; i++) {
        if (elem[i].checked)
          hasItem = true;
      }

      if (hasItem) {
          $$('.del').each(function(el) {
            if (el.checked) {
              window.location = res + '?id=' + el.value;
            }
              
          });
      } else {
        if (document.id('sub') == null) {
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
  },

});