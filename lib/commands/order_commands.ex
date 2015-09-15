defmodule Nova.Commands.OrderCommands do
  @moduledoc """
  A collection of commands to manupulate orders.
  """

  alias Nova.Order
  alias Nova.Variant
  alias Nova.LineItem
  alias Nova.Repo
  alias Decimal, as: D

  @doc """
  Create a new Order

      iex> OrderCommands.create
      {:ok, %Nova.Order{__meta__: #Ecto.Schema.Metadata<:loaded>, id: 1, ...}}
  """
  def create do
    Order.changeset(%Order{}) |> Repo.insert
  end

  @doc """
  Delete an Order

      iex> OrderCommands.delete 1
      %Nova.Order{__meta__: #Ecto.Schema.Metadata<:loaded>, id: 1, ...}
  """
  def delete(id) do
    Repo.get!(Order, id)
    |> Repo.delete!
  end

  @doc """
  Update an Order

      iex> OrderCommands.update 1, %{total: 123.0}
      {:ok, %Nova.Order{__meta__: #Ecto.Schema.Metadata<:loaded>, id: 1,
      total: #Decimal<123.0>, ...}}
  """
  def update(id, params) do
    Repo.get!(Order, id)
    |> Order.changeset(params)
    |> Repo.update
  end

  @doc """
  Add a LineItem to an Order and update its total

      iex> OrderCommands.add_line_item 1, variant, 1
      {:ok, %Nova.Order{__meta__: #Ecto.Schema.Metadata<:loaded>, id: 1,
      total: #Decimal<10.0>, ...}}
  """
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

  @doc """
  Update LineItem quantity in an Order and update the total in both

      iex> OrderCommands.update_line_item_quantity 1, line_item, 2
      {:ok, %Nova.Order{__meta__: #Ecto.Schema.Metadata<:loaded>, id: 1,
      total: #Decimal<20.0>, ...}}
  """
  def update_line_item_quantity(id, line_item, quantity) do
    order = Repo.get!(Order, id)
    variant = Repo.get!(Variant, line_item.variant_id)
    line_item_total = D.mult(variant.price, D.new(quantity))

    {:ok, _} = line_item
    |> LineItem.changeset(%{quantity: quantity, total: line_item_total})
    |> Repo.update

    update_total order
  end

  @doc """
  Remove a LineItem from an Order and update its total

      iex> OrderCommands.remove_line_item 1, line_item
      {:ok, %Nova.Order{__meta__: #Ecto.Schema.Metadata<:loaded>, id: 1,
      total: #Decimal<0.0>, ...}}
  """
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
