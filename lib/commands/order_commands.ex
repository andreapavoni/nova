defmodule Nova.Commands.OrderCommands do
  alias Nova.Order
  alias Nova.LineItem
  alias Nova.Repo

  def create do
    Order.changeset(%Order{}) |> Repo.insert
  end

  def delete(id) do
    Repo.get!(Order, id)
    |> Repo.delete!
  end

  def update(id, params) do
    Repo.get!(Order, id)
    |> Order.changeset(params)
    |> Repo.update
  end

  def add_line_item(id, variant, quantity) do
    alias Decimal, as: D

    order = Repo.get!(Order, id)
    params = %{quantity: quantity, order_id: id, variant_id: variant.id}

    case LineItem.changeset(%LineItem{}, params) |> Repo.insert do
      {:ok, line_item} ->
        new_total = D.add(order.total, D.mult(variant.price, D.new(quantity)))
        update(id, %{total: new_total})
      {:error, changeset} -> {:error, changeset}
    end
  end
end
