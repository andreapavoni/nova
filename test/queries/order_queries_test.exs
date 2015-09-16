defmodule Nova.Queries.OrderQueriesTest do
  use Nova.ModelCase
  alias Nova.Queries.OrderQueries
  alias Nova.Order

  setup do
    order = fixtures(:orders).orders.default

    {:ok, order: order}
  end

  describe "find_by_id/1" do
    context "when order exists" do
      it "returns the order", ctx do
        assert %Order{} = OrderQueries.find_by_id(ctx.order.id)
      end
    end
  end

  describe "all/1" do
    it "returns a list of orders" do
      assert [%Order{}] = OrderQueries.all
    end
  end
end
