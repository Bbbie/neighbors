const neighbors = () => {

  const avatars = document.querySelector("#neighbors");
  const close = document.querySelector("#ic-close")
  const list = document.querySelector("#neighbors-index");

  const toggleClass = () => {
    // prevent event on document from clickOutside for avatars & close
    event.stopPropagation();
    list.classList.toggle("display-none");
  }

  const clickOutside = (event) => {
    const target = event.currentTarget;
    const visible = list && !list.classList.contains('display-none');

    if ( visible && target !== list ) {
      toggleClass(event);
    }
  }

 document.addEventListener("click", clickOutside);

  if (avatars) {
    avatars.addEventListener("click", toggleClass);
  }

  if (close) {
    close.addEventListener("click", toggleClass);
  }

};

export { neighbors };


// When you click on the avatars, the clickOutside function is also called, because avatars div is a part of the document (document click event gets triggered). To prevent this, use stopPropagation method in your toggleClass.
