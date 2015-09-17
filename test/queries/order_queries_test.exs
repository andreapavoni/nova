defmodule Nova.Queries.OrderQueriesTest do
  use Nova.ModelCase
  alias Nova.Queries.OrderQueries
  alias Nova.Order

  setup do
    order = fixtures(:orders).orders.base

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

  describe "with_line_items/1" do
    it "preloads line items in query", ctx do
      variant = fixtures(:variants).variants.base
      Nova.Commands.OrderCommands.add_line_item ctx.order.id, variant.id, 1

      order = Order |> OrderQueries.with_line_items |> Repo.one

      assert Enum.count(order.line_items) == 1
    end
  end
end
