defmodule PeekWeb.Resolvers.EventResolver do
  alias Peek.Events

  # feels redundant - how to write so queries are composeable?
  # ex. events with a duration of 60 starting between 01/05-02/05

  def events(_, %{title: title}, _) do
    {:ok, Events.get_event_by_title(title)}
  end

  def events(_, %{id: id}, _) do
    {:ok, Events.get_event(id)}
  end

  def events(_, %{duration: duration}, _) do
    {:ok, Events.get_event_by_duration(duration)}
  end

  def events(_, %{start: start}, _) do
    {:ok, Events.get_event_by_start(start)}
  end


  def events(_, _, _) do
    {:ok, Events.list_events()}
  end
end
