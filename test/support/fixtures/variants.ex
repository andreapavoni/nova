defmodule Gcommerce.Fixtures.Variants do
  alias Gcommerce.Repo
  alias Gcommerce.Variant
  alias Gcommerce.Fixtures.Products
  import Gcommerce.TestUtils

  def fixture(:variant, attrs) do
    product_id = case attrs[:product_id] do
      nil ->
        {:ok, product} = Products.fixture(:product, []) |> Repo.insert
        product.id
      _   ->
        attrs[:product_id]
    end

    params = %{
      price: 120.5,
      sku: "SKU-#{random}",
      product_id: product_id
    } |> Map.merge(Enum.into(attrs, %{}))

    Variant.changeset(%Variant{}, params)
  end
end
