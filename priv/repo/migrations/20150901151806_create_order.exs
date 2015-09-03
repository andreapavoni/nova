defmodule Nova.Repo.Migrations.CreateOrder do
  use Ecto.Migration

  def change do
    create table(:nova_orders) do
      add :total, :decimal

      timestamps
    end

  end
end
