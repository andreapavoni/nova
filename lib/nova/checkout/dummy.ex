defmodule Nova.Checkout.Dummy do
  @moduledoc """
  Example module that defines a dummy checkout function.

  This mostly serves as an example to build a custom checkout.
  """
  defmacro __using__(_opts) do
    quote do
      @doc """
      Defines checkout behaviour for a generic :checkout_step_name.

      It returns a 3 elements tuple:

       * when success: `{:ok, order, some_result}`
       * when failure: `{:error, order, error_details}`
      """
      def checkout(order, :checkout_step_name, params) do
        # it returns a tuple with 3 elements
        {:ok, order, "some result"}
      end
    end
  end
end
