defmodule Gcommerce.Fixtures.Variants do
  alias Gcommerce.Repo
  alias Gcommerce.Variant
  alias Gcommerce.Fixtures.Products
  import Gcommerce.TestUtils

  def fixture(:variant, attrs) do
    {:ok, product} = case attrs[:product_id] do
      nil ->
        Products.fixture(:product, []) |> Repo.insert
      _   ->
        attrs[:product_id]
    end

    params = %{
      price: 120.5,
      sku: "SKU-#{TestUtilsrandom}",
      product_id: product.id
    } |> Map.merge(Enum.into(attrs, %{}))

    Variant.changeset(%Variant{}, params)
  end
end
