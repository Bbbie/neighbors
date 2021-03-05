const messages_container = document.querySelector("#messages");
const forms = document.querySelectorAll(".simple_form");
forms.forEach(function(form) {
  form.addEventListener("submit", (event) => {
    const inputField = event.currentTarget.getElementById("comment_content");
    console.log(inputField.value);
  })
})
