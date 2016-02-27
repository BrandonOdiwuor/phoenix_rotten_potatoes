defmodule PlayGround.Movie do
  use PlayGround.Web, :model

  schema "movies" do
    field :title, :string
    field :rating, :string
    field :year, :integer

    timestamps
  end

  @required_fields ~w(title rating year)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
