defmodule Gcommerce.Repo.Migrations.CreateOptionValue do
  use Ecto.Migration

  def change do
    create table(:option_values) do
      add :name, :string
      add :display_name, :string
      add :option_type_id, references(:option_types)

      timestamps
    end
    create index(:option_values, [:option_type_id])

  end
end
