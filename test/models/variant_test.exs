defmodule Gcommerce.VariantTest do
  use Gcommerce.ModelCase
  # import Gcommerce.Fixtures

  alias Gcommerce.Variant
  # alias Gcommerce.Repo

  test "changeset with valid attributes" do
    # product = fixture(:product) |> Repo.insert!
    attrs = %{
      price: 120.5,
      sku: "some content",
      # product_id: product.id
      product_id: 1
    }
    assert Variant.changeset(%Variant{}, attrs).valid?
  end

  test "changeset with invalid attributes" do
    refute Variant.changeset(%Variant{}, %{}).valid?
    assert {:product_id, "can't be blank"} in errors_on(%Variant{}, %{})
  end

  # can't find a way to validate the existence of foreign key
  @tag :pending
  test "changeset with non existent product" do
    attrs = %{
      price: 120.5,
      sku: "some content",
      product_id: -1 # some non-existent id?
    }
    refute Variant.changeset(%Variant{}, attrs).valid?
    assert {:product_id, "does not exist"} in errors_on(%Variant{}, %{})
  end
end
