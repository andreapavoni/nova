defmodule Gcommerce.Repo.Migrations.CreateVariant do
  use Ecto.Migration

  def change do
    create table(:variants) do
      add :sku, :string
      add :price, :decimal, precision: 10, scale: 2
      add :product, references(:products)

      timestamps
    end
    create index(:variants, [:product])

  end
end
