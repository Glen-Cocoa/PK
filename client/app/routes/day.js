import Route from '@ember/routing/route';

export default class DayRoute extends Route {
  model(params) {
    return {
      day: params.day,
      month: params.month
    }
  }
}
