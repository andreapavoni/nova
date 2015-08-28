defmodule Gcommerce.VariantOptionTypeTest do
  use Gcommerce.ModelCase
  alias Gcommerce.VariantOptionType

  import Gcommerce.Fixtures

  @attrs %{option_type_id: 1, variant_id: 1}

  setup do
    {:ok, variant} = fixture(:variant, []) |> Repo.insert
    {:ok, option_type} = fixture(:option_type, []) |> Repo.insert

    {:ok, attrs: %{option_type_id: option_type.id, variant_id: variant.id}}
  end

  test "changeset with valid attributes" do
    assert VariantOptionType.changeset(%VariantOptionType{}, @attrs).valid?
  end

  test "changeset with invalid attributes" do
    refute VariantOptionType.changeset(%VariantOptionType{}, %{}).valid?
  end

  test "changeset with non existent variant", context do
    attrs = %{context[:attrs] | variant_id: -1}
    {:error, changeset} = %VariantOptionType{}
                            |> VariantOptionType.changeset(attrs)
                            |> Repo.insert

    refute changeset.valid?
    assert {:variant_id, "does not exist"} in changeset.errors
  end

  test "changeset with non existent option_type", context do
    attrs = %{context[:attrs] | option_type_id: -1}

    {:error, changeset} = %VariantOptionType{}
                            |> VariantOptionType.changeset(attrs)
                            |> Repo.insert

    refute changeset.valid?
    assert {:option_type_id, "does not exist"} in changeset.errors
  end
end
