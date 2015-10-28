defmodule Geocoding.Repo.Migrations.CreateLocation do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :name, :string
      add :phone_number, :string
      add :street_line_1, :string
      add :street_line_2, :string
      add :city, :string
      add :state, :string
      add :postal_code, :string
      add :country_code, :string
      add :store_number, :integer
      add :latitude, :float
      add :longitude, :float

      timestamps
    end
  end
end
