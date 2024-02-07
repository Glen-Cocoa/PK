defmodule Peek.EventResolverTest do
  use Peek.DataCase, async: true

  alias Peek.Events
  alias PeekWeb.Resolvers.EventResolver

  #TODO test with params

  setup do
    event =
      Events.create_event(%{id: 2, title: "wine factory", duration: 30, start: ~N[2021-01-01 20:00:00]})

    {:ok, event: event}
  end

  test "can get a single event by id", context do
    %{event: event} = context
    assert EventResolver.events(nil, %{id: 2}, nil) == {:ok, event}
  end

  test "can get a list of events by duration", context do
    %{event: event} = context
    assert EventResolver.events(nil, %{duration: 30}, nil) == {:ok, [event]}
  end

  test "can get a list of events by title", context do
    %{event: event} = context
    assert EventResolver.events(nil, %{title: "wine FACTORY"}, nil) == {:ok, [event]}
  end

  test "can get a list of events by start date", context do
    %{event: event} = context
    assert EventResolver.events(nil, %{start: "2021-01-01 20:00:00"}, nil) == {:ok, [event]}
  end
end
