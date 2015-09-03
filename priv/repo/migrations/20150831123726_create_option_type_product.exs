defmodule Nova.Repo.Migrations.CreateOptionTypeProduct do
  use Ecto.Migration

  def change do
    create table(:nova_option_type_products) do
      add :product_id, references(:nova_products)
      add :option_type_id, references(:nova_option_types)
    end

    create index(:nova_option_type_products, [:product_id])
    create index(:nova_option_type_products, [:option_type_id])
  end
end
