defmodule Gcommerce.OrderTest do
  use Gcommerce.ModelCase

  alias Gcommerce.Order

  @valid_attrs %{total: "120.5"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Order.changeset(%Order{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Order.changeset(%Order{}, @invalid_attrs)
    refute changeset.valid?
  end
end
