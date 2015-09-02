defmodule Gcommerce.Variant do
  use Gcommerce.Web, :model

  schema "gcommerce_variants" do
    belongs_to :product, Gcommerce.Product
    has_many :option_value_variants,
      Gcommerce.OptionValueVariant,
      on_delete: :delete_all
    has_many :option_values, through: [:option_value_variants, :option_values]
    has_many :line_items, Gcommerce.LineItem # on_delete?

    field :sku, :string
    field :price, :decimal

    timestamps
  end

  @required_fields ~w(product_id)
  @optional_fields ~w(sku price)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> foreign_key_constraint(:product_id)
    |> unique_constraint(:sku)
  end
end
