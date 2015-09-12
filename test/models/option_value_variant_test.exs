defmodule Nova.OptionValueVariantTest do
  use Nova.ModelCase
  alias Nova.OptionValueVariant

  @attrs %{option_value_id: 1, variant_id: 1}

  setup do
    %{variants: variants} = fixtures(:variants)
    %{option_values: option_values} = fixtures(:option_values)
    attrs = %{
      option_value_id: option_values.default.id,
      variant_id: variants.default.id
    }

    {:ok, attrs: attrs}
  end

  describe "changeset" do
    context "with valid attributes" do
      it "is valid" do
        assert OptionValueVariant.changeset(%OptionValueVariant{}, @attrs).valid?
      end
    end

    context "with invalid attributes" do
      it "is not valid" do
        refute OptionValueVariant.changeset(%OptionValueVariant{}, %{}).valid?
      end

      it "does not save with non existent variant", context do
        attrs = %{context[:attrs] | variant_id: -1}
        {:error, changeset} = %OptionValueVariant{}
                                |> OptionValueVariant.changeset(attrs)
                                |> Repo.insert

        refute changeset.valid?
        assert {:variant_id, "does not exist"} in changeset.errors
      end

      it "does not save with non existent option_value", context do
        attrs = %{context[:attrs] | option_value_id: -1}

        {:error, changeset} = %OptionValueVariant{}
                                |> OptionValueVariant.changeset(attrs)
                                |> Repo.insert

        refute changeset.valid?
        assert {:option_value_id, "does not exist"} in changeset.errors
      end
    end
  end
end
