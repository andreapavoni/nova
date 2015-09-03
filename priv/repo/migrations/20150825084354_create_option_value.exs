defmodule Nova.Repo.Migrations.CreateOptionValue do
  use Ecto.Migration

  def change do
    create table(:nova_option_values) do
      add :name, :string
      add :display_name, :string
      add :option_type_id, references(:nova_option_types)

      timestamps
    end

    create index(:nova_option_values, [:option_type_id])
    create unique_index(:nova_option_values, [:name, :option_type_id])
  end
end
