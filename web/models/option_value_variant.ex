defmodule Nova.OptionValueVariant do
  @moduledoc false
  use Nova.Web, :model

  schema "nova_option_value_variants" do
    belongs_to :variant, Nova.Variant
    belongs_to :option_value, Nova.OptionValue
  end

  @required_fields ~w(variant_id option_value_id)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, ~w())
    |> foreign_key_constraint(:option_value_id)
    |> foreign_key_constraint(:variant_id)
  end
end
