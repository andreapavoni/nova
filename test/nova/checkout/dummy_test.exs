defmodule Nova.Checkout.DummyTest do
  use ExSpec

  defmodule TestCart do
    alias Nova.Checkout.Dummy
    defdelegate checkout(order, :checkout_step_name, params), to: Dummy
  end

  setup do
    {:ok, order: "order"}
  end

  describe "checkout/3" do
    context "when :address is passed" do
      it "goes to next state", ctx do
        assert {:ok, _, _} = TestCart.checkout(ctx.order, :checkout_step_name, [])
      end
    end
  end
end
