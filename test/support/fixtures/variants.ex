defmodule Nova.Fixtures.Variants do
  alias Nova.Repo
  alias Nova.Variant
  alias Nova.Fixtures.Products

  def variant(attrs) do
    product_id = attrs[:product_id] || (
      Products.product([])
      |> Repo.insert
      |> elem(1)
    ).id

    params = %{
      price: Faker.Commerce.price,
      sku: Faker.Code.isbn,
      product_id: product_id
    } |> Map.merge(Enum.into(attrs, %{}))

    Variant.changeset(%Variant{}, params)
  end
end
