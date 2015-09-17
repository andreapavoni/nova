defmodule Nova.Queries.PropertyQueries do
  @moduledoc """
  Provides functions to build queries for `Nova.Property`.
  """
  alias Nova.Property
  alias Nova.Repo

  @doc """
  Finds a property by id.
  """
  def find_by_id(id) do
    Repo.get!(Property, id)
  end

  @doc """
  Finds all properties.
  """
  def all do
    Repo.all(Property)
  end
end
