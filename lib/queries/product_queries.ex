defmodule Nova.Queries.ProductQueries do
  alias Nova.Product
  alias Nova.Repo

  def find_by_id(id) do
    Repo.get!(Product, id)
  end

  def all do
    Repo.all(Product)
  end
end
