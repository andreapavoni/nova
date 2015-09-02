defmodule Gcommerce.Repo.Migrations.CreateLineItem do
  use Ecto.Migration

  def change do
    create table(:gcommerce_line_items) do
      add :quantity, :integer
      add :order_id, references(:gcommerce_orders)
      add :variant_id, references(:gcommerce_variants)

      timestamps
    end

    create index(:gcommerce_line_items, [:order_id])
    create index(:gcommerce_line_items, [:variant_id])
  end
end
