defmodule Nova.OptionValueTest do
  use Nova.ModelCase
  alias Nova.OptionValue

  @valid_attrs %{
    display_name: "some content",
    name: "some content",
    option_type_id: 1
  }
  @long_str String.duplicate("a", 201)
  @min_length [count: 3]
  @max_length [count: 200]

  describe "changeset" do
    context "with valid attributes" do
      it "is valid" do
        assert OptionValue.changeset(%OptionValue{}, @valid_attrs).valid?
      end
    end

    context "with invalid attributes" do
      it "is not valid" do
        refute OptionValue.changeset(%OptionValue{}, %{}).valid?
      end

      it "is not valid with name length shorter than 3" do
        attrs = Map.merge(@valid_attrs, %{name: "a"})
        error = {:name, {"should be at least %{count} characters", @min_length}}

        assert error in errors_on(%OptionValue{}, attrs)
      end

      it "is not valid with name length longer than 200" do
        attrs = Map.merge(@valid_attrs, %{name: @long_str})
        error = {:name, {"should be at most %{count} characters", @max_length}}

        assert error in errors_on(%OptionValue{}, attrs)
      end

      it "is not valid with display_name length shorter than 3" do
        attrs = Map.merge(@valid_attrs, %{display_name: "a"})
        error = {:display_name, {"should be at least %{count} characters", @min_length}}

        assert error in errors_on(%OptionValue{}, attrs)
      end

      it "is not valid with display_name length longer than 200" do
        attrs = Map.merge(@valid_attrs, %{display_name: @long_str})
        error = {:display_name, {"should be at most %{count} characters", @max_length}}

        assert error in errors_on(%OptionValue{}, attrs)
      end

      it "does not save with non existent option_type" do
        attrs = %{@valid_attrs | option_type_id: -1}
        {:error, changeset} = OptionValue.changeset(%OptionValue{}, attrs) |> Repo.insert

        refute changeset.valid?
        assert {:option_type_id, "does not exist"} in changeset.errors
      end

      it "does not save with name not unique on option_type" do
        option_value = fixtures(:option_values).option_values.base

        attrs = Map.merge(@valid_attrs, %{
          option_type_id: option_value.option_type_id,
          name: option_value.name
        })

        {:error, changeset} = OptionValue.changeset(%OptionValue{}, attrs) |> Repo.insert

        refute changeset.valid?
        assert {:name, "has already been taken"} in changeset.errors
      end
    end
  end
end
