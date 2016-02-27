defmodule PlayGround.MovieTest do
  use PlayGround.ModelCase

  alias PlayGround.Movie

  @valid_attrs %{title: "string", rating: "g", year: 1995}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Movie.changeset(%Movie{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Movie.changeset(%Movie{}, @invalid_attrs)
    refute changeset.valid?
  end
end
