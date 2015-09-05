defmodule Nova.Queries.PropertyQueriesTest do
  use Nova.ModelCase
  alias Nova.Queries.PropertyQueries
  alias Nova.Property

  test "find_by_id/1 when property exists" do
    {:ok, property} = Fixtures.property([]) |> Repo.insert

    assert %Property{} = PropertyQueries.find_by_id(property.id)
  end

  test "all/1 when property exists" do
    {:ok, _} = Fixtures.property([]) |> Repo.insert

    assert [%Property{}] = PropertyQueries.all
  end

end
