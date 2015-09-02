defmodule Gcommerce.Queries.ProductQueriesTest do
  use Gcommerce.ModelCase
  alias Gcommerce.Queries.ProductQueries
  alias Gcommerce.Product

  test "get_product_by_id/1 when product exists" do
    {:ok, product} = Fixtures.product([]) |> Repo.insert

    assert %Product{} = ProductQueries.get_product_by_id(product.id)
  end

  test "get_product_by_id/1 when product exists" do
    {:ok, product} = Fixtures.product([]) |> Repo.insert

    assert [%Product{}] = ProductQueries.get_all_products
  end

end
