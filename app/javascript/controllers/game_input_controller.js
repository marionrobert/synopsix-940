import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="game-input"
export default class extends Controller {
  static targets = ["form", "gameContent"]
  static values = { gametype: String, timerpath: String, numwords: Number }
  connect(){
    this.count = 0
    console.log(this.gametypeValue);
    if(this.gametypeValue == "timer"){

      this.interval = setInterval(this.wordRevealInterval, 3000);
      this.timeOut = setTimeout(this.endGame, 120000)
   }
  }

  disconnect(){
    this.clear()
  }

  clear(){
    if(this.interval){
      clearInterval(this.interval)
    }
    if(this.timeOut){
      clearTimeout(this.timeOut)
    }
  }
  // numwordsValue =
  // clearInterval(intervalId)


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
        if(data.win){
          this.clear()
        }
      })
  }
  wordRevealInterval=() => {
    const token = document.querySelector('meta[name="csrf-token"]').content
    fetch(this.timerpathValue, {
      method: "POST",
      headers: {
        "Accept": "application/json",
        "X-CSRF-Token": token
    }
    })
    .then(response => response.json())
    .then((data) => {
      // render game content
      this.gameContentTarget.innerHTML = data.game_content
      this.count++
      if(this.numwordsValue == this.count){
        clearInterval(this.interval)
      }
    })
  }

  endGame=() => {
    if(this.interval){
      clearInterval(this.interval)
    }
    //TODO : Change state of the game

  }
}
