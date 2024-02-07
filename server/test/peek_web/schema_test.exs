defmodule PeekWeb.SchemaTest do
  use PeekWeb.ConnCase, async: true

  alias Peek.Events

  @query """
  {
    events {
      id
      title
      start
      duration
    }
  }
  """

  setup do
    event =
      Events.create_event(%{id: 1, title: "wine factory", duration: 30, start: ~N[2021-01-01 20:00:00]})

    {:ok, event: event}
  end

  test "returns all events", context do
    %{conn: conn, event: event} = context
    conn = post(conn, "/api", query: @query)

    assert json_response(conn, 200) == %{
             "data" => %{
               "events" => [
                 %{
                  "id" => "#{event.id}",
                   "duration" => event.duration,
                   "start" => "2021-01-01T20:00:00",
                   "title" => event.title
                 }
               ]
             }
           }
  end

  test "returns an event by id", context do
    %{conn: conn, event: event} = context
    conn = post(conn, "/api", query: @query)

    assert json_response(conn, 200) == %{
      "data" => %{
        "events" => [
          %{
            "id" => "#{event.id}",
            "duration" => event.duration,
            "start" => "2021-01-01T20:00:00",
            "title" => event.title
          }
        ]
      }
    }
  end

  test "returns an event by duration", context do
    %{conn: conn, event: event} = context
    conn = post(conn, "/api", query: @query)

    assert json_response(conn, 200) == %{
      "data" => %{
        "events" => [
          %{
            "id" => "#{event.id}",
            "duration" => event.duration,
            "start" => "2021-01-01T20:00:00",
            "title" => event.title
          }
        ]
      }
    }
  end

  test "returns a list of event by title", context do
    %{conn: conn, event: event} = context
    conn = post(conn, "/api", query: @query)

    assert json_response(conn, 200) == %{
      "data" => %{
        "events" => [
          %{
            "id" => "#{event.id}",
            "duration" => event.duration,
            "start" => "2021-01-01T20:00:00",
            "title" => event.title
          }
        ]
      }
    }
  end

  test "returns a list of event by start", context do
    %{conn: conn, event: event} = context
    conn = post(conn, "/api", query: @query)

    assert json_response(conn, 200) == %{
      "data" => %{
        "events" => [
          %{
            "id" => "#{event.id}",
            "duration" => event.duration,
            "start" => "2021-01-01T20:00:00",
            "title" => event.title
          }
        ]
      }
    }
  end
end
