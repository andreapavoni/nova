defmodule Nova.Queries.PropertyQueries do
  alias Nova.Property
  alias Nova.Repo

  def get_property_by_id(id) do
    Repo.get!(Property, id)
  end

  def get_all_properties do
    Repo.all(Property)
  end
end
