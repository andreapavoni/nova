defmodule Gcommerce.Fixtures.Products do
  alias Gcommerce.Product
  import Gcommerce.TestUtils

  def fixture(:product, attrs) do
    params = %{
      name: "some name",
      description: "some desc",
      price: 10.0,
      sku: "SKU-#{TestUtilsrandom}"
    } |> Map.merge(Enum.into(attrs, %{}))

    Product.changeset(%Product{}, params)
  end
end
