// const forms = document.querySelectorAll(".simple_form");
// forms.forEach(function(form) {
//   form.addEventListener("submit", (event) => {
//     const inputField = event.currentTarget.getElementById("comment_content");
//     console.log(inputField.value);
//   })
// })
const initChat = () => {
  const messagesContainer = document.querySelector(".chat-body");
  const form = document.querySelector(".simple_form");
  form.addEventListener("submit", (event) => {
    const inputField = document.getElementById("comment_content");
    const html = `<div class="messages-container" id="message-<%= comment.id %>">
        <i class="author">
          <span>ENTER FIRST_NAME</span>
          <small>ENTER TIME</small>
        </i>
        <p>${inputField.value}</p>
      </div>`
    messagesContainer.insertAdjacentHTML("beforeend", html);
  })
};

export { initChat };
