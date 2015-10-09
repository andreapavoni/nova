defmodule Nova.Checkout.BillingTest do
  use Nova.ModelCase

  defmodule TestCart do
    defdelegate checkout(order, :billing, params), to: Nova.Checkout.Billing
  end

  setup do
    order = fixtures(:orders).orders.base

    {:ok, order: order}
  end

  @params %{
    "billing_address" => %{
      "street1" => "example street1",
      "street2" => "example street2",
      "city" => "Testville",
      "region" => "Region",
      "country" => "IT",
      "postal_code" => "12345"
    },
    "credit_card" => %{
      "name" => "John Doe",
      "number" => "4111111111111111",
      "month" => "10",
      "year" => "2019",
      "cvc" => "123"
    }
  }

  describe "checkout/3" do
    context "with valid data" do
      it "sends billing address and credit card to payment gateway", ctx do
        assert {:ok, _, _} = TestCart.checkout(ctx.order, :billing, @params)
      end
    end
  end
end
