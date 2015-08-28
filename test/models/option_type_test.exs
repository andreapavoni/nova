defmodule Gcommerce.OptionTypeTest do
  use Gcommerce.ModelCase
  import Gcommerce.Fixtures
  alias Gcommerce.OptionType

  @valid_attrs %{display_name: "some content", name: "some content"}
  @long_str String.duplicate("a", 201)

  test "changeset with valid attributes" do
    assert OptionType.changeset(%OptionType{}, @valid_attrs).valid?
  end

  test "changeset with invalid attributes" do
    refute OptionType.changeset(%OptionType{}, %{}).valid?
  end

  test "changeset with name not unique" do
    option_type = fixture(:option_type, name: "some name")
    option_type |> Repo.insert

    {:error, changeset} = option_type |> Repo.insert

    refute changeset.valid?
    assert {:name, "has already been taken"} in changeset.errors
  end

  test "changeset with name length shorter than 3" do
    attrs = Map.merge(@valid_attrs, %{name: "a"})
    error = {:name, {"should be at least %{count} characters", [count: 3]}}

    assert error in errors_on(%OptionType{}, attrs)
  end

  test "changeset with name length longer than 200" do
    attrs = Map.merge(@valid_attrs, %{name: @long_str})
    error = {:name, {"should be at most %{count} characters", [count: 200]}}

    assert error in errors_on(%OptionType{}, attrs)
  end

  test "changeset with display_name length shorter than 3" do
    attrs = Map.merge(@valid_attrs, %{display_name: "a"})
    error = {:display_name, {"should be at least %{count} characters", [count: 3]}}

    assert error in errors_on(%OptionType{}, attrs)
  end

  test "changeset with display_name length longer than 200" do
    attrs = Map.merge(@valid_attrs, %{display_name: @long_str})
    error = {:display_name, {"should be at most %{count} characters", [count: 200]}}

    assert error in errors_on(%OptionType{}, attrs)
  end

end
