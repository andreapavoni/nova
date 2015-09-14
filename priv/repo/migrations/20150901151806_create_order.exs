defmodule Nova.Repo.Migrations.CreateOrder do
  use Ecto.Migration

  def change do
    create table(:nova_orders) do
      add :total, :decimal, precision: 10, scale: 2

      timestamps
    end

  end
end
