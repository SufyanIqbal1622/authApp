import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    setTimeout("$('.alert').fadeOut(3000)")
    setTimeout("$('.notice').fadeOut(4000)")
  }
}
