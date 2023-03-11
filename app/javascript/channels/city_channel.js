import consumer from "./consumer"

consumer.subscriptions.create("CityChannel", {
  connected() {
  },

  disconnected() {
  },

  received(data) {
    console.log(data)
  }
});
