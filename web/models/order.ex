defmodule Nova.Order do
  @moduledoc """
  Represents the order made by customers.
  """
  use Nova.Web, :model

  schema "nova_orders" do
    has_many :line_items, Nova.LineItem # on_delete?

    field :total, :decimal, default: Decimal.new(0.0)

    timestamps
  end

  @required_fields ~w()
  @optional_fields ~w(total)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ %{total: Decimal.new(0.0)}) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
