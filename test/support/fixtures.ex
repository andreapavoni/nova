defmodule Gcommerce.Fixtures do
  alias Gcommerce.Product

  def fixture(:product, attrs \\ []) do
    name = attrs[:name] || "Some cool product"
    %Product{name: name}
  end
end
