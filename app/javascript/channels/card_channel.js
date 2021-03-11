import consumer from "./consumer";

const initCardCable = () => {
  const messagesContainers = document.querySelectorAll('.chat-body');
  if (messagesContainers) {
      messagesContainers.forEach((chat) => {
      const id = chat.dataset.cardId;
      const messagesContainer = document.getElementById(`messages-${id}`);
      // const formField = document.getElementById(`form-${id}`);
      if (messagesContainer) {

        consumer.subscriptions.create({ channel: "CardChannel", id: id }, {
          received(data) {
            messagesContainer.insertAdjacentHTML('beforeend', data);
            clearForm();
            // formField.reset();
          },
        });
      }
    })
  }

}

const clearForm = () => {
  const forms = document.querySelectorAll('.new_comment');
  forms.forEach((form) => {
        form.reset();
      })
}

export { initCardCable };
export { clearForm };
