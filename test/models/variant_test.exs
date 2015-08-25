defmodule Gcommerce.VariantTest do
  use Gcommerce.ModelCase

  alias Gcommerce.Variant

  @valid_attrs %{price: "120.5", sku: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Variant.changeset(%Variant{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Variant.changeset(%Variant{}, @invalid_attrs)
    refute changeset.valid?
  end
end
