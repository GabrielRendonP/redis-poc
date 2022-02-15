import consumer from "channels/consumer"

consumer.subscriptions.create("MatchChannel", {
  connected() {
    const node = document.createElement("LI");
    const textnode = document.createTextNode("Player connected!");
    const t = document.querySelector('#home').appendChild(textnode)
    const btn = document.querySelector('#move-btn')
    btn.addEventListener('click', () => {
      this.perform('make_move')
      console.log('click me')
    })
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data.action)
    const node = document.createElement("LI");
    const textnode = document.createTextNode(data);
    document.querySelector('#home').appendChild(textnode)
    // Called when there's incoming data on the websocket for this channel
  }
});
