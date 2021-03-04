const neighbors = () => {

  const avatars = document.querySelector("#neighbors");
  const close = document.querySelector("#ic-close")
  const list = document.querySelector("#neighbors-index");

  if (avatars) {
  avatars.addEventListener("click", (event) => {
    list.classList.toggle("display-none");
  })};

  if (close) {
    close.addEventListener("click", (event) => {
      list.classList.toggle("display-none");
    })};
};

export { neighbors };
