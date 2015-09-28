defmodule Nova.Checkout.Dummy do
  @moduledoc """
  Example module to define a set of dummy checkout functions.

  This mostly serves as an example to build a custom checkout.
  """
  defmacro __using__(_opts) do
    quote do
      @doc """
      Defines checkout behaviour for :address.
      """
      def checkout(order, :address, params) do
        {:ok, order, :payment}
      end

      @doc """
      Defines checkout behaviour for :payment.
      """
      def checkout(order, :payment, params) do
        {:ok, order, :complete}
      end
    end
  end
end
