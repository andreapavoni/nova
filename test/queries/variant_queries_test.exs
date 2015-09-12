defmodule Nova.Queries.VariantQueriesTest do
  use Nova.ModelCase
  alias Nova.Queries.VariantQueries
  alias Nova.Variant
  alias Nova.OptionValueVariant

  setup do
    %{variants: variants} = fixtures(:variants)
    %{option_values: option_values} = fixtures(:option_values)

    {:ok, variant: variants.default, option_value: option_values.default}
  end

  describe "find_by_id/1" do
    context "when variant exists" do
      it "returns the variant", ctx do
        assert %Variant{} = VariantQueries.find_by_id(ctx[:variant].id)
      end
    end
  end

  describe "all/1" do
    it "returns a list of variants" do
      assert [%Variant{}] = VariantQueries.all
    end
  end

  describe "with_option_value/2" do
    it "returns a list of variants with given option_value", ctx do
      OptionValueVariant.changeset(
        %OptionValueVariant{},
        %{option_value_id: ctx[:option_value].id, variant_id: ctx[:variant].id})
      |> Repo.insert

      results = Variant
                |> VariantQueries.with_option_value(ctx[:option_value])
                |> Repo.all

      assert results == [ctx[:variant]]
    end
  end
end
