var FormValidate = new Class({

  Implements : [ Options ],

  initialize : function(options) {
    this.setOptions(options);
    
    var el2 = $$('.required');
    Array.each(el2, function(key) {
      key.addEvent('blur', function(e) {

        if (e.target.value == '') {
          if (document.id(e.target.id + 'sub') == null) {
            var el = new Element('div', {
              'id' : e.target.id + 'sub',
              'class' : 'alert alert-error fade in',
              'text' : e.target.placeholder + ' ' + options.required
            });
            el.inject('notification');

            el = new Element('button', {
              'type' : 'button',
              'class' : 'close',
              'text' : '×',
              'data-dismiss' : 'alert'
            });
            el.inject(e.target.id + 'sub');
          }
        }
      });
    });
    
    var el2 = $$('.cpf');
    Array.each(el2, function(key) {
      key.addEvent('blur', function(e) {

        if (e.target.value == '___.___.___-__') {
          if (document.id(e.target.id + 'sub') == null) {
            var el = new Element('div', {
              'id' : e.target.id + 'sub',
              'class' : 'alert alert-error fade in',
              'text' : e.target.placeholder + ' ' + options.required
            });
            el.inject('notification');

            el = new Element('button', {
              'type' : 'button',
              'class' : 'close',
              'text' : '×',
              'data-dismiss' : 'alert'
            });
            el.inject(e.target.id + 'sub');
          }
        }
      });
    });
  }

});

jQuery(function($) {
  $(".number").keyup(function() {
    this.value = this.value.replace(/[^0-9\.]/g,'');
  });
});