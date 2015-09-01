defmodule Gcommerce.LineItem do
  use Gcommerce.Web, :model

  schema "line_items" do
    field :quantity, :integer
    belongs_to :order, Gcommerce.Order
    belongs_to :variant, Gcommerce.Variant

    timestamps
  end

  @required_fields ~w(quantity order_id variant_id)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> foreign_key_constraint(:order_id)
    |> foreign_key_constraint(:variant_id)
    |> validate_number(:quantity, greater_than: 0)
  end
end
