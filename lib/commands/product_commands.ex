defmodule Nova.Commands.ProductCommands do
  @moduledoc """
  Provides functions that manipulate `Nova.Product`.
  """

  alias Nova.Product
  alias Nova.Repo

  @doc """
  Creates a new product.
  """
  def create(params \\ %{}) do
    Product.changeset(%Product{}, params)
    |> Repo.insert
  end

  @doc """
  Updates a product.
  """
  def update(id, params) do
    Repo.get!(Product, id)
    |> Product.changeset(params)
    |> Repo.update
  end

  @doc """
  Deletes a product.
  """
  def delete(id) do
    Repo.get!(Product, id)
    |> Repo.delete!
  end

end
