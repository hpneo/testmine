var onResize = function() {
  var heights = [$(window).outerHeight(), $('body').outerHeight()];
  
  $('#overlay').css({
    width: $(window).outerWidth(),
    height: Math.max.apply(null, heights)
  });
};

var Modal = function Modal(options) {
  if (typeof options.template === 'string') {
    this.template = options.template;
  }
  else {
    this.template = $('#' + options.modal + '-modal-content').html();
  }

  this.content = $('<div>', {
    class: 'modal',
    id: options.modal
  });

  this.overlay = $('#overlay');

  if (this.overlay.length == 0) {
    this.overlay = $('<div>', {
      id: 'overlay'
    });
  }

  this.overlay.hide();
  var self = this;

  this.overlay.on("click", function(e){
    
    var target = e.target;
    
    if (target.nodeName === 'A') {
      return true;
    }
    
    if ($(target).is('#overlay')) {
      self.close();
    }

    if ($(target).is('.close-modal')) {
      self.close();
    }

  })
};

Modal.prototype.overlayExists = function() {
  return $('body').find('#overlay').length > 0;
};

Modal.prototype.closeOverlay = function() {
  if (this.overlayExists()) {
    var self = this;

    this.overlay.fadeOut(300, function() {
      self.overlay.off('click');
      $(window).off('resize', onResize);
      $('body').removeClass('no-scroll');
      self.overlay.remove();
      self.content.remove();
    });
  }
};

Modal.prototype.showOverlay = function(callback) {
  var body = $('body');
  if (!this.overlayExists()) {
    body.addClass('no-scroll');

    var heights = [$(window).outerHeight(), $('body').outerHeight()];
    
    this.overlay.css({
      width: $(window).outerWidth(),
      height: Math.max.apply(null, heights)
    });

    body.append(this.overlay.hide());
  }

  $(window).on('resize', onResize);
  this.overlay.fadeIn(300, callback);
};

Modal.prototype.show = function() {
  if (this.content.length > 0) {
    var modal = this.content.hide();
    var template = this.template;

    this.overlay.html(modal);

    this.showOverlay(function() {
      modal.html(template);

      var modalHeight = window.innerHeight - 30,
          marginTop = (window.innerHeight - modal.height()) / 2,
          marginLeft = (window.innerWidth - modal.width()) / 2;

      modal.css({
        'margin-top': marginTop,
        'margin-left': marginLeft
      }).fadeIn(300);
    });
  }

  return this;
};

Modal.prototype.close = function() {
  if (this.content.length > 0) {
    var modal = this.content;
    var self = this;
    modal.fadeOut(300, (self.closeOverlay)(self));
  }

  return this;
};

Modal.show = function(modal) {
  return (new Modal({modal: modal})).show();
};