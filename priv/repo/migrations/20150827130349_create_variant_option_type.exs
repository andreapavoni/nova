defmodule Gcommerce.Repo.Migrations.CreateVariantOptionType do
  use Ecto.Migration

  def change do
    create table(:variant_option_types) do
      add :variant_id, references(:variants)
      add :option_type_id, references(:option_types)
    end

    create index(:variant_option_types, [:variant_id])
    create index(:variant_option_types, [:option_type_id])
  end
end
