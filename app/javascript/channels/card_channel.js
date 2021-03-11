import consumer from "./consumer";

const initCardCable = () => {
  const messagesContainers = document.querySelectorAll('.chat-body');
  if (messagesContainers) {
      messagesContainers.forEach((chat) => {
      const id = chat.dataset.cardId;
      const messagesContainer = document.getElementById(`messages-${id}`);
      const formField = document.querySelector(`.input-${id}`);
      if (messagesContainer) {

        consumer.subscriptions.create({ channel: "CardChannel", id: id }, {
          received(data) {
            messagesContainer.insertAdjacentHTML('beforeend', data);
            // clearForm();
            formField.querySelector('#comment_content').value = '';
            gotoBottom(id);
          },
        });
      }
    })
  }

}

const gotoBottom = (id) => {
   const element = document.getElementById(`messages-${id}`);
   element.scrollTop = element.scrollHeight - element.clientHeight;
}

// var objDiv = document.getElementById("your_div");
// objDiv.scrollTop = objDiv.scrollHeight;

// const clearForm = () => {
//   const forms = document.querySelectorAll('.new_comment');
//   forms.forEach((form) => {
//         form.reset();
//       })
// }

export { initCardCable };
// export { clearForm };
