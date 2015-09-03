defmodule Nova.OptionValueVariantTest do
  use Nova.ModelCase
  alias Nova.OptionValueVariant

  @attrs %{option_value_id: 1, variant_id: 1}

  setup do
    {:ok, variant} = Fixtures.variant(sku: "ABC") |> Repo.insert
    {:ok, option_value} = Fixtures.option_value([]) |> Repo.insert

    {:ok, attrs: %{option_value_id: option_value.id, variant_id: variant.id}}
  end

  test "changeset with valid attributes" do
    assert OptionValueVariant.changeset(%OptionValueVariant{}, @attrs).valid?
  end

  test "changeset with invalid attributes" do
    refute OptionValueVariant.changeset(%OptionValueVariant{}, %{}).valid?
  end

  test "changeset with non existent variant", context do
    attrs = %{context[:attrs] | variant_id: -1}
    {:error, changeset} = %OptionValueVariant{}
                            |> OptionValueVariant.changeset(attrs)
                            |> Repo.insert

    refute changeset.valid?
    assert {:variant_id, "does not exist"} in changeset.errors
  end

  test "changeset with non existent option_value", context do
    attrs = %{context[:attrs] | option_value_id: -1}

    {:error, changeset} = %OptionValueVariant{}
                            |> OptionValueVariant.changeset(attrs)
                            |> Repo.insert

    refute changeset.valid?
    assert {:option_value_id, "does not exist"} in changeset.errors
  end
end
