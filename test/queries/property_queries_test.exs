defmodule Nova.Queries.PropertyQueriesTest do
  use Nova.ModelCase
  alias Nova.Queries.PropertyQueries
  alias Nova.Property

  describe "find_by_id/1" do
    context "when property exists" do
      it "returns the property" do
        {:ok, property} = Fixtures.property([]) |> Repo.insert

        assert %Property{} = PropertyQueries.find_by_id(property.id)
      end
    end
  end

  describe "all/1" do
    it "returns a list of properties" do
      {:ok, _} = Fixtures.property([]) |> Repo.insert

      assert [%Property{}] = PropertyQueries.all
    end
  end

end
