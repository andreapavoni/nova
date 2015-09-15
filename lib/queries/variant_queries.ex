defmodule Nova.Queries.VariantQueries do
  alias Nova.Variant
  alias Nova.Repo
  import Ecto.Query, only: [from: 2]

  def find_by_id(id) do
    Repo.get!(Variant, id)
  end

  def all do
    Repo.all(Variant)
  end

  def with_option_value(query, option_value) do
    from variant in query,
    left_join: opt_val_variant in assoc(variant, :option_value_variants),
    join: option_value in assoc(opt_val_variant, :option_value)
  end
end
