defmodule Gcommerce.Fixtures.OptionValues do
  alias Gcommerce.OptionValue
  alias Gcommerce.Fixtures.OptionTypes
  alias Gcommerce.Repo

  def fixture(:option_value, attrs) do
    {:ok, option_type} = case attrs[:option_type_id] do
      nil -> OptionTypes.fixture(:option_type, []) |> Repo.insert
      _   -> attrs[:option_type_id]
    end


    params = %{
      name: "Some option value",
      display_name: "option value",
      option_type_id: option_type.id
    } |> Map.merge(Enum.into(attrs, %{}))

    OptionValue.changeset(%OptionValue{}, params)
  end
end
