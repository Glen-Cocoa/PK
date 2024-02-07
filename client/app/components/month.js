import Component from '@glimmer/component';


export default class Month extends Component {
    get daysInMonth(){
        let days = []
        const { month_length, start_day } = this.args
        let startDayIndex = start_day % 7

        for (let i = 1; i <= month_length; i++) {
            days.push({ number: i, isWeekend: startDayIndex % 7 === 0 || startDayIndex % 7 === 6 })
            startDayIndex++
          }

          return days
    }
  constructor(...args) {
    super(...args)
}