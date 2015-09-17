defmodule Nova.Queries.OrderQueries do
  @moduledoc """
  Provides functions to build queries for `Nova.Order`.
  """
  alias Nova.Order
  alias Nova.Repo

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
end
