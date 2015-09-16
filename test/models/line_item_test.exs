defmodule Nova.LineItemTest do
  use Nova.ModelCase
  alias Nova.LineItem

  @valid_attrs %{quantity: 2, order_id: 1, variant_id: 1}
  @invalid_attrs %{quantity: 0}

  setup do
    variant = fixtures(:variants).variants.default
    order = fixtures(:orders).orders.default
    attrs = %{
      order_id: order.id,
      variant_id: variant.id,
      quantity: 2
    }

    {:ok, attrs: attrs}
  end

  describe "changeset" do
    context "with valid attributes" do
      it "is valid" do
        assert LineItem.changeset(%LineItem{}, @valid_attrs).valid?
      end
    end

    context "with invalid attributes" do
      it "sets errors on invalid attributes" do
        changeset = LineItem.changeset(%LineItem{}, @invalid_attrs)

        refute changeset.valid?
        assert {:order_id, "can't be blank"} in changeset.errors
        assert {:variant_id, "can't be blank"} in changeset.errors
        assert {:quantity, {"must be greater than %{count}", [count: 0]}} in changeset.errors
      end

      it "does not save with non existent order", ctx do
        attrs = %{ctx.attrs | order_id: -1}
        {:error, changeset} = %LineItem{}
        |> LineItem.changeset(attrs)
        |> Repo.insert

        refute changeset.valid?
        assert {:order_id, "does not exist"} in changeset.errors
      end

      it "does not save with non existent variant", ctx do
        attrs = %{ctx.attrs | variant_id: -1}
        {:error, changeset} = %LineItem{}
        |> LineItem.changeset(attrs)
        |> Repo.insert

        refute changeset.valid?
        assert {:variant_id, "does not exist"} in changeset.errors
      end
    end
  end
end
