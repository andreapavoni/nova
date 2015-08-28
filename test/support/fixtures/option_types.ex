defmodule Gcommerce.Fixtures.OptionTypes do
  alias Gcommerce.OptionType

  def fixture(:option_type, attrs) do
    params = %{
      name: "Some option type",
      display_name: "option type",
    } |> Map.merge(Enum.into(attrs, %{}))

    OptionType.changeset(%OptionType{}, params)
  end
end
