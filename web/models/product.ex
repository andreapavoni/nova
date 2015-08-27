defmodule Gcommerce.Product do
  use Gcommerce.Web, :model

  schema "products" do
    field :name, :string
    field :description, :string
    field :sku, :string
    field :price, :decimal

    has_many :variants, Gcommerce.Variant, on_delete: :delete_all

    timestamps
  end

  @required_fields ~w(name)
  @optional_fields ~w(sku description price)

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
