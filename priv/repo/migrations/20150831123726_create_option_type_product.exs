defmodule Gcommerce.Repo.Migrations.CreateOptionTypeProduct do
  use Ecto.Migration

  def change do
    create table(:gcommerce_option_type_products) do
      add :product_id, references(:gcommerce_products)
      add :option_type_id, references(:gcommerce_option_types)
    end

    create index(:gcommerce_option_type_products, [:product_id])
    create index(:gcommerce_option_type_products, [:option_type_id])
  end
end
