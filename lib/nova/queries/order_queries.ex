defmodule Nova.OrderQueries do
  @moduledoc """
  Provides functions to build queries for `Nova.Order`.
  """
  alias Nova.Order
  alias Nova.Repo
  import Ecto.Query, only: [from: 2]

  @doc """
  Finds an order by id.
  """
  def find_by_id(id) do
    Repo.get!(Order, id)
  end

  @doc """
  Finds all orders.
  """
  def all do
    Repo.all(Order)
  end

  @doc """
  Preloads line items in query.
  """
  def with_line_items(query) do
    from order in query,
    preload: [:line_items]
  end
end
