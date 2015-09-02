defmodule Gcommerce.Queries.PropertyQueries do
  alias Gcommerce.Property
  alias Gcommerce.Repo

  def get_property_by_id(id) do
    Repo.get!(Property, id)
  end

  def get_all_propertys do
    Repo.all(Property)
  end
end
