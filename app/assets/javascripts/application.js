// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require cocoon
//= require rails-ujs
//= require_tree .



function setTabsSelectedDivs() {
  var tabs = document.querySelectorAll('.mikro-tabs');
  Array.from(tabs).forEach(function(tab) {
    tab.addEventListener('click', function(e) {
      e.preventDefault();

      // Remove active from other tabs
      Array.from(tabs).forEach(function(each_tab) { each_tab.classList.remove('active'); });
      tab.classList.add('active');

      // Hide other divs
      other_divs = document.querySelectorAll('.tabs-divs');
      Array.from(other_divs).forEach(function(o_div) { o_div.classList.add('d-none'); });
      // Open target div
      debugger;
      open_div_class = tab.dataset.target;
      open_div = document.getElementsByClassName(open_div_class)[0];
      open_div.classList.remove('d-none');
      open_div.classList.add('d-block');
    });
  });
}

window.addEventListener('load', setTabsSelectedDivs);
