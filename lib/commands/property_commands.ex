defmodule Nova.Commands.PropertyCommands do
  alias Nova.Property
  alias Nova.Repo

  def create_property(params \\ %{}) do
    Property.changeset(%Property{}, params)
    |> Repo.insert
  end

  def update_property(id, params) do
    Repo.get!(Property, id)
    |> Property.changeset(params)
    |> Repo.update
  end

  def delete_property(id) do
    Repo.get!(Property, id)
    |> Repo.delete!
  end

end
