defmodule Nova.Commands.ProductCommandsTest do
  use Nova.ModelCase
  alias Nova.Commands.ProductCommands
  alias Nova.Product

  @product_params Fixtures.product([]).changes

  test "create/1" do
    assert {:ok, %Product{}} = ProductCommands.create(@product_params)
  end

  test "update/2" do
    {:ok, product} = Fixtures.product([]) |> Repo.insert
    params = %{@product_params | sku: "ABC"}

    {:ok, product} = ProductCommands.update(product.id, params)

    assert %Product{} = product
    assert product.sku == "ABC"
  end

  test "delete/1" do
    {:ok, product} = Fixtures.product([]) |> Repo.insert

    assert %Product{} = ProductCommands.delete(product.id)

    refute Repo.get(Product, product.id)
  end
end
