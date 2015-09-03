defmodule Nova.Repo.Migrations.CreateVariant do
  use Ecto.Migration

  def change do
    create table(:nova_variants) do
      add :sku, :string
      add :price, :decimal, precision: 10, scale: 2
      add :product_id, references(:nova_products)

      timestamps
    end

    create index(:nova_variants, [:product_id])
    create unique_index(:nova_variants, [:sku])
  end
end
