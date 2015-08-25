defmodule Gcommerce.OptionTypeTest do
  use Gcommerce.ModelCase

  alias Gcommerce.OptionType

  @valid_attrs %{display_name: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = OptionType.changeset(%OptionType{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = OptionType.changeset(%OptionType{}, @invalid_attrs)
    refute changeset.valid?
  end
end
