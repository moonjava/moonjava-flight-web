var PagePassagem = new Class({

  Implements : [ Options ],

  initialize : function(options) {
    this.setOptions(options);

    document.id('transf').addEvent('click', function() {
      var res = options.passagemUrl;
      var elem = $$('.del');
      var hasItem = false;
      for ( var i = 0; i < elem.length; i++) {
        if (elem[i].checked)
          hasItem = true;
      }

      if (hasItem) {
          $$('.del').each(function(el) {

            if (el.checked) {

              new Request.JSON({
                method : 'POST',
                url : res,
                update : document.id(options.id),
                data : {
                  id : el.value,
                  codigo : document.id('bilhete').get('value')
                },
                onSuccess : function(response) {

                  if (response.success !== undefined) {
                    window.location = options.page;
                  } else {
                    if (document.id('err') == null) {
                      var el = new Element('div', {
                        'id' : 'err',
                        'class' : 'alert alert-error fade in',
                        'text' : response.exception
                      });
                      el.inject('notification');
                      el = new Element('button', {
                        'type' : 'button',
                        'class' : 'close',
                        'text' : '×',
                        'data-dismiss' : 'alert'
                      });
                      el.inject('err');
                    }
                  }

                },
              }).send();

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