defmodule Nova.Commands.ProductCommandsTest do
  use Nova.ModelCase
  alias Nova.Commands.ProductCommands
  alias Nova.Product
  alias Nova.ProductProperty

  setup do
    %{products: products} = fixtures(:products, insert: false)

    {:ok, product_params: Map.delete(products.default, :__struct__)}
  end

  describe "create/1" do
    it "creates a new product", ctx do
      assert {:ok, %Product{}} = ProductCommands.create(ctx[:product_params])
    end
  end

  describe "update/2" do
    it "updates the product", ctx do
      %{products: products} = fixtures(:products)
      params = %{ctx[:product_params] | sku: "ABC"}

      {:ok, product} = ProductCommands.update(products.default.id, params)

      assert %Product{} = product
      assert product.sku == "ABC"
    end
  end

  describe "delete/1" do
    it "deletes the product" do
      %{products: products} = fixtures(:products)

      assert %Product{} = ProductCommands.delete(products.default.id)
      refute Repo.get(Product, products.default.id)
    end
  end

  describe "add_property/3" do
    it "adds a property to the product" do
      %{products: products} = fixtures(:products)
      %{properties: properties} = fixtures(:properties)
      product = products.default
      property = properties.default

      assert {:ok, %ProductProperty{}} = ProductCommands.add_property(product.id, property.id, "a value")


    end
  end
end
