defmodule PeekWeb.Resolvers.BookingResolver do
  alias Peek.Bookings

  def get_bookings(_, _, _) do
    # TODO
    {:ok, nil}
  end

  def add_booking(_, %{booking: booking, event_id: event_id}, _) do
    Bookings.create_booking(event_id, booking)
  end
end
