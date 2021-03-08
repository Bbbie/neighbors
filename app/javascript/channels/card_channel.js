import consumer from "./consumer";

const initCardCable = () => {
  const messagesContainers = document.querySelectorAll('.chat-body');
  if (messagesContainers) {
      messagesContainers.forEach((chat) => {
      const id = chat.dataset.cardId;
      const messagesContainer = document.getElementById(`messages-${id}`);
      if (messagesContainer) {

        consumer.subscriptions.create({ channel: "CardChannel", id: id }, {
          received(data) {
            messagesContainer.insertAdjacentHTML('beforeend', data);
          },
        });
      }

    })
  }

}

export { initCardCable };
