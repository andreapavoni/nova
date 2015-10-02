defmodule Nova.Checkout.Billing do
  @moduledoc """
  Provides `:billing` behaviour for checkout.

  This mostly serves as an example to build a custom checkout.
  """

  alias Commerce.Billing

  defmacro __using__(_opts) do
    quote do
      @doc """
      Defines billing behaviour for checkout.
      """
      def checkout(order, :billing, params) do
        result = Billing.authorize(
          :payment_gateway,
          order.total,
          get_card(params["credit_card"]),
          billing_address: get_address(params["billing_address"]),
          description: "Payment for order #{order.id}"
        )

        case result do
          {:ok, payment_response} -> {:ok, order, payment_response}
          {:error, payment_response} -> {:error, order, payment_response.error}
        end
      end

      defp get_card(params) do
        %Billing.CreditCard{
          name:       params["name"],
          number:     params["number"],
          expiration: get_expiration(params["year"], params["month"]),
          cvc:        params["cvc"]
        }
      end

      defp get_expiration(year, month) when byte_size(year) > 0 and byte_size(month) > 0 do
        {String.to_integer(year), String.to_integer(month)}
      end
      defp get_expiration(_, _), do: {0, 0}

      defp get_address(params) do
        %Billing.Address{
          street1:     params["street1"],
          street2:     params["street2"],
          city:        params["city"],
          region:      params["region"],
          country:     params["country"],
          postal_code: params["postal_code"]
        }
      end
    end
  end
end
