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

  test "create/1" do
    params = Fixtures.variant([]).changes
    assert {:ok, %Variant{}} = VariantCommands.create(params)
  end

  test "update/2", context do
    {:ok, variant} = VariantCommands.update(context[:variant].id, %{sku: "ABC"})

    assert %Variant{} = variant
    assert variant.sku == "ABC"
  end

  test "delete/1", context do
    assert %Variant{} = VariantCommands.delete(context[:variant].id)

    refute Repo.get(Variant, context[:variant].id)
  end

  test "add_option_value/2" do
    {:ok, variant} = Fixtures.variant([]) |> Repo.insert
    {:ok, option_value} = Fixtures.option_value([]) |> Repo.insert

    {:ok, result} = VariantCommands.add_option_value(variant.id, option_value)
    assert %OptionValueVariant{} = result
  end
end
