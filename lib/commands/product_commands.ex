defmodule Nova.Commands.ProductCommands do
  alias Nova.Product
  alias Nova.Repo

  def create_product(params \\ %{}) do
    Product.changeset(%Product{}, params)
    |> Repo.insert
  end

  def update_product(id, params) do
    Repo.get!(Product, id)
    |> Product.changeset(params)
    |> Repo.update
  end

  def delete_product(id) do
    Repo.get!(Product, id)
    |> Repo.delete!
  end

end
