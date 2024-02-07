defmodule Peek.Events do
  @moduledoc """
  The Planner context.
  """

  import Ecto.Query, warn: false
  alias Peek.Repo

  alias Peek.Events.Event

  @doc """
  Returns the list of events.

  ## Examples

      iex> list_events()
      [%Event{}, ...]

  """

  def list_events do
    Repo.all(Event)
  end


  @doc """
  Create a new Event.

  ## Examples

      iex> create_event(%{title: "event", "duration": 30, "start": ~N[2000-01-01 23:00:07]})
      [%Event{}, ...]

  """
  def create_event(attrs) do
    event = %Event{}

    Map.merge(event, attrs)
    |> Repo.insert!()
  end

  @doc """
    Same as get_event
    Doesn't need to raise an error.
  """
  def get_event(id), do: Repo.get(Event, id)

  # these are simple get by exact match queries
  # what about searching for a period?
  # ex. events with a duration between 45-60
  # ex. events starting between 01/05-02/05

  def get_event_by_title(title) do
    query = from e in Event,
    where: ilike(e.title, ^title)
    Repo.all(query)
  end

  def get_event_by_duration(duration) do
    query = from e in Event,
    where: e.duration == ^duration
    Repo.all(query)
  end

  # nice to have - allow for date times of different formats
  def get_event_by_start(start) do
    query = from e in Event,
    where: e.start == ^start
    Repo.all(query)
  end
end
