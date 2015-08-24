defmodule Gcommerce.Repo.Migrations.CreateProduct do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :slug, :string
      add :description, :text
      add :sku, :string
      add :price, :decimal, precision: 10, scale: 2

      timestamps
    end

  end
end
