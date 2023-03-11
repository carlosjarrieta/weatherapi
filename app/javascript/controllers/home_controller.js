import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="home"
export default class extends Controller {
  static targets = [ "city" ]
  connect() {
    this.cmdSearchValue = document.getElementById('cmdSearch');
    this.cmdSearchValue.disabled = true;
  }
  onKeyUp(event){
    let characters = this.cityTarget.value.length;
    this.cmdSearchValue.disabled = characters <= 3 ? true: false
  }
}
