defmodule Nova.Queries.VariantQueriesTest do
  use Nova.ModelCase
  alias Nova.Queries.VariantQueries
  alias Nova.Variant

  test "find_by_id/1 when variant exists" do
    {:ok, variant} = Fixtures.variant([]) |> Repo.insert

    assert %Variant{} = VariantQueries.find_by_id(variant.id)
  end

  test "all/1 when variant exists" do
    {:ok, _} = Fixtures.variant([]) |> Repo.insert

    assert [%Variant{}] = VariantQueries.all
  end

end
