defmodule Nova.LineItemTest do
  use Nova.ModelCase
  alias Nova.LineItem

  @valid_attrs %{quantity: 2, order_id: 1, variant_id: 1}
  @invalid_attrs %{quantity: 0}

  setup do
    {:ok, order} = Fixtures.order([]) |> Repo.insert
    {:ok, variant} = Fixtures.variant([]) |> Repo.insert
    attrs = %{order_id: order.id, variant_id: variant.id, quantity: 2}

    {:ok, attrs: attrs}
  end

  test "changeset with valid attributes" do
    assert LineItem.changeset(%LineItem{}, @valid_attrs).valid?
  end

  test "changeset with invalid attributes" do
    changeset = LineItem.changeset(%LineItem{}, @invalid_attrs)

    refute changeset.valid?
    assert {:order_id, "can't be blank"} in changeset.errors
    assert {:variant_id, "can't be blank"} in changeset.errors
    assert {:quantity, {"must be greater than %{count}", [count: 0]}} in changeset.errors
  end


  test "changeset with non existent order", context do
    attrs = %{context[:attrs] | order_id: -1}
    {:error, changeset} = %LineItem{}
                            |> LineItem.changeset(attrs)
                            |> Repo.insert

    refute changeset.valid?
    assert {:order_id, "does not exist"} in changeset.errors
  end

  test "changeset with non existent variant", context do
    attrs = %{context[:attrs] | variant_id: -1}
    {:error, changeset} = %LineItem{}
                            |> LineItem.changeset(attrs)
                            |> Repo.insert

    refute changeset.valid?
    assert {:variant_id, "does not exist"} in changeset.errors
  end
end
