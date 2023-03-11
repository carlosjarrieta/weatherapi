import consumer from "./consumer"

consumer.subscriptions.create("CityChannel", {
  connected() {
    console.log('Cable conected!')
  },

  disconnected() {
  },

  received(data) {
    console.log(data)
  }
});
