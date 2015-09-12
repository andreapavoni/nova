defmodule Nova.Queries.ProductQueriesTest do
  use Nova.ModelCase
  alias Nova.Queries.ProductQueries
  alias Nova.Product

  describe "find_by_id/1" do
    context "when product exists" do
      it "returns the product" do
        %{products: products} = fixtures(:products)

        assert %Product{} = ProductQueries.find_by_id(products.default.id)
      end
    end
  end

  describe "all/1" do
    it "returns a list of products" do
      %{products: _} = fixtures(:products)

      assert [%Product{}] = ProductQueries.all
    end
  end
end
