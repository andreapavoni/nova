defmodule Gcommerce.Variant do
  use Gcommerce.Web, :model

  schema "variants" do
    field :sku, :string
    field :price, :decimal

    belongs_to :product, Gcommerce.Product

    timestamps
  end

  @required_fields ~w(product_id)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> foreign_key_constraint(:product_id)
  end
end
