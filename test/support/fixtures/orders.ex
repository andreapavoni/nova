defmodule Gcommerce.Fixtures.Orders do
  alias Gcommerce.Repo
  alias Gcommerce.Order

  def order(attrs) do
    params = %{
      total: Faker.Commerce.price,
    } |> Map.merge(Enum.into(attrs, %{}))

    Order.changeset(%Order{}, params)
  end
end
