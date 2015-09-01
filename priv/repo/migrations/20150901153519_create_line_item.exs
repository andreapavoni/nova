defmodule Gcommerce.Repo.Migrations.CreateLineItem do
  use Ecto.Migration

  def change do
    create table(:line_items) do
      add :quantity, :integer
      add :order_id, references(:orders)
      add :variant_id, references(:variants)

      timestamps
    end

    create index(:line_items, [:order_id])
    create index(:line_items, [:variant_id])
  end
end
