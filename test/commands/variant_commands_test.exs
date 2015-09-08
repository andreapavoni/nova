defmodule Nova.Commands.VariantCommandsTest do
  use Nova.ModelCase
  alias Nova.Commands.VariantCommands
  alias Nova.Variant
  alias Nova.OptionValueVariant

  setup do
    {:ok, product} = Fixtures.product([]) |> Repo.insert
    {:ok, variant} = Fixtures.variant(product_id: product.id) |> Repo.insert

    {:ok, product: product, variant: variant}
  end

  describe "create/1" do
    it "creates a variant" do
      params = Fixtures.variant([]).changes
      assert {:ok, %Variant{}} = VariantCommands.create(params)
    end
  end

  describe "update/2" do
    it "updates the variant", context do
      {:ok, variant} = VariantCommands.update(context[:variant].id, %{sku: "ABC"})

      assert %Variant{} = variant
      assert variant.sku == "ABC"
    end
  end

  describe "delete/1" do
    it "deletes the variant", context do
      assert %Variant{} = VariantCommands.delete(context[:variant].id)

      refute Repo.get(Variant, context[:variant].id)
    end
  end

  describe "add_option_values/2" do
    it "adds given option_values to the variant" do
      {:ok, variant} = Fixtures.variant([]) |> Repo.insert
      {:ok, optval} = Fixtures.option_value([]) |> Repo.insert
      {:ok, optval2} = Fixtures.option_value([]) |> Repo.insert

      result = VariantCommands.add_option_values(variant.id, [optval, optval2])
      assert [ok: _, ok: _] = result
    end
  end
end
