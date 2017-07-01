//
// instafeed.js
// Animate instafeed at bottom of welcome page
//

export let InstafeedSlider = class InstafeedSlider {
  // Animate through Instafeed slider
  static animate() {
    let scroll_position = $('#instafeed').scrollLeft();

    if ($('#instafeed:hover').length !== 0) {
      // Don't scroll if the user is hovering
      return;
    } else if (scroll_position >= 5120) {
      // Animate back to the start if past a certain point
      return $('#instafeed').animate({scrollLeft: '0px'}, 1000);
    } else {
      // Animate the instafeed 1280 pixels past the current scroll_position
      return $('#instafeed').animate({scrollLeft: scroll_position + 1280 + 'px'}, 750);
    }
  }
};

// Start Instafeed animation loop
$(document).ready(() => setInterval(InstafeedSlider.animate, 4000));
