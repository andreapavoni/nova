defmodule Nova.Repo.Migrations.CreateOptionValueVariant do
  use Ecto.Migration

  def change do
    create table(:nova_option_value_variants) do
      add :variant_id, references(:nova_variants)
      add :option_value_id, references(:nova_option_values)
    end

    create index(:nova_option_value_variants, [:variant_id])
    create index(:nova_option_value_variants, [:option_value_id])
  end
end
