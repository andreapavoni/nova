defmodule Nova.ProductCommands do
  @moduledoc """
  Provides functions that manipulate `Nova.Product`.
  """

  alias Nova.Product
  alias Nova.ProductProperty
  alias Nova.OptionTypeProduct
  alias Nova.Repo

  @doc """
  Creates a new product.
  """
  def create(params \\ %{}) do
    %Product{}
    |> Product.changeset(params)
    |> Repo.insert
  end

  @doc """
  Updates a product.
  """
  def update(id, params) do
    Product
    |> Repo.get!(id)
    |> Product.changeset(params)
    |> Repo.update
  end

  @doc """
  Deletes a product.
  """
  def delete(id) do
    Product
    |> Repo.get!(id)
    |> Repo.delete!
  end

  @doc """
  Adds a property to product.
  """
  def add_property(id, property_id, value) do
    params = %{product_id: id, property_id: property_id, value: value}

    %ProductProperty{}
    |> ProductProperty.changeset(params)
    |> Repo.insert
  end

  @doc """
  Adds an option type to product.
  """
  def add_option_type(id, option_type_id) do
    params = %{product_id: id, option_type_id: option_type_id}

    %OptionTypeProduct{}
    |> OptionTypeProduct.changeset(params)
    |> Repo.insert
  end

end
