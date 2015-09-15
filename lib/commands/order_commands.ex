defmodule Nova.Commands.OrderCommands do
  alias Nova.Order
  alias Nova.Variant
  alias Nova.LineItem
  alias Nova.Repo
  alias Decimal, as: D

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
    order = Repo.get!(Order, id)
    params = %{
      quantity: quantity,
      order_id: id,
      variant_id: variant.id,
      total: D.mult(variant.price, D.new(quantity))
    }

    case LineItem.changeset(%LineItem{}, params) |> Repo.insert do
      {:ok, _} -> update_total(order)
      {:error, changeset} -> {:error, changeset}
    end
  end

  def update_line_item_quantity(id, line_item, quantity) do
    order = Repo.get!(Order, id)
    variant = Repo.get!(Variant, line_item.variant_id)
    line_item_total = D.mult(variant.price, D.new(quantity))

    {:ok, _} = line_item
    |> LineItem.changeset(%{quantity: quantity, total: line_item_total})
    |> Repo.update

    update_total order
  end

  def remove_line_item(id, line_item) do
    order = Repo.get!(Order, id)

    Repo.delete! line_item
    update_total order
  end

  defp update_total(order) do
    line_items = (order |> Repo.preload([:line_items])).line_items

    total = Enum.reduce(line_items, D.new(0.0), fn(li, acc) ->
      D.add(acc, li.total)
    end)

    update(order.id, %{total: total})
  end
end
