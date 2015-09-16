defmodule Nova.OptionValueVariantTest do
  use Nova.ModelCase
  alias Nova.OptionValueVariant

  @attrs %{option_value_id: 1, variant_id: 1}

  setup do
    variant = fixtures(:variants).variants.base
    option_value = fixtures(:option_values).option_values.base
    attrs = %{
      option_value_id: option_value.id,
      variant_id: variant.id
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

      it "does not save with non existent variant", ctx do
        attrs = %{ctx.attrs | variant_id: -1}
        {:error, changeset} = %OptionValueVariant{}
                                |> OptionValueVariant.changeset(attrs)
                                |> Repo.insert

        refute changeset.valid?
        assert {:variant_id, "does not exist"} in changeset.errors
      end

      it "does not save with non existent option_value", ctx do
        attrs = %{ctx.attrs | option_value_id: -1}

        {:error, changeset} = %OptionValueVariant{}
                                |> OptionValueVariant.changeset(attrs)
                                |> Repo.insert

        refute changeset.valid?
        assert {:option_value_id, "does not exist"} in changeset.errors
      end
    end
  end
end
