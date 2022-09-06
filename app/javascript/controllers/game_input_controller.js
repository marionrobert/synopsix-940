import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="game-input"
export default class extends Controller {
  static targets = ["form", "gameContent", "input", "timer", "board"]
  static values = { gametype: String, timerpath: String, numwords: Number }

  connect(){
    this.timeOutValue = 120000

    this.count = 0
    console.log(this.gametypeValue);
    if(this.gametypeValue == "timer"){
      this.initTimer()
      this.interval = setInterval(this.wordRevealInterval, 3000);
      this.timeOut = setTimeout(this.endGame, this.timeOutValue)
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
    event.preventDefault()
    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data);
        // render game content
        if(data.form_input){
         this.formTarget.outerHTML = data.form_input
        }
        this.gameContentTarget.innerHTML = data.game_content
        // clear form input
        if(this.hasInputTarget) this.inputTarget.focus()
        if(data.win){
          this.clear()
          console.log("hello");
          this.formTarget.classList.add('d-none')
          this.timerTarget.classList.add('d-none')


        }
      })
  }
  wordRevealInterval=() => {
    const token = document.querySelector('meta[name="csrf-token"]').content
    console.log(this.timerpathValue);
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
      this.formTarget.classList.add('d-none')
      this.timerTarget.classList.add('d-none')
      fetch(this.formTarget.action, {
        method: "POST",
        headers: { "Accept": "application/json" },
        body: new FormData(this.formTarget)
      })
        .then(response => response.json())
        .then((data) => {
          console.log(data);
          // render game end
          this.gameContentTarget.innerHTML =`
          <div>
          You lose
          The movie was ${data.title}
            <div>
            ${data.synopsis}
            </div>
            ${data.poster}
          </div>

          `


        })

    }
    //TODO : Change state of the game

  }

  initTimer= () => {
        // Credit: Mateusz Rybczonec

    const FULL_DASH_ARRAY = 283;
    const WARNING_THRESHOLD = 30;
    const ALERT_THRESHOLD = 10;

    const COLOR_CODES = {
      info: {
        color: "green"
      },
      warning: {
        color: "orange",
        threshold: WARNING_THRESHOLD
      },
      alert: {
        color: "red",
        threshold: ALERT_THRESHOLD
      }
    };

    const TIME_LIMIT = this.timeOutValue/1000;
    let timePassed = 0;
    let timeLeft = TIME_LIMIT;
    let timerInterval = null;
    let remainingPathColor = COLOR_CODES.info.color;

    this.timerTarget.innerHTML = `
    <div class="base-timer">
      <svg class="base-timer__svg" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
        <g class="base-timer__circle">
          <circle class="base-timer__path-elapsed" cx="50" cy="50" r="45"></circle>
          <path
            id="base-timer-path-remaining"
            stroke-dasharray="283"
            class="base-timer__path-remaining ${remainingPathColor}"
            d="
              M 50, 50
              m -45, 0
              a 45,45 0 1,0 90,0
              a 45,45 0 1,0 -90,0
            "
          ></path>
        </g>
      </svg>
      <span id="base-timer-label" class="base-timer__label">${formatTime(
        timeLeft
      )}</span>
    </div>
    `;

    startTimer();

    function onTimesUp() {
      clearInterval(timerInterval);
    }

    function startTimer() {
      timerInterval = setInterval(() => {
        if(!document.getElementById("base-timer-label")){
          clearInterval(timerInterval)
        }
        else{
          timePassed = timePassed += 1;
          timeLeft = TIME_LIMIT - timePassed;
          document.getElementById("base-timer-label").innerHTML = formatTime(
            timeLeft
          );
          setCircleDasharray();
          setRemainingPathColor(timeLeft);

          if (timeLeft === 0) {
            onTimesUp();
          }
        }
      }, 1000);
    }

    function formatTime(time) {
      const minutes = Math.floor(time / 60);
      let seconds = time % 60;

      if (seconds < 10) {
        seconds = `0${seconds}`;
      }

      return `${minutes}:${seconds}`;
    }

    function setRemainingPathColor(timeLeft) {
      const { alert, warning, info } = COLOR_CODES;
      if (timeLeft <= alert.threshold) {
        document
          .getElementById("base-timer-path-remaining")
          .classList.remove(warning.color);
        document
          .getElementById("base-timer-path-remaining")
          .classList.add(alert.color);
      } else if (timeLeft <= warning.threshold) {
        document
          .getElementById("base-timer-path-remaining")
          .classList.remove(info.color);
        document
          .getElementById("base-timer-path-remaining")
          .classList.add(warning.color);
      }
    }

    function calculateTimeFraction() {
      const rawTimeFraction = timeLeft / TIME_LIMIT;
      return rawTimeFraction - (1 / TIME_LIMIT) * (1 - rawTimeFraction);
    }

    function setCircleDasharray() {
      const circleDasharray = `${(
        calculateTimeFraction() * FULL_DASH_ARRAY
      ).toFixed(0)} 283`;
      document
        .getElementById("base-timer-path-remaining")
        .setAttribute("stroke-dasharray", circleDasharray);
    }

  }
}
