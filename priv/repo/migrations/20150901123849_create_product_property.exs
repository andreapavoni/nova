defmodule Nova.Repo.Migrations.CreateProductProperty do
  use Ecto.Migration

  def change do
    create table(:nova_product_properties) do
      add :product_id, references(:nova_products)
      add :property_id, references(:nova_properties)
      add :value, :string
    end

    create index(:nova_product_properties, [:product_id])
    create index(:nova_product_properties, [:property_id])
  end
end
