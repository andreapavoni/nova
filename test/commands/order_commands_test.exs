defmodule Nova.Commands.OrderCommandsTest do
  use Nova.ModelCase
  alias Nova.Commands.OrderCommands
  alias Nova.Order

  setup do
    %{variants: variants} = fixtures(:variants)
    %{orders: orders} = fixtures(:orders)

    {:ok, variant: variants.default, order: orders.default}
  end

  describe "create/0" do
    it "creates a new order" do
      assert {:ok, %Order{}} = OrderCommands.create
    end
  end

  describe "update/2" do
    it "updates the order", ctx do
      params = %{total: 10.0}
      {:ok, order} = OrderCommands.update(ctx[:order].id, params)

      assert %Order{} = order
      assert order.total == Decimal.new(10.0)
    end
  end

  describe "add_line_item/3" do
    it "adds line_item to the order and updates total", ctx do
      {order, variant} = {ctx[:order], ctx[:variant]}
      {:ok, order} = OrderCommands.add_line_item(order.id, variant, 1)

      assert %Order{} = order
      assert order.total == variant.price
    end
  end

  describe "update_line_item_quantity/3" do
    it "updates line_item quantity and updates order total", ctx do
      {order, variant} = {ctx[:order], ctx[:variant]}
      {:ok, order} = OrderCommands.add_line_item(order.id, variant, 1)
      line_item = hd((order |> Repo.preload([:line_items])).line_items)

      {:ok, order} = OrderCommands.update_line_item_quantity(order.id, line_item, 2)
      new_price = Decimal.mult(variant.price, Decimal.new(2))

      assert %Order{} = order
      assert order.total == new_price
    end
  end

  describe "remove_line_item/2" do
    it "removes line_item and updates order total", ctx do
      {order, variant} = {ctx[:order], ctx[:variant]}
      {:ok, order} = OrderCommands.add_line_item(order.id, variant, 1)
      line_item = hd((order |> Repo.preload([:line_items])).line_items)

      {:ok, order} = OrderCommands.remove_line_item(order.id, line_item)

      assert %Order{} = order
      assert order.total == Decimal.new(0.0)
    end
  end

  describe "delete/1" do
    it "deletes the order", ctx do
      assert %Order{} = OrderCommands.delete(ctx[:order].id)
      refute Repo.get(Order, ctx[:order].id)
    end
  end
end
