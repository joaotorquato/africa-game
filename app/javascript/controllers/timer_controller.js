import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["output", "icon", "wordLabel"]
  static values = {
    remaining: Number,
    audio: String
  }

  connect() {
    console.log("Loading timer. Time remaining:" + this.remainingValue)
    this.timeLeft = this.remainingValue // Time in seconds
    this.startTimer()
  }

  startTimer() {
    this.timer = setInterval(() => {
      if (this.timeLeft > 0) {
        this.timeLeft -= 1
        this.outputTarget.textContent = `${this.timeLeft}s`
      } else {
        this.stopTimer()
        this.playBell()
      }
    }, 1000)
  }

  stopTimer() {
    clearInterval(this.timer)
    this.wordLabelTarget.value = "-"
    this.outputTarget.textContent = "Parar!"
    this.iconTarget.remove()
    feather.replace()
  }

  playBell() {
    // Play a bell sound
    new Audio(this.audioValue).play()
  }

  submitForm(event) {
    event.preventDefault()
    console.log('stop timer before submit!')
    if (this.timeLeft > 0) {
      this.stopTimer()
    }
    this.element.closest('form').submit()
  }
}
