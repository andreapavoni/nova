defmodule Gcommerce.Order do
  use Gcommerce.Web, :model

  schema "orders" do
    field :total, :decimal

    timestamps
  end

  @required_fields ~w(total)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
