defmodule Nova.Queries.OrderQueries do
  alias Nova.Order
  alias Nova.Repo

  def find_by_id(id) do
    Repo.get!(Order, id)
  end

  def all do
    Repo.all(Order)
  end
end
