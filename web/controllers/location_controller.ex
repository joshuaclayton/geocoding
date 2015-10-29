defmodule Geocoding.LocationController do
  use Geocoding.Web, :controller
  alias Geocoding.Location

  def index(conn, %{"limit" => limit}) do
    locations = Ecto.Query.from(l in Location, select: l, limit: ^limit)
                |> Repo.all

    render conn, "index.html", locations: locations
  end

  def index(conn, _params) do
    locations = Repo.all(Location)

    render conn, "index.html", locations: locations
  end
end
