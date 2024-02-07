import Route from '@ember/routing/route';
import { service } from '@ember/service';

export default class DayRoute extends Route {
  @service
  apolloService

  beforeModel() {}

  async model(params) {
    const targetDay = parseInt(params.day)
    const targetMonth = parseInt(params.month) - 1
    const targetYear = parseInt(params.year)

    console.log(params)
    const events = await this.apolloService.fetchAllEvents()
    const filteredEvents = await events.reduce((filtered, event) => {
      const startDate = new Date(event.start)
      if (startDate.getDate() === targetDay 
      && startDate.getMonth() === targetMonth 
      && startDate.getFullYear() === targetYear) {
        filtered.push(event)

    }
    return filtered}, []) 

    const model = 
    {
      day: params.day,
      month: params.month,
      year: params.year,
      events: filteredEvents
    }
    return model
  }
}
