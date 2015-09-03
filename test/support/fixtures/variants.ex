defmodule Nova.Fixtures.Variants do
  alias Nova.Repo
  alias Nova.Variant
  alias Nova.Fixtures.Products

  def variant(attrs) do
    product_id = case attrs[:product_id] do
      nil ->
        {:ok, product} = Products.product([]) |> Repo.insert
        product.id
      _   ->
        attrs[:product_id]
    end

    params = %{
      price: Faker.Commerce.price,
      sku: Faker.Code.isbn,
      product_id: product_id
    } |> Map.merge(Enum.into(attrs, %{}))

    Variant.changeset(%Variant{}, params)
  end
end
