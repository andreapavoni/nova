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
    Property.changeset(%Property{}, params)
    |> Repo.insert
  end

  @doc """
  Updates a property.
  """
  def update(id, params) do
    Repo.get!(Property, id)
    |> Property.changeset(params)
    |> Repo.update
  end

  @doc """
  Deletes a property.
  """
  def delete(id) do
    Repo.get!(Property, id)
    |> Repo.delete!
  end

end
