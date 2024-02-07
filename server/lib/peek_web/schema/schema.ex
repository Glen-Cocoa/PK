defmodule PeekWeb.Schema.Schema do
  @moduledoc """
  GraphQL Schema for bookings and events.
  """
  use Absinthe.Schema

  import_types(Absinthe.Type.Custom)

  alias PeekWeb.Resolvers.EventResolver
  alias PeekWeb.Resolvers.BookingResolver

  #
  # Queries
  #

  # possible to have a single query object arg?
  # ex. events(filter: {
  # id: *,
  # title: "skydiving",
  # duration: "30-60",
  # start: "01/01/2024-01/06/2024
  # })

  query do
    @desc "Get a list of events with the option to search/query"
    field :events, list_of(:event) do
      arg :id, :integer
      arg :title, :string
      arg :duration, :integer
      arg :start, :naive_datetime
      resolve(&EventResolver.events/3)
    end
  end

  mutation do
    @desc "add a booking to an existing event"
      field :events, :event do
        arg :booking, :single_booking
        arg :event_id, :id
        resolve(&BookingResolver.add_booking/3)
      end
    end
  #
  # Event Object
  #
  object :event do
    field :id, non_null(:id)
    field :start, non_null(:naive_datetime)
    field :duration, non_null(:integer)
    field :title, non_null(:string)

    field :bookings, non_null(list_of(non_null(:booking))), resolve: &BookingResolver.get_bookings/3
  end

  #
  # Booking Object
  #
  object :booking do
    field :first_name, non_null(:string)
    field :last_name, non_null(:string)
  end

  input_object :single_booking do
    field :first_name, non_null(:string)
    field :last_name, non_null(:string)
  end

end
