defmodule Gcommerce.Repo.Migrations.CreateVariant do
  use Ecto.Migration

  def change do
    create table(:gcommerce_variants) do
      add :sku, :string
      add :price, :decimal, precision: 10, scale: 2
      add :product_id, references(:gcommerce_products)

      timestamps
    end

    create index(:gcommerce_variants, [:product_id])
    create unique_index(:gcommerce_variants, [:sku])
  end
end
