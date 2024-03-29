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
            var tbody = document.getElementById("tbody-cities-users");
            var row = tbody.insertRow(0);
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
    let no_blank =new RegExp('^[^\\s]+$').test(this.cityTarget.value);
    let characters = this.cityTarget.value.length;
    if (characters <= 3 || !no_blank ){
      this.cmdSearchValue.disabled = true
    }else{
      this.cmdSearchValue.disabled = false;
    }
  }


}
