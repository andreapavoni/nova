defmodule Nova.OrderTest do
  use Nova.ModelCase

  alias Nova.Order

  @valid_attrs %{}
  @invalid_attrs %{}

  describe "changeset" do
    context "with valid attributes" do
      it "is valid" do
        assert Order.changeset(%Order{}, @valid_attrs).valid?
      end
    end
  end
end
