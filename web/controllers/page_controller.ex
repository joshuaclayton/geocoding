defmodule Geocoding.PageController do
  use Geocoding.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
