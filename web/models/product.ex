defmodule Gcommerce.Product do
  use Gcommerce.Web, :model

  schema "products" do
    field :name, :string
    field :slug, :string
    field :description, :string
    field :sku, :string
    field :price, :decimal

    has_many :variants, Gcommerce.Variant

    timestamps
  end

  @required_fields ~w(name)
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
  end
end
