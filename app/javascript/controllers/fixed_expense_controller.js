import { Controller } from "@hotwired/stimulus"
// import { get } from "@rails/request.js"

export default class extends Controller {
  static targets = [ "fixedTotals" ]

  updateTotals(event) {
    const data = Object.fromEntries(new FormData(event.target).entries())
    console.log(data)
    console.log(data["fixed_expense[amount]"])
    console.log(data["fixed_expense[frequency]"])
    console.log(this.fixedTotalsTarget)
    let amount = data["fixed_expense[amount]"]
    let frequency = data["fixed_expense[frequency]"]
    // get(`/fixed_expenses/total_expenses?`)
  }
}


// export default class extends Controller {
//   static targets = ["monthlyPaymentDisplay"]
//
//   homeDataUpdate(event){
//     let homeId = event.target.selectedOptions[0].value
//     let target = this.monthlyPaymentDisplayTarget.id
//     get(`/recurring_payments/monthly_payment?home=${homeId}&target=${target}`,{
//       responseKind: "turbo-stream"
//     })
//   }
// }