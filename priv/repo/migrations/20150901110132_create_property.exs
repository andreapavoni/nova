defmodule Gcommerce.Repo.Migrations.CreateProperty do
  use Ecto.Migration

  def change do
    create table(:properties) do
      add :name, :string
      add :display_name, :string
    end

    create index(:properties, [:name])
  end
end
