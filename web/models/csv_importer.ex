defmodule Geocoding.CsvImporter do
  alias Geocoding.Repo
  alias Geocoding.Location

  @mapping %{
    name: 2,
    phone_number: 10,
    street_line_1: 12,
    street_line_2: 13,
    city: 14,
    state: 15,
    postal_code: 16,
    country_code: 17,
    store_number: 1,
    latitude: 19,
    longitude: 20
  }

  def import(path) do
    File.stream!(path)
    |> CSV.decode
    |> import_from_stream
  end

  defp import_from_stream(stream) do
    stream
    |> Enum.each(&import_row/1)
  end

  defp import_row(row) do
    Location.changeset(:create, to_dict(row))
    |> Repo.insert
  end

  defp to_dict(csv_row) do
    @mapping
    |> Enum.reduce(%{}, fn({attribute, index}, acc) ->
      Dict.put(acc, attribute, Enum.at(csv_row, index))
    end)
  end
end
