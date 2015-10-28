defmodule Geocoding.LocationView do
  use Geocoding.Web, :view

  def address(location) do
    [location.street_line_1, location.street_line_2, location.city,
      location.state, location.postal_code, location.country_code]
    |> Enum.reject(fn(x) -> is_nil(x) || x == "" end)
    |> Enum.join(", ")
  end
end
