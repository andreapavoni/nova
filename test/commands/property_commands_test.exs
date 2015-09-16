defmodule Nova.Commands.PropertyCommandsTest do
  use Nova.ModelCase
  alias Nova.Commands.PropertyCommands
  alias Nova.Property

  setup do
    property = fixtures(:properties).properties.base
    {:ok, property: property}
  end

  describe "create/1" do
    it "creates a property" do
      params = %{
        name: "Some property",
        display_name: "A property"
      }

      assert {:ok, %Property{}} = PropertyCommands.create(params)
    end
  end

  describe "update/2" do
    it "updates the property", ctx do
      params = %{name: "New name"}
      {:ok, property} = PropertyCommands.update(ctx.property.id, params)

      assert %Property{} = property
      assert property.name == "New name"
    end
  end

  describe "delete/1" do
    it "deletes the property", ctx do
      assert %Property{} = PropertyCommands.delete(ctx.property.id)

      refute Repo.get(Property, ctx.property.id)
    end
  end
end
