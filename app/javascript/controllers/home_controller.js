import {Controller} from "@hotwired/stimulus"
import consumer from "../channels/consumer";
import { Toast } from "bootstrap"

function showToast() {
  console.log("llamando al toas")
  const toastElement = document.getElementById("liveToast")
  const toast = new Toast(toastElement)
  toast.show();
}

export default class extends Controller {
  static targets = ["city"]

  connect() {
    var user_id = this.element.dataset.homeUseridValue

    this.cmdSearchValue = document.getElementById('cmdSearch');
    this.cmdSearchValue.disabled = true;
    consumer.subscriptions.create({channel: 'CityChannel'}, {
      received(data) {
        console.log(data)
        if (data.city_nil == false) {
          if (data.user_id != user_id) {
            var table = document.getElementById("tbody-cities-users");
            var row = table.insertRow(0);
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            cell1.innerHTML = data.date
            cell2.innerHTML = data.message
          }
        }else{
          showToast();
        }
      },

    });
  }

  onKeyUp() {
    let characters = this.cityTarget.value.length;
    this.cmdSearchValue.disabled = characters <= 3 ? true : false
  }


}
