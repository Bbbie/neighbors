const neighbors = () => {

  const avatars = document.querySelector("#neighbors");
  const close = document.querySelector("#ic-close")
  const list = document.querySelector("#neighbors-index");

  const toggleClass = () => {
    list.classList.toggle("display-none");
  }

  const clickOutside = (event) => {
    const target = event.currentTarget;
    const visible = list && !list.classList.contains('display-none');

    if ( visible && target !== list ) {
      toggleClass();
    }
  }

 document.addEventListener("click", clickOutside(event));

  if (avatars) {
    avatars.addEventListener("click", toggleClass);
  }

  if (close) {
    close.addEventListener("click", toggleClass);
  }

};

export { neighbors };
