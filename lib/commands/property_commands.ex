defmodule Nova.Commands.PropertyCommands do
  alias Nova.Property
  alias Nova.Repo

  def create(params \\ %{}) do
    Property.changeset(%Property{}, params)
    |> Repo.insert
  end

  def update(id, params) do
    Repo.get!(Property, id)
    |> Property.changeset(params)
    |> Repo.update
  end

  def delete(id) do
    Repo.get!(Property, id)
    |> Repo.delete!
  end

end
