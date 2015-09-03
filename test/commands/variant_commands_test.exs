defmodule Nova.Commands.VariantCommandsTest do
  use Nova.ModelCase
  alias Nova.Commands.VariantCommands
  alias Nova.Variant

  setup do
    {:ok, product} = Fixtures.product([]) |> Repo.insert
    {:ok, variant} = Fixtures.variant(product_id: product.id) |> Repo.insert

    {:ok, product: product, variant: variant}
  end

  test "create_variant/1" do
    params = Fixtures.variant([]).changes
    assert {:ok, %Variant{}} = VariantCommands.create_variant(params)
  end

  test "update_variant/2", context do
    {:ok, variant} = VariantCommands.update_variant(context[:variant].id, %{sku: "ABC"})

    assert %Variant{} = variant
    assert variant.sku == "ABC"
  end

  test "delete_variant/1", context do
    assert %Variant{} = VariantCommands.delete_variant(context[:variant].id)

    refute Repo.get(Variant, context[:variant].id)
  end
end
