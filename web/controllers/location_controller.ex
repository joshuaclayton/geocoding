defmodule Geocoding.LocationController do
  use Geocoding.Web, :controller
  alias Geocoding.Location

  def index(conn, _params) do
    # locations = Ecto.Query.from(l in Location, select: l, limit: 50) |> Repo.all
    locations = Repo.all(Location)

    render conn, "index.html", locations: locations
  end
end
