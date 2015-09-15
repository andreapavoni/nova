defmodule Nova.Product do
  use Nova.Web, :model

  schema "nova_products" do
    has_many :variants, Nova.Variant, on_delete: :fetch_and_delete
    has_many :option_type_products,
      Nova.OptionTypeProduct,
      on_delete: :delete_all
    has_many :option_types, through: [:option_type_products, :option_types]

    has_many :product_properties,
      Nova.ProductProperty,
      on_delete: :delete_all
    has_many :properties, through: [:product_properties, :properties]

    field :name, :string
    field :description, :string
    field :sku, :string
    field :price, :decimal

    timestamps
  end

  @required_fields ~w(name price sku)
  @optional_fields ~w(description)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:name, min: 3, max: 200)
    |> unique_constraint(:sku)
  end
end
