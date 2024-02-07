import Component from '@glimmer/component'
import { action } from '@ember/object'
import { inject as service } from '@ember/service'

export default class IndexComponent extends Component {
  @service router

  months = [
    { name: 'January', days: 31 },
    { name: 'February', days: 28 },
    { name: 'March', days: 31 },
    { name: 'April', days: 30 },
    { name: 'May', days: 31 },
    { name: 'June', days: 30 },
    { name: 'July', days: 31 },
    { name: 'August', days: 31 },
    { name: 'September', days: 30 },
    { name: 'October', days: 31 },
    { name: 'November', days: 30 },
    { name: 'December', days: 31 }
  ]

  @action
  navigateToCalendar(event) {
    const selectedMonth = event.target.value
    const daysInMonth = event.target.selectedOptions[0].dataset.days

    if (selectedMonth) {
      this.router.transitionTo('calendar', selectedMonth, { queryParams: { days: daysInMonth } })
    }
  }
}
