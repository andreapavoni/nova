defmodule Nova.Cart do
  @moduledoc """
  A wrapper module to expose checkout functions.
  """
  defdelegate checkout(order, :billing, params), to: Nova.Checkout.Billing
end
