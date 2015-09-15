defmodule Nova.Commands.VariantCommandsTest do
  use Nova.ModelCase
  alias Nova.Commands.VariantCommands
  alias Nova.Variant
  alias Nova.Product

  setup do
    %{variants: variants} = fixtures(:variants)
    {:ok, variant: variants.default}
  end

  describe "create/1" do
    it "creates a variant", ctx do
      params = %{
        price: 120.5,
        sku: "SKU-ABC",
        product_id: ctx[:variant].product_id
      }
      assert {:ok, %Variant{}} = VariantCommands.create(params)
    end

    it "inherits price from product if not provided", ctx do
      params = %{
        sku: "SKU-ABC",
        product_id: ctx[:variant].product_id
      }
      product = Repo.get!(Product, ctx[:variant].product_id)

      assert {:ok, variant} = VariantCommands.create(params)
      assert %Variant{} = variant
      assert product.price == variant.price
    end
  end

  describe "update/2" do
    it "updates the variant", ctx do
      {:ok, variant} = VariantCommands.update(ctx[:variant].id, %{sku: "ABC"})

      assert %Variant{} = variant
      assert variant.sku == "ABC"
    end
  end

  describe "delete/1" do
    it "deletes the variant", ctx do
      assert %Variant{} = VariantCommands.delete(ctx[:variant].id)

      refute Repo.get(Variant, ctx[:variant].id)
    end
  end

  describe "add_option_values/2" do
    it "adds given option_values to the variant", ctx do
      %{option_values: optvals} = fixtures(:option_values)

      result = VariantCommands.add_option_values(ctx[:variant].id, [optvals.default, optvals.another])
      assert [ok: _, ok: _] = result
    end
  end
end
