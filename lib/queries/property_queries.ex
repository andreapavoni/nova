defmodule Nova.Queries.PropertyQueries do
  alias Nova.Property
  alias Nova.Repo

  def find_by_id(id) do
    Repo.get!(Property, id)
  end

  def all do
    Repo.all(Property)
  end
end
