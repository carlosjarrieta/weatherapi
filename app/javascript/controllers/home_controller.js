import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer";

export default class extends Controller {
  static targets = [ "city" ]
  connect() {
    this.cmdSearchValue = document.getElementById('cmdSearch');
    this.cmdSearchValue.disabled = true;
    // consumer.subscriptions.create({channel: 'CityChannel', room: this.element.dataset.homeUseridValue}, {
    //   received(data) {
    //     console.log(data)
    //   }
    // });
  }
  onKeyUp(){
    let characters = this.cityTarget.value.length;
    this.cmdSearchValue.disabled = characters <= 3 ? true: false
  }
}
