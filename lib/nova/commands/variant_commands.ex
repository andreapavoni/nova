defmodule Nova.VariantCommands do
  @moduledoc """
  Provides functions that manipulate `Nova.Variant`.
  """
  alias Nova.Variant
  alias Nova.Product
  alias Nova.OptionValueVariant
  alias Nova.Repo

  @doc """
  Creates a new variant.
  """
  def create(params) do
    unless Map.has_key?(params, :price) do
      product = Repo.get(Product, params[:product_id])
      if product do
        params = Map.merge(params, %{price: product.price})
      end
    end

    %Variant{} |> Variant.changeset(params) |> Repo.insert
  end

  @doc """
  Updates a variant.
  """
  def update(id, params) do
    Variant
    |> Repo.get!(id)
    |> Variant.changeset(params)
    |> Repo.update
  end

  @doc """
  Deletes a variant.
  """
  def delete(id) do
    Variant |> Repo.get!(id) |> Repo.delete!
  end

  @doc """
  Adds an option value to a variant.
  """
  def add_option_value(id, option_value_id) do
    params = %{option_value_id: option_value_id, variant_id: id}
    %OptionValueVariant{}
    |> OptionValueVariant.changeset(params)
    |> Repo.insert
  end

end
