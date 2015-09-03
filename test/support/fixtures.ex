defmodule Nova.Fixtures do
  alias Nova.Fixtures.OptionValues
  alias Nova.Fixtures.OptionTypes
  alias Nova.Fixtures.Products
  alias Nova.Fixtures.Variants
  alias Nova.Fixtures.Properties
  alias Nova.Fixtures.Orders

  def property(attrs), do: Properties.property attrs
  def product(attrs), do: Products.product attrs
  def variant(attrs), do: Variants.variant attrs
  def option_type(attrs), do: OptionTypes.option_type attrs
  def option_value(attrs), do: OptionValues.option_value attrs
  def order(attrs), do: Orders.order attrs

end
