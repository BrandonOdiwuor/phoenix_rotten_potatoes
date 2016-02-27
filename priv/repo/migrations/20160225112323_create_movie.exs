defmodule PlayGround.Repo.Migrations.CreateMovie do
  use Ecto.Migration

  def change do
    create table(:movies) do
      add :title, :string
      add :rating, :string
      add :year, :integer

      timestamps
    end

  end
end
