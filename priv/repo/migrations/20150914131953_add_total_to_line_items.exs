defmodule Nova.Repo.Migrations.AddTotalToLineItems do
  use Ecto.Migration

  def change do
    alter table(:nova_line_items) do
      add :total, :decimal, precision: 10, scale: 2
    end
  end
end
