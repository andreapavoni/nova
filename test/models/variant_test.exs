defmodule Gcommerce.VariantTest do
  use Gcommerce.ModelCase
  alias Gcommerce.Variant
  alias Gcommerce.Repo
  alias Gcommerce.Fixtures

  @valid_attrs %{
    price: 120.5,
    sku: "some content",
    product_id: 1
  }

  test "changeset with valid attributes" do
    assert Variant.changeset(%Variant{}, @valid_attrs).valid?
  end

  test "changeset with invalid attributes" do
    changeset = Variant.changeset(%Variant{}, %{})

    refute changeset.valid?
    assert {:product_id, "can't be blank"} in changeset.errors
  end

  test "changeset with non existent product" do
    attrs = %{@valid_attrs | product_id: -1}
    {:error, changeset} = Variant.changeset(%Variant{}, attrs) |> Repo.insert

    refute changeset.valid?
    assert {:product_id, "does not exist"} in changeset.errors
  end

  test "changeset with sku not unique" do
    variant = Fixtures.variant(sku: "ABC")

    variant |> Repo.insert

    {:error, changeset} = variant |> Repo.insert

    refute changeset.valid?
    assert {:sku, "has already been taken"} in changeset.errors
  end
end
