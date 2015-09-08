defmodule Nova.Queries.VariantQueriesTest do
  use Nova.ModelCase
  alias Nova.Queries.VariantQueries
  alias Nova.Variant
  alias Nova.OptionValueVariant

  describe "find_by_id/1" do
    context "when variant exists" do
      it "returns the variant" do
        {:ok, variant} = Fixtures.variant([]) |> Repo.insert

        assert %Variant{} = VariantQueries.find_by_id(variant.id)
      end
    end
  end

  describe "all/1" do
    it "returns a list of variants" do
      {:ok, _} = Fixtures.variant([]) |> Repo.insert

      assert [%Variant{}] = VariantQueries.all
    end
  end

  describe "with_option_value/2" do
    it "returns a list of variants with given option_value" do
      {:ok, variant} = Fixtures.variant([]) |> Repo.insert
      {:ok, option_value} = Fixtures.option_value([]) |> Repo.insert

      OptionValueVariant.changeset(
        %OptionValueVariant{},
        %{option_value_id: option_value.id, variant_id: variant.id})
      |> Repo.insert

      results = Variant
                |> VariantQueries.with_option_value(option_value)
                |> Repo.all

      assert results == [variant]
    end
  end
end
