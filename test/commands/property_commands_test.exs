defmodule Nova.Commands.PropertyCommandsTest do
  use Nova.ModelCase
  alias Nova.Commands.PropertyCommands
  alias Nova.Property

  @property_params Fixtures.property([]).changes

  describe "create/1" do
    it "creates a property" do
      assert {:ok, %Property{}} = PropertyCommands.create(@property_params)
    end
  end

  describe "update/2" do
    it "updates the property" do
      {:ok, property} = Fixtures.property([]) |> Repo.insert
      params = %{@property_params | name: "New name"}

      {:ok, property} = PropertyCommands.update(property.id, params)

      assert %Property{} = property
      assert property.name == "New name"
    end
  end

  describe "delete/1" do
    it "deletes the property" do
      {:ok, property} = Fixtures.property([]) |> Repo.insert

      assert %Property{} = PropertyCommands.delete(property.id)

      refute Repo.get(Property, property.id)
    end
  end
end
