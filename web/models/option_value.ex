defmodule Gcommerce.OptionValue do
  use Gcommerce.Web, :model

  schema "option_values" do
    field :name, :string
    field :display_name, :string

    belongs_to :option_type, Gcommerce.OptionType

    timestamps
  end

  @required_fields ~w(name display_name option_type_id)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:name, min: 3, max: 200)
    |> validate_length(:display_name, min: 3, max: 200)
  end
end
