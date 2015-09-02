defmodule Gcommerce.Repo.Migrations.CreateOrder do
  use Ecto.Migration

  def change do
    create table(:gcommerce_orders) do
      add :total, :decimal

      timestamps
    end

  end
end
