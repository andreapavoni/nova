defmodule Nova.VariantTest do
  use Nova.ModelCase
  alias Nova.Variant
  alias Nova.Repo

  @valid_attrs %{
    price: 120.5,
    sku: "some content",
    product_id: 1
  }

  describe "changeset" do
    context "with valid attributes" do
      it "is valid" do
        assert Variant.changeset(%Variant{}, @valid_attrs).valid?
      end
    end

    context "with invalid attributes" do
      it "is not valid" do
        refute Variant.changeset(%Variant{}, %{}).valid?
      end

      it "does not save with non existent product" do
        attrs = %{@valid_attrs | product_id: -1}
        {:error, changeset} = Variant.changeset(%Variant{}, attrs) |> Repo.insert

        refute changeset.valid?
        assert {:product_id, "does not exist"} in changeset.errors
      end

      it "does not save with sku not unique" do
        variant = Fixtures.variant(sku: "ABC")

        variant |> Repo.insert

        {:error, changeset} = variant |> Repo.insert

        refute changeset.valid?
        assert {:sku, "has already been taken"} in changeset.errors
      end
    end
  end
end
