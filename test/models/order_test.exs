defmodule Nova.OrderTest do
  use Nova.ModelCase

  alias Nova.Order

  @valid_attrs %{total: "120.5"}
  @invalid_attrs %{}

  describe "changeset" do
    context "with valid attributes" do
      it "is valid" do
        assert Order.changeset(%Order{}, @valid_attrs).valid?
      end
    end

    context "with invalid attributes" do
      it "is not valid" do
        refute Order.changeset(%Order{}, @invalid_attrs).valid?
      end
    end
  end
end
