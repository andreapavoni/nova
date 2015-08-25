defmodule Gcommerce.OptionValueTest do
  use Gcommerce.ModelCase
  alias Gcommerce.OptionValue

  @valid_attrs %{
    display_name: "some content",
    name: "some content",
    option_type_id: 1
  }
  @long_str String.duplicate("a", 201)

  test "changeset with valid attributes" do
    assert OptionValue.changeset(%OptionValue{}, @valid_attrs).valid?
  end

  test "changeset with invalid attributes" do
    refute OptionValue.changeset(%OptionValue{}, %{}).valid?
  end

  test "changeset with name length shorter than 3" do
    attrs = Map.merge(@valid_attrs, %{name: "a"})
    error = {:name, {"should be at least %{count} characters", [count: 3]}}

    assert error in errors_on(%OptionValue{}, attrs)
  end

  test "changeset with name length longer than 200" do
    attrs = Map.merge(@valid_attrs, %{name: @long_str})
    error = {:name, {"should be at most %{count} characters", [count: 200]}}

    assert error in errors_on(%OptionValue{}, attrs)
  end

  test "changeset with display_name length shorter than 3" do
    attrs = Map.merge(@valid_attrs, %{display_name: "a"})
    error = {:display_name, {"should be at least %{count} characters", [count: 3]}}

    assert error in errors_on(%OptionValue{}, attrs)
  end

  test "changeset with display_name length longer than 200" do
    attrs = Map.merge(@valid_attrs, %{display_name: @long_str})
    error = {:display_name, {"should be at most %{count} characters", [count: 200]}}

    assert error in errors_on(%OptionValue{}, attrs)
  end

end
