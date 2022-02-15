import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // this.element.textContent = "Hello World!"
  }

  move() {
    let p = document.createElement('P')
    p.appendChild(document.createTextNode('only you can see this'))
    document.querySelector('#board').appendChild(p)
  }

}
