defmodule Gcommerce.OptionValueTest do
  use Gcommerce.ModelCase

  alias Gcommerce.OptionValue

  @valid_attrs %{display_name: "some content", name: "some content", option_type_id: 1}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = OptionValue.changeset(%OptionValue{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = OptionValue.changeset(%OptionValue{}, @invalid_attrs)
    refute changeset.valid?
  end
end
