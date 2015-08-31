defmodule Gcommerce.Fixtures do
  alias Gcommerce.Fixtures.OptionValues
  alias Gcommerce.Fixtures.OptionTypes
  alias Gcommerce.Fixtures.Products
  alias Gcommerce.Fixtures.Variants

  def product(attrs) do
    Products.product attrs
  end

  def variant(attrs) do
    Variants.variant attrs
  end

  def option_type(attrs) do
    OptionTypes.option_type attrs
  end

  def option_value(attrs) do
    OptionValues.option_value attrs
  end
end
