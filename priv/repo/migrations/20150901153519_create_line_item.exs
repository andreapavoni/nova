defmodule Nova.Repo.Migrations.CreateLineItem do
  use Ecto.Migration

  def change do
    create table(:nova_line_items) do
      add :quantity, :integer
      add :order_id, references(:nova_orders)
      add :variant_id, references(:nova_variants)

      timestamps
    end

    create index(:nova_line_items, [:order_id])
    create index(:nova_line_items, [:variant_id])
  end
end
