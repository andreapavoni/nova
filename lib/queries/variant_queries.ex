defmodule Nova.Queries.VariantQueries do
  alias Nova.Variant
  alias Nova.Repo

  def find_by_id(id) do
    Repo.get!(Variant, id)
  end

  def all do
    Repo.all(Variant)
  end

end
