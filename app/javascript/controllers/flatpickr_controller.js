import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";
import { French } from "flatpickr/dist/l10n/fr.js"

export default class extends Controller {
  static values = {
    range: Array
  }
  connect() {
    const range = this.rangeValue
    console.log(range);
    new flatpickr(this.element, {
      enableTime: false,
      minDate: "today",
      defaultDate: "today",
      mode: "range",
      "locale": French,
      dateFormat: "Y-m-d",
      disable: range,
      onChange: function(selectedDates, dateStr, instance) {
        const begin_date = selectedDates[0]
        const end_date = selectedDates[1]
        const number_of_days = (end_date - begin_date)/86400/1000
        const price_per_day = document.getElementsByClassName("price_per_day")[0].innerText.split('€')[0]
        const new_amount = `${(price_per_day * 1 * number_of_days) * 1}€`
        const total_amount = document.getElementsByClassName("price")[0]
        if (number_of_days < 1) {
          total_amount.innerText = "Choisir au moins 1 jour"
        } else {
          total_amount.innerText = new_amount
        }
      }
    });
  }
}
