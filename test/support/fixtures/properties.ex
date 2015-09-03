defmodule Nova.Fixtures.Properties do
  alias Nova.Repo
  alias Nova.Property

  def property(attrs) do
    params = %{
      name: "Some option value",
      display_name: "option value",
    } |> Map.merge(Enum.into(attrs, %{}))

    Property.changeset(%Property{}, params)
  end
end
