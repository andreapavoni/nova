defmodule Nova.OrderCommands do
  @moduledoc """
  Provides functions that manipulate `Nova.Order`.
  """

  alias Nova.Order
  alias Nova.Variant
  alias Nova.LineItem
  alias Nova.Repo
  alias Decimal, as: D

  @doc """
  Creates a new order.
  """
  def create do
    %Order{} |> Order.changeset |> Repo.insert
  end

  @doc """
  Deletes an order.
  """
  def delete(id) do
    Order
    |> Repo.get!(id)
    |> Repo.delete!
  end

  @doc """
  Updates an order.
  """
  def update(id, params) do
    Order
    |> Repo.get!(id)
    |> Order.changeset(params)
    |> Repo.update
  end

  @doc """
  Adds a line item to an order
  """
  def add_line_item(id, variant_id, quantity) do
    order = Repo.get!(Order, id)
    variant = Repo.get!(Variant, variant_id)
    params = %{
      quantity: quantity,
      order_id: id,
      variant_id: variant.id,
      total: D.mult(variant.price, D.new(quantity))
    }

    case %LineItem{} |> LineItem.changeset(params) |> Repo.insert do
      {:ok, line_item} ->
        {:ok,order} = update_total(order)
        {:ok, order, line_item}
      {:error, changeset} -> {:error, changeset}
    end
  end

  @doc """
  Updates a line item quantity in an order.
  """
  def update_line_item_quantity(id, line_item_id, quantity) do
    order = Repo.get!(Order, id)
    line_item = Repo.get!(LineItem, line_item_id)
    variant = Repo.get!(Variant, line_item.variant_id)
    line_item_total = D.mult(variant.price, D.new(quantity))

    {:ok, _} = line_item
    |> LineItem.changeset(%{quantity: quantity, total: line_item_total})
    |> Repo.update

    {:ok, order} = update_total order
    {:ok, order, line_item}
  end

  @doc """
  Removes a line item from an order.
  """
  def remove_line_item(id, line_item_id) do
    order = Repo.get!(Order, id)
    line_item = Repo.get!(LineItem, line_item_id)

    Repo.delete! line_item
    {:ok, order} = update_total order
    {:ok, order, line_item}
  end

  defp update_total(order) do
    line_items = (order |> Repo.preload([:line_items])).line_items

    total = Enum.reduce(line_items, D.new(0.0), fn(li, acc) ->
      D.add(acc, li.total)
    end)

    update(order.id, %{total: total})
  end
end
