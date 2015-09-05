defmodule Nova.Commands.PropertyCommandsTest do
  use Nova.ModelCase
  alias Nova.Commands.PropertyCommands
  alias Nova.Property

  @property_params Fixtures.property([]).changes

  test "create/1" do
    assert {:ok, %Property{}} = PropertyCommands.create(@property_params)
  end

  test "update/2" do
    {:ok, property} = Fixtures.property([]) |> Repo.insert
    params = %{@property_params | name: "New name"}

    {:ok, property} = PropertyCommands.update(property.id, params)

    assert %Property{} = property
    assert property.name == "New name"
  end

  test "delete/1" do
    {:ok, property} = Fixtures.property([]) |> Repo.insert

    assert %Property{} = PropertyCommands.delete(property.id)

    refute Repo.get(Property, property.id)
  end
end
