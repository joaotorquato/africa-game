import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    url: String
  }

  connect() {
    console.log("Hello, Reset Game!", this.element)
    console.log(this.urlValue)
  }

  reset() {
    if (confirm("Tem certeza disto?")) {
      fetch(this.urlValue, {
        method: 'DELETE',
        headers: {
          'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content
        }
      }).then(response => {
        if (response.ok) {
          window.location.href = '/';
        }
      });
    }
  }
}
