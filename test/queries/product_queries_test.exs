defmodule Nova.Queries.ProductQueriesTest do
  use Nova.ModelCase
  alias Nova.Queries.ProductQueries
  alias Nova.Product

  setup do
    product = fixtures(:products).products.default

    {:ok, product: product}
  end

  describe "find_by_id/1" do
    context "when product exists" do
      it "returns the product", ctx do
        assert %Product{} = ProductQueries.find_by_id(ctx.product.id)
      end
    end
  end

  describe "all/1" do
    it "returns a list of products" do
      assert [%Product{}] = ProductQueries.all
    end
  end
end
