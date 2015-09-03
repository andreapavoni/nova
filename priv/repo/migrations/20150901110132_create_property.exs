defmodule Nova.Repo.Migrations.CreateProperty do
  use Ecto.Migration

  def change do
    create table(:nova_properties) do
      add :name, :string
      add :display_name, :string
    end

    create index(:nova_properties, [:name])
  end
end
