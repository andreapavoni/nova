defmodule Nova.Checkout.DummyTest do
  use ExSpec

  defmodule TestCart do
    use Nova.Checkout.Dummy
  end

  setup do
    {:ok, order: "order"}
  end

  describe "checkout/3" do
    context "when :address is passed" do
      it "goes to next state", ctx do
        assert {:ok, _, :payment} = TestCart.checkout(ctx.order, :address, [])
        assert {:ok, _, :complete} = TestCart.checkout(ctx.order, :payment, [])
      end
    end
  end
end
