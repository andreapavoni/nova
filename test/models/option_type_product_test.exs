defmodule Nova.OptionTypeProductTest do
  use Nova.ModelCase
  alias Nova.OptionTypeProduct

  @attrs %{option_type_id: 1, product_id: 1}

  setup do
    {:ok, product} = Fixtures.product(sku: "ABC") |> Repo.insert
    {:ok, option_type} = Fixtures.option_type([]) |> Repo.insert

    {:ok, attrs: %{option_type_id: option_type.id, product_id: product.id}}
  end

  test "changeset with valid attributes" do
    assert OptionTypeProduct.changeset(%OptionTypeProduct{}, @attrs).valid?
  end

  test "changeset with invalid attributes" do
    refute OptionTypeProduct.changeset(%OptionTypeProduct{}, %{}).valid?
  end

  test "changeset with non existent product", context do
    attrs = %{context[:attrs] | product_id: -1}
    {:error, changeset} = %OptionTypeProduct{}
                            |> OptionTypeProduct.changeset(attrs)
                            |> Repo.insert

    refute changeset.valid?
    assert {:product_id, "does not exist"} in changeset.errors
  end

  test "changeset with non existent option_type", context do
    attrs = %{context[:attrs] | option_type_id: -1}

    {:error, changeset} = %OptionTypeProduct{}
                            |> OptionTypeProduct.changeset(attrs)
                            |> Repo.insert

    refute changeset.valid?
    assert {:option_type_id, "does not exist"} in changeset.errors
  end
end
