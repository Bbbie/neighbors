// Check connection to console:
// console.log("hello world")

// Create function
const menu = () => {

  const icons = document.querySelectorAll('#menu-icon');
  icons.forEach((icon) => {
    icon.addEventListener('click', (event) => {
      // console.log(icon.dataset.cardId)
      const action = document.querySelector(`.toggle-id-${icon.dataset.cardId}`);
      action.classList.toggle("display-menu");
    });
  });

};



// set id for [...] on all cards (array)
// iterate over them & add eventlistener
// toggle class for SPECIFIC element I clicked saying display:block;
// bug: might show up for all cards

// export function, import & call in application.js
export { menu };
