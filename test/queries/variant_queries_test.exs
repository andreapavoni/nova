defmodule Nova.Queries.VariantQueriesTest do
  use Nova.ModelCase
  alias Nova.Queries.VariantQueries
  alias Nova.Variant

  test "get_variant_by_id/1 when variant exists" do
    {:ok, variant} = Fixtures.variant([]) |> Repo.insert

    assert %Variant{} = VariantQueries.get_variant_by_id(variant.id)
  end

  test "get_all_variants/1 when variant exists" do
    {:ok, _} = Fixtures.variant([]) |> Repo.insert

    assert [%Variant{}] = VariantQueries.get_all_variants
  end

end
