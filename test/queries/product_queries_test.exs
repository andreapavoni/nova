defmodule Nova.Queries.ProductQueriesTest do
  use Nova.ModelCase
  alias Nova.Queries.ProductQueries
  alias Nova.Product

  describe "find_by_id/1" do
    context "when product exists" do
      it "returns the product" do
        {:ok, product} = Fixtures.product([]) |> Repo.insert

        assert %Product{} = ProductQueries.find_by_id(product.id)
      end
    end
  end

  describe "all/1" do
    it "returns a list of products" do
      {:ok, _} = Fixtures.product([]) |> Repo.insert

      assert [%Product{}] = ProductQueries.all
    end
  end
end
