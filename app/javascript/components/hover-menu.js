// Check connection to console:
// console.log("hello world")

// Create function
const menu = () => {

  const icons = document.querySelectorAll('#menu-icon');
  if (icons) {
  icons.forEach((icon) => {
    icon.addEventListener('click', (event) => {
      // console.log(icon.dataset.cardId)
      const action = document.querySelector(`.toggle-id-${icon.dataset.cardId}`);
      action.classList.toggle("display-menu");
    });
  })};
};

export { menu };
