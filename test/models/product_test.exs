defmodule Gcommerce.ProductTest do
  use Gcommerce.ModelCase

  alias Gcommerce.Product

  @valid_attrs %{
    description: "some content",
    name: "some content",
    price: "120.5",
    sku: "some content",
    slug: "some content"
  }

  test "changeset with valid attributes" do
    assert Product.changeset(%Product{}, @valid_attrs).valid?
  end

  test "changeset with invalid attributes" do
    refute Product.changeset(%Product{}, %{}).valid?
  end

  test "changeset with name length shorter than 3" do
    attrs = Map.merge(@valid_attrs, %{name: "a"})
    error = {:name, {"should be at least %{count} characters", [count: 3]}}

    assert error in errors_on(%Product{}, attrs)
  end

  test "changeset with name length longer than 200" do
    attrs = Map.merge(@valid_attrs, %{name: String.duplicate("a", 201)})
    error = {:name, {"should be at most %{count} characters", [count: 200]}}

    assert error in errors_on(%Product{}, attrs)
  end
end
