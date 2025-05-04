import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["content", "button"]

  toggle() {
    this.contentTarget.classList.toggle("hidden")

    const showing = !this.contentTarget.classList.contains("hidden")
    const label = showing
        ? this.buttonTarget.dataset.hideLabel
        : this.buttonTarget.dataset.showLabel

    this.buttonTarget.textContent = label
  }
}
