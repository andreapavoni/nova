defmodule Nova.PropertyTest do
  use Nova.ModelCase

  alias Nova.Property

  @valid_attrs %{display_name: "some content", name: "some content"}
  @long_str String.duplicate("a", 201)

  describe "changeset" do
    context "with valid attributes" do
      it "is valid" do
        assert Property.changeset(%Property{}, @valid_attrs).valid?
      end
    end

    context "with invalid attributes" do
      it "is not valid" do
        refute Property.changeset(%Property{}, %{}).valid?
      end

      it "is not valid with name length shorter than 3" do
        attrs = Map.merge(@valid_attrs, %{name: "a"})
        error = {:name, {"should be at least %{count} characters", [count: 3]}}

        assert error in errors_on(%Property{}, attrs)
      end

      it "is not valid with name length longer than 200" do
        attrs = Map.merge(@valid_attrs, %{name: @long_str})
        error = {:name, {"should be at most %{count} characters", [count: 200]}}

        assert error in errors_on(%Property{}, attrs)
      end

      it "is not valid with display_name length shorter than 3" do
        attrs = Map.merge(@valid_attrs, %{display_name: "a"})
        error = {:display_name, {"should be at least %{count} characters", [count: 3]}}

        assert error in errors_on(%Property{}, attrs)
      end

      it "is not valid with display_name length longer than 200" do
        attrs = Map.merge(@valid_attrs, %{display_name: @long_str})
        error = {:display_name, {"should be at most %{count} characters", [count: 200]}}

        assert error in errors_on(%Property{}, attrs)
      end
    end
  end
end
