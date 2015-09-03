defmodule Nova.Fixtures.Orders do
  alias Nova.Repo
  alias Nova.Order

  def order(attrs) do
    params = %{
      total: Faker.Commerce.price,
    } |> Map.merge(Enum.into(attrs, %{}))

    Order.changeset(%Order{}, params)
  end
end
