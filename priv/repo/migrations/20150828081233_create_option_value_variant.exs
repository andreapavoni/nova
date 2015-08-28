defmodule Gcommerce.Repo.Migrations.CreateOptionValueVariant do
  use Ecto.Migration

  def change do
    create table(:option_value_variants) do
      add :variant_id, references(:variants)
      add :option_value_id, references(:option_values)
    end

    create index(:option_value_variants, [:variant_id])
    create index(:option_value_variants, [:option_value_id])
  end
end
