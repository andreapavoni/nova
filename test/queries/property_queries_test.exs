defmodule Nova.Queries.PropertyQueriesTest do
  use Nova.ModelCase
  alias Nova.Queries.PropertyQueries
  alias Nova.Property

  test "get_property_by_id/1 when property exists" do
    {:ok, property} = Fixtures.property([]) |> Repo.insert

    assert %Property{} = PropertyQueries.get_property_by_id(property.id)
  end

  test "get_all_properties/1 when property exists" do
    {:ok, _} = Fixtures.property([]) |> Repo.insert

    assert [%Property{}] = PropertyQueries.get_all_properties
  end

end
