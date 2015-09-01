defmodule Gcommerce.ProductPropertyTest do
  use Gcommerce.ModelCase
  alias Gcommerce.ProductProperty

  @valid_attrs %{property_id: 1, value: "test"}
  @invalid_attrs %{property_id: -1, product_id: -1, value: "test" }
  @long_str String.duplicate("a", 201)

  setup do
    {:ok, property} = Fixtures.property([]) |> Repo.insert
    {:ok, product} = Fixtures.product([]) |> Repo.insert
    attrs = %{property_id: property.id, product_id: product.id, value: "test"}

    {:ok, attrs: attrs}
  end

  test "changeset with valid attributes" do
    assert ProductProperty.changeset(%ProductProperty{}, @valid_attrs).valid?
  end

  test "changeset with invalid attributes" do
    refute ProductProperty.changeset(%ProductProperty{}, %{}).valid?
  end

  test "changeset with value length longer than 200" do
    attrs = Map.merge(@valid_attrs, %{value: @long_str})
    error = {:value, {"should be at most %{count} characters", [count: 200]}}

    assert error in errors_on(%ProductProperty{}, attrs)
  end

  test "changeset with non existent product", context do
    attrs = %{context[:attrs] | product_id: -1}
    {:error, changeset} = %ProductProperty{}
                            |> ProductProperty.changeset(attrs)
                            |> Repo.insert

    refute changeset.valid?
    assert {:product_id, "does not exist"} in changeset.errors
  end

  test "changeset with non existent property", context do
    attrs = %{context[:attrs] | property_id: -1}
    {:error, changeset} = %ProductProperty{}
                            |> ProductProperty.changeset(attrs)
                            |> Repo.insert

    refute changeset.valid?
    assert {:property_id, "does not exist"} in changeset.errors
  end
end
