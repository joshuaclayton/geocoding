defmodule Geocoding.LocationController do
  use Geocoding.Web, :controller
  alias Geocoding.Location

  def index(conn, %{"limit" => limit}) do
    query = from(l in Location, select: l, limit: ^limit)
    conn |> _index(query)
  end

  def index(conn, _params) do
    conn |> _index
  end

  defp _index(conn, query \\ Location) do
    render conn,
      "index.html",
      locations: query |> Repo.all
  end
end
