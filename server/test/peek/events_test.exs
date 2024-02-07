defmodule Peek.EventsTest do
  use Peek.DataCase, async: true

  alias Peek.Events

  setup do
    event =
      Events.create_event(%{id: 2, title: "wine factory", duration: 30, start: ~N[2021-01-01 20:00:00]})

    {:ok, event: event}
  end

  test "can get a single event by id", context do
    %{event: event} = context
    assert Events.get_event(2) == event
  end

  test "can get a list of events by duration", context do
    %{event: event} = context
    assert Events.get_event_by_duration(30) == [event]
  end

  test "can get a list of events by title", context do
    %{event: event} = context
    assert Events.get_event_by_title("wINe facTORY") == [event]
  end

  test "can get a list of events by start date", context do
    %{event: event} = context
    assert Events.get_event_by_start(~N[2021-01-01 20:00:00]) == [event]
  end
end
