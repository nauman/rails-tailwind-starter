// import debounce from "https://cdn.skypack.dev/lodash.debounce"
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="share"
export default class extends Controller {
  static targets = ["searchInput", "searchForm"]

  initialize() {
    // this.submit = debounce(this.submit.bind(this), 200)
  }

  connect() {
    console.log("Connected!! with share controller")
    this.currentValue = this.searchInputTarget.value
  }

  search(event) {
    setTimeout(() => {
      const newValue = this.searchInputTarget.value

      if (this.currentValue != newValue) {
        this.currentValue = newValue
        this.searchFormTarget.requestSubmit()
      }
    }, 500)
  }

  findResults(event) {
    this.element.requestSubmit();
  }
}
