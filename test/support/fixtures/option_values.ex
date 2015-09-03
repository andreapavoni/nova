defmodule Nova.Fixtures.OptionValues do
  alias Nova.OptionValue
  alias Nova.Fixtures.OptionTypes
  alias Nova.Repo

  def option_value(attrs) do
    option_type_id = case attrs[:option_type_id] do
      nil ->
        {:ok, option_type} = OptionTypes.option_type([]) |> Repo.insert
        option_type.id
      _   ->
        attrs[:option_type_id]
    end

    params = %{
      name: "Some option value",
      display_name: "option value",
      option_type_id: option_type_id
    } |> Map.merge(Enum.into(attrs, %{}))

    OptionValue.changeset(%OptionValue{}, params)
  end
end
