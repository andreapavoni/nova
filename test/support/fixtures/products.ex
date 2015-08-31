defmodule Gcommerce.Fixtures.Products do
  alias Gcommerce.Product

  def product(attrs) do
    params = %{
      name: Faker.Commerce.product_name,
      description: to_string(Faker.Lorem.paragraphs(2)),
      price: Faker.Commerce.price,
      sku: Faker.Code.isbn
    } |> Map.merge(Enum.into(attrs, %{}))

    Product.changeset(%Product{}, params)
  end
end
