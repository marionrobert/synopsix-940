import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="categories"
export default class extends Controller {
  static targets = ["card"]
  connect() {
    console.log(this.cardTargets)
  }
  select(event) {
    const card = event.currentTarget
    const index = card.dataset.number
    console.log(index)
    const btn = document.getElementById(`player_game_category_${index}`);
    btn.click()
    this.cardTargets.forEach(card => {
    card.classList.remove("card-active")
    });
    card.classList.add("card-active");
  }
}

