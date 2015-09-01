defmodule Gcommerce.Fixtures do
  alias Gcommerce.Fixtures.OptionValues
  alias Gcommerce.Fixtures.OptionTypes
  alias Gcommerce.Fixtures.Products
  alias Gcommerce.Fixtures.Variants
  alias Gcommerce.Fixtures.Properties

  def property(attrs), do: Properties.property attrs
  def product(attrs), do: Products.product attrs
  def variant(attrs), do: Variants.variant attrs
  def option_type(attrs), do: OptionTypes.option_type attrs
  def option_value(attrs), do: OptionValues.option_value attrs
  
end
