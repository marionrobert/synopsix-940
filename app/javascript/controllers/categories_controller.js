import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="categories"
export default class extends Controller {
  static targets = ["card", "gradient"]
  connect() {
    console.log(this.cardTargets)
  }
  select(event) {
    const card = event.currentTarget

    const index = card.dataset.number

    const btn = document.getElementById(`player_game_category_${index}`);
    btn.click()

    this.cardTargets.forEach(card => {
    card.classList.remove("card-active")
    });

    card.classList.add("card-active");


  }

  darken(event) {
    const gradient = event.currentTarget

    this.gradientTargets.forEach(gradient => {
      gradient.classList.add("linear-gradient")
    });

    event.currentTarget.classList.remove("linear-gradient");
  }
}
