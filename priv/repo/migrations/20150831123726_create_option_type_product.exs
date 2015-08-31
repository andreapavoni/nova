defmodule Gcommerce.Repo.Migrations.CreateOptionTypeProduct do
  use Ecto.Migration

  def change do
    create table(:option_type_products) do
      add :product_id, references(:products)
      add :option_type_id, references(:option_types)
    end

    create index(:option_type_products, [:product_id])
    create index(:option_type_products, [:option_type_id])
  end
end
