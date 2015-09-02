defmodule Gcommerce.Commands.ProductCommandsTest do
  use Gcommerce.ModelCase
  alias Gcommerce.Commands.ProductCommands
  alias Gcommerce.Product

  @product_params Fixtures.product([]).changes

  test "create_product/1" do
    assert {:ok, %Product{}} = ProductCommands.create_product(@product_params)
  end

  test "update_product/2" do
    {:ok, product} = Fixtures.product([]) |> Repo.insert
    params = %{@product_params | sku: "ABC"}

    {:ok, product} = ProductCommands.update_product(product.id, params)

    assert %Product{} = product
    assert product.sku == "ABC"
  end

  test "delete_product/1" do
    {:ok, product} = Fixtures.product([]) |> Repo.insert

    assert %Product{} = ProductCommands.delete_product(product.id)

    refute Repo.get(Product, product.id)
  end
end
