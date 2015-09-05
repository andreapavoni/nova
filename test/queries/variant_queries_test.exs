defmodule Nova.Queries.VariantQueriesTest do
  use Nova.ModelCase
  alias Nova.Queries.VariantQueries
  alias Nova.Variant
  alias Nova.OptionValueVariant

  test "find_by_id/1 when variant exists" do
    {:ok, variant} = Fixtures.variant([]) |> Repo.insert

    assert %Variant{} = VariantQueries.find_by_id(variant.id)
  end

  test "all/1 when variant exists" do
    {:ok, _} = Fixtures.variant([]) |> Repo.insert

    assert [%Variant{}] = VariantQueries.all
  end

  test "with_option_value/2" do
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
