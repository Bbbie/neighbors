const navbarScroll = () => {
  const navbar = document.querySelector("#nav");
  const logo = document.querySelector(".nav-logo-long");
  const button = document.querySelector(".btn-login");

  window.addEventListener('scroll', (event) => {
    // console.log('they see me scrollin');
    if (window.scrollY >= 536) {
      navbar.classList.remove('nav-transparent');
      navbar.classList.add('nav-grey');
      logo.classList.add('nav-logo-grey');
      button.classList.add('btn-secondary');
      button.classList.remove('btn-secondary-white');

    } else {

      navbar.classList.add('nav-transparent');
      navbar.classList.remove('nav-grey');
      logo.classList.remove('nav-logo-grey');
      button.classList.add('btn-secondary-white');
      button.classList.remove('btn-secondary');
  }})
};

export { navbarScroll };
