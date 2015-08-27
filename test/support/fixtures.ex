defmodule Gcommerce.Fixtures do
  alias Gcommerce.Repo
  alias Gcommerce.Product
  alias Gcommerce.Variant
  alias Gcommerce.OptionType

  def fixture(:product, attrs) do
    params = %{
      name: "some name",
      description: "some desc",
      price: 10.0,
      sku: "SKU-#{random}"
    } |> Map.merge(Enum.into(attrs, %{}))

    Product.changeset(%Product{}, params)
  end

  def fixture(:variant, attrs) do
    {:ok, product} = case attrs[:product_id] do
      nil ->
        fixture(:product, []) |> Repo.insert
      _   ->
        attrs[:product_id]
    end

    params = %{
      price: 120.5,
      sku: "SKUV",
      product_id: product.id
    } |> Map.merge(Enum.into(attrs, %{}))

    Variant.changeset(%Variant{}, params)
  end

  def fixture(:option_type, attrs) do
    params = %{
      name: "Some option type",
      display_name: "option type",
    } |> Map.merge(Enum.into(attrs, %{}))

    OptionType.changeset(%OptionType{}, params)
  end

  defp random(max \\ 999999999999999999) do
    :random.seed(:erlang.now)
    :random.uniform(max)
  end

end
