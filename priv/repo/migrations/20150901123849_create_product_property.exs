defmodule Gcommerce.Repo.Migrations.CreateProductProperty do
  use Ecto.Migration

  def change do
    create table(:gcommerce_product_properties) do
      add :product_id, references(:gcommerce_products)
      add :property_id, references(:gcommerce_properties)
      add :value, :string
    end

    create index(:gcommerce_product_properties, [:product_id])
    create index(:gcommerce_product_properties, [:property_id])
  end
end
