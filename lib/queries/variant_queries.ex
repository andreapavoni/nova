defmodule Gcommerce.Queries.VariantQueries do
  alias Gcommerce.Variant
  alias Gcommerce.Repo

  def get_product_by_id(id) do
    Repo.get!(Variant, id)
  end

  def get_all_products do
    Repo.all(Variant)
  end
end
