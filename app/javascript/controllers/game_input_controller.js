import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="game-input"
export default class extends Controller {
  static targets = ["form", "gameContent", "input"]

  send(event) {
    event.preventDefault()
    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        // render game content
        this.formTarget.outerHTML = data.form_input
        this.gameContentTarget.innerHTML = data.game_content
        this.inputTarget.focus()
      })
  }
}
