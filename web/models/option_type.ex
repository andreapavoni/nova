defmodule Gcommerce.OptionType do
  use Gcommerce.Web, :model

  schema "option_types" do
    field :name, :string
    field :display_name, :string

    timestamps
  end

  @required_fields ~w(name display_name)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
