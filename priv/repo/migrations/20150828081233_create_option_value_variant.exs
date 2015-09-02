defmodule Gcommerce.Repo.Migrations.CreateOptionValueVariant do
  use Ecto.Migration

  def change do
    create table(:gcommerce_option_value_variants) do
      add :variant_id, references(:gcommerce_variants)
      add :option_value_id, references(:gcommerce_option_values)
    end

    create index(:gcommerce_option_value_variants, [:variant_id])
    create index(:gcommerce_option_value_variants, [:option_value_id])
  end
end
