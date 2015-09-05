defmodule Nova.Queries.ProductQueriesTest do
  use Nova.ModelCase
  alias Nova.Queries.ProductQueries
  alias Nova.Product

  test "find_by_id/1 when product exists" do
    {:ok, product} = Fixtures.product([]) |> Repo.insert

    assert %Product{} = ProductQueries.find_by_id(product.id)
  end

  test "all/1 when product exists" do
    {:ok, _} = Fixtures.product([]) |> Repo.insert

    assert [%Product{}] = ProductQueries.all
  end

end
