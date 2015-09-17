defmodule Nova.Queries.VariantQueries do
  @moduledoc """
  Provides functions to build queries for `Nova.Variant`.
  """

  alias Nova.Variant
  alias Nova.Repo
  import Ecto.Query, only: [from: 2]

  @doc """
  Finds a variant by id.
  """
  def find_by_id(id) do
    Repo.get!(Variant, id)
  end

  @doc """
  Finds all variants.
  """
  def all do
    Repo.all(Variant)
  end

  @doc """
  Finds all variants with a specific option value.
  """
  def by_option_value(query, option_value) do
    from variant in query,
    left_join: opt_val_variant in assoc(variant, :option_value_variants),
    join: option_value in assoc(opt_val_variant, :option_value)
  end
end
