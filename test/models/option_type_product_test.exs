defmodule Nova.OptionTypeProductTest do
  use Nova.ModelCase
  alias Nova.OptionTypeProduct

  @attrs %{option_type_id: 1, product_id: 1}

  setup do
    product = fixtures(:products).products.default
    option_type = fixtures(:option_types).option_types.default
    attrs = %{
      option_type_id: option_type.id,
      product_id: product.id
    }

    {:ok, attrs: attrs}
  end

  describe "changeset" do
    context "with valid attributes" do
      it "is valid" do
        assert OptionTypeProduct.changeset(%OptionTypeProduct{}, @attrs).valid?
      end
    end

    context "with invalid attributes" do
      it "is not valid" do
        refute OptionTypeProduct.changeset(%OptionTypeProduct{}, %{}).valid?
      end

      it "does not save with non existent product", ctx do
        attrs = %{ctx.attrs | product_id: -1}
        {:error, changeset} = %OptionTypeProduct{}
                                |> OptionTypeProduct.changeset(attrs)
                                |> Repo.insert

        refute changeset.valid?
        assert {:product_id, "does not exist"} in changeset.errors
      end

      it "does not save with non existent option_type", ctx do
        attrs = %{ctx.attrs | option_type_id: -1}

        {:error, changeset} = %OptionTypeProduct{}
                                |> OptionTypeProduct.changeset(attrs)
                                |> Repo.insert

        refute changeset.valid?
        assert {:option_type_id, "does not exist"} in changeset.errors
      end
    end
  end
end
