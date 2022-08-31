import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="game-input"
export default class extends Controller {
  static targets = ["form", "gameContent"]

  send(event) {
    var input = document.getElementById("input_content")
    event.preventDefault()
    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        // render game content
        this.gameContentTarget.innerHTML = data.game_content
        // clear form input
        input.value = ''

      })


  }
}
