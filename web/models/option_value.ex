defmodule Gcommerce.OptionValue do
  use Gcommerce.Web, :model

  schema "gcommerce_option_values" do
    belongs_to :option_type, Gcommerce.OptionType
    has_many :option_value_variants,
      Gcommerce.OptionValueVariant,
      on_delete: :delete_all
    has_many :variants, through: [:option_value_variants, :variants]

    field :name, :string
    field :display_name, :string

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
    |> unique_constraint(:name, name: :gcommerce_option_values_name_option_type_id_index)
    |> validate_length(:display_name, min: 3, max: 200)
    |> foreign_key_constraint(:option_type_id)
  end
end
