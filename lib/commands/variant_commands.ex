defmodule Nova.Commands.VariantCommands do
  alias Nova.Variant
  alias Nova.Repo

  def create_variant(params \\ %{}) do
    Variant.changeset(%Variant{}, params)
    |> Repo.insert
  end

  def update_variant(id, params) do
    Repo.get!(Variant, id)
    |> Variant.changeset(params)
    |> Repo.update
  end

  def delete_variant(id) do
    Repo.get!(Variant, id)
    |> Repo.delete!
  end

end
