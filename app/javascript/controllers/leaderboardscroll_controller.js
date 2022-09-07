import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'down', 'up' ]

  connect() {
    if (this.hasdownTarget && this.hasupTarget) {
      this.initScrollWithButtons()
    }
    this.threshold = 4
  }

  scroll(e) {
    this.element.scrollup += e.deltaY;
  }

  initScrollWithButtons() {
    var downId, upId
    this.downTarget.addEventListener('mousedown', (e) => { downId = setInterval(this.scrolldown.bind(this), 1) })
    this.downTarget.addEventListener('mouseup',   (e) => { clearInterval(downId) })
    this.downTarget.addEventListener('mouseleave',(e) => { clearInterval(downId) })
    this.upTarget.addEventListener( 'mousedown', (e) => { upId = setInterval(this.scrollup.bind(this), 1) })
    this.upTarget.addEventListener( 'mouseup',   (e) => { clearInterval(upId) })
    this.upTarget.addEventListener( 'mouseleave',(e) => { clearInterval(upId) })
  }

  scrolldown() {
    this.element.scrollup += this.threshold
  }

  scrollup() {
    this.element.scrollup -= this.threshold
  }
}
