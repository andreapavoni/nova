defmodule Nova.Queries.PropertyQueriesTest do
  use Nova.ModelCase
  alias Nova.Queries.PropertyQueries
  alias Nova.Property

  setup do
    property = fixtures(:properties).properties.base

    {:ok, property: property}
  end

  describe "find_by_id/1" do
    context "when property exists" do
      it "returns the property", ctx do
        assert %Property{} = PropertyQueries.find_by_id(ctx.property.id)
      end
    end
  end

  describe "all/1" do
    it "returns a list of properties" do
      assert [%Property{}] = PropertyQueries.all
    end
  end

end
