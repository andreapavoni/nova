defmodule Nova.PropertyCommands do
  @moduledoc """
  Provides functions that manipulate `Nova.Property`.
  """

  alias Nova.Property
  alias Nova.Repo

  @doc """
  Creates a new property.
  """
  def create(params \\ %{}) do
    %Property{}
    |> Property.changeset(params)
    |> Repo.insert
  end

  @doc """
  Updates a property.
  """
  def update(id, params) do
    Property
    |> Repo.get!(id)
    |> Property.changeset(params)
    |> Repo.update
  end

  @doc """
  Deletes a property.
  """
  def delete(id) do
    Property
    |> Repo.get!(id)
    |> Repo.delete!
  end

end
