defmodule Gcommerce.Repo.Migrations.CreateProductProperty do
  use Ecto.Migration

  def change do
    create table(:product_properties) do
      add :product_id, references(:products)
      add :property_id, references(:properties)
      add :value, :string
    end

    create index(:product_properties, [:product_id])
    create index(:product_properties, [:property_id])
  end
end
