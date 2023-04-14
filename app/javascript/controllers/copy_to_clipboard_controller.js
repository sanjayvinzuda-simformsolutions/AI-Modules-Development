import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="copy-to-clipboard"
export default class extends Controller {
  static targets = [ "source" ]
  connect() {
    console.log(this.element)
    console.log(this.sourceTarget)
  }

  copy() {
    const text = this.sourceTarget.innerText
    console.log(text)
    navigator.clipboard.writeText(text)
  }
}
