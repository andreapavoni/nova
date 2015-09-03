defmodule Nova.Queries.VariantQueries do
  alias Nova.Variant
  alias Nova.Repo

  def get_product_by_id(id) do
    Repo.get!(Variant, id)
  end

  def get_all_products do
    Repo.all(Variant)
  end
end
