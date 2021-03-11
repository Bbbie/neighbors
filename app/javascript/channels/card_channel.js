import consumer from "./consumer";

const initCardCable = () => {
  const messagesContainers = document.querySelectorAll('.chat-body');
  if (messagesContainers) {
      messagesContainers.forEach((chat) => {
      const id = chat.dataset.cardId;
      const messagesContainer = document.getElementById(`messages-${id}`);
      const formField = document.querySelector(`.input-${id}`);
      const card = document.querySelector(`#button-card-${id}`);

      card.addEventListener('click', (event) => {
        gotoBottom(id);
      })

      if (messagesContainer) {

        consumer.subscriptions.create({ channel: "CardChannel", id: id }, {
          received(data) {
            messagesContainer.insertAdjacentHTML('beforeend', data);
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


export { initCardCable };
