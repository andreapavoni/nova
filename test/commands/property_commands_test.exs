defmodule Gcommerce.Commands.PropertyCommandsTest do
  use Gcommerce.ModelCase
  alias Gcommerce.Commands.PropertyCommands
  alias Gcommerce.Property

  @property_params Fixtures.property([]).changes

  test "create_property/1" do
    assert {:ok, %Property{}} = PropertyCommands.create_property(@property_params)
  end

  test "update_property/2" do
    {:ok, property} = Fixtures.property([]) |> Repo.insert
    params = %{@property_params | name: "New name"}

    {:ok, property} = PropertyCommands.update_property(property.id, params)

    assert %Property{} = property
    assert property.name == "New name"
  end

  test "delete_property/1" do
    {:ok, property} = Fixtures.property([]) |> Repo.insert

    assert %Property{} = PropertyCommands.delete_property(property.id)

    refute Repo.get(Property, property.id)
  end
end
