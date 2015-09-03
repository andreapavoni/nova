defmodule Nova.Queries.ProductQueries do
  alias Nova.Product
  alias Nova.Repo

  def get_product_by_id(id) do
    Repo.get!(Product, id)
  end

  def get_all_products do
    Repo.all(Product)
  end
end
