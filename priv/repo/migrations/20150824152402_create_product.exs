defmodule Nova.Repo.Migrations.CreateProduct do
  use Ecto.Migration

  def change do
    create table(:nova_products) do
      add :name, :string
      add :description, :text
      add :sku, :string
      add :price, :decimal, precision: 10, scale: 2

      timestamps
    end

    create unique_index(:nova_products, [:sku])
  end
end
