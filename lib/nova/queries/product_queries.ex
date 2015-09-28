defmodule Nova.ProductQueries do
  @moduledoc """
  Provides functions to build queries for `Nova.Product`.
  """
  alias Nova.Product
  alias Nova.Repo

  @doc """
  Finds a product by id.
  """
  def find_by_id(id) do
    Repo.get!(Product, id)
  end

  @doc """
  Finds all products.
  """
  def all do
    Repo.all(Product)
  end
end
