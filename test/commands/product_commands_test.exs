defmodule Nova.Commands.ProductCommandsTest do
  use Nova.ModelCase
  alias Nova.Commands.ProductCommands
  alias Nova.Product
  alias Nova.ProductProperty

  @product_params %{
    description: "some content",
    name: "some content",
    price: 120.5,
    sku: "ABC"
  }

  setup do
    product = fixtures(:products).products.base

    {:ok, product: product}
  end

  describe "create/1" do
    it "creates a new product" do
      assert {:ok, %Product{}} = ProductCommands.create(@product_params)
    end
  end

  describe "update/2" do
    it "updates the product", ctx do
      params = %{@product_params | sku: "ABC"}

      {:ok, product} = ProductCommands.update(ctx.product.id, params)

      assert %Product{} = product
      assert product.sku == "ABC"
    end
  end

  describe "delete/1" do
    it "deletes the product", ctx do
      assert %Product{} = ProductCommands.delete(ctx.product.id)
      refute Repo.get(Product, ctx.product.id)
    end
  end

  describe "add_property/3" do
    it "adds a property to the product", ctx do
      property = fixtures(:properties).properties.base

      assert {:ok, %ProductProperty{}} = ProductCommands.add_property(ctx.product.id, property.id, "a value")
    end
  end
end
