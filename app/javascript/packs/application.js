// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

import { initMapbox } from '../plugins/init_mapbox';
import { menu } from '../components/hover-menu';
import { neighbors } from '../components/neighbors-index';
import { initFlatpickr } from "../plugins/flatpickr";
// import { initChat } from '../components/comments';
import { navbarScroll } from '../components/navbar';
import { initCardCable } from '../channels/card_channel';
import { initCarousel } from '../components/initCarousel';
// import { clearForm } from '../channels/card_channel';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  navbarScroll();
  initMapbox();
  initFlatpickr();
  menu();
  neighbors();
  // initChat();
  initCardCable();
  initCarousel();
  // clearForm();
});


// const cards = document.querySelectorAll(".card-content");
// cards.forEach(card => card.addEventListener("click", () => {
//   window.alert("Hello")
// }))








