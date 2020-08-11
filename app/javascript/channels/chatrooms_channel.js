import consumer from "./consumer"
import { scrollDown } from "../packs/components/scroll-down";


$(document).on("turbolinks:load", ()=>{
  const chatroom_id = Number($("#chatroom-id").attr("data-chatroom-id"));
  
  consumer.subscriptions.subscriptions.forEach(subscription=> {
    consumer.subscriptions.remove(subscription)
  })
  
  consumer.subscriptions.create({channel: "ChatroomsChannel", chatroom_id: chatroom_id}, {
    connected() {
      console.log("connected to " + chatroom_id);
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      // Called when there's incoming data on the websocket for this channel
      const user_id = Number($("#user-id").attr("data-user-id"));

      let html;

      if(user_id == data.message.user_id){
        html = data.mine
      } else {
        html = data.theirs
      }
      $("#messages").append(html);
      $("#message_content").val("");
      scrollDown()
    }
  });
})
