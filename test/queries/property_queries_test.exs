defmodule Gcommerce.Queries.PropertyQueriesTest do
  use Gcommerce.ModelCase
  alias Gcommerce.Queries.PropertyQueries
  alias Gcommerce.Property

  test "get_property_by_id/1 when property exists" do
    {:ok, property} = Fixtures.property([]) |> Repo.insert

    assert %Property{} = PropertyQueries.get_property_by_id(property.id)
  end

  test "get_all_propertys/1 when property exists" do
    {:ok, _} = Fixtures.property([]) |> Repo.insert

    assert [%Property{}] = PropertyQueries.get_all_propertys
  end

end
