defmodule Nova.LineItem do
  @moduledoc """
  Represents a line item contained in a `Nova.Order`.
  """
  use Nova.Web, :model

  schema "nova_line_items" do
    belongs_to :order, Nova.Order
    belongs_to :variant, Nova.Variant

    field :quantity, :integer
    field :total, :decimal, default: Decimal.new(0.0)

    timestamps
  end

  @required_fields ~w(quantity order_id variant_id)
  @optional_fields ~w(total)

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
