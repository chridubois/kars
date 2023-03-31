import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";
import { French } from "flatpickr/dist/l10n/fr.js"

export default class extends Controller {
  connect() {
    new flatpickr(this.element, {
      enableTime: true,
      dateFormat: "d-m-Y",
      minDate: "today",
      mode: "range",
      "locale": French
      // more options available on the documentation!
    });
  }
}
