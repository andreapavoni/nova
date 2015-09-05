defmodule Nova.Commands.VariantCommands do
  alias Nova.Variant
  alias Nova.OptionValueVariant
  alias Nova.Repo

  def create(params \\ %{}) do
    Variant.changeset(%Variant{}, params) |> Repo.insert
  end

  def update(id, params) do
    Repo.get!(Variant, id)
    |> Variant.changeset(params)
    |> Repo.update
  end

  def delete(id) do
    Repo.get!(Variant, id) |> Repo.delete!
  end

  def add_option_value(id, option_value) do
    OptionValueVariant.changeset(
      %OptionValueVariant{},
      %{option_value_id: option_value.id,variant_id: id})
    |> Repo.insert
  end

end
