defmodule Nova.ProductProperty do
  use Nova.Web, :model

  schema "nova_product_properties" do
    belongs_to :product, Nova.Product
    belongs_to :property, Nova.Property

    field :value, :string
  end

  @required_fields ~w(property_id value)
  @optional_fields ~w(product_id)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> foreign_key_constraint(:product_id)
    |> foreign_key_constraint(:property_id)
    |> validate_length(:value, max: 200)
  end
end
