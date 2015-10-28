defmodule Geocoding.Location do
  use Geocoding.Web, :model

  schema "locations" do
    field :name, :string
    field :phone_number, :string
    field :street_line_1, :string
    field :street_line_2, :string
    field :city, :string
    field :state, :string
    field :postal_code, :string
    field :country_code, :string
    field :store_number, :integer
    field :latitude, :float
    field :longitude, :float

    timestamps
  end


  def changeset(model_or_changeset \\ %__MODULE__{}, :create, params) do
    model_or_changeset
    |> cast(params, ~w(name phone_number street_line_1 street_line_2 city state postal_code country_code store_number latitude longitude))
  end
end
