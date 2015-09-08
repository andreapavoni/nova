defmodule Nova.Commands.ProductCommandsTest do
  use Nova.ModelCase
  alias Nova.Commands.ProductCommands
  alias Nova.Product

  @product_params Fixtures.product([]).changes

  describe "create/1" do
    it "creates a new product" do
      assert {:ok, %Product{}} = ProductCommands.create(@product_params)
    end
  end

  describe "update/2" do
    it "updates the product" do
      {:ok, product} = Fixtures.product([]) |> Repo.insert
      params = %{@product_params | sku: "ABC"}

      {:ok, product} = ProductCommands.update(product.id, params)

      assert %Product{} = product
      assert product.sku == "ABC"
    end
  end

  describe "delete/1" do
    it "deletes the product" do
      {:ok, product} = Fixtures.product([]) |> Repo.insert

      assert %Product{} = ProductCommands.delete(product.id)

      refute Repo.get(Product, product.id)
    end
  end
end
