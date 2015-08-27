defmodule Gcommerce.Fixtures do
  alias Gcommerce.Product

  def fixture(:product, attrs \\ []) do
    params = %{
      name: "some name",
      description: "some desc",
      price: 10.0,
      sku: "SKU"
    } |> Map.merge(Enum.into(attrs, %{}))

    Product.changeset(%Product{}, params)
  end
end
