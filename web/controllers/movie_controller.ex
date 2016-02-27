defmodule PlayGround.MovieController do
  use PlayGround.Web, :controller

  alias PlayGround.Movie

  plug :scrub_params, "movie" when action in [:create, :update]

  def index(conn, _params) do
    movies = Repo.all(Movie)
    render(conn, :index, movies: movies)
  end

  def show(conn, %{"id" => id}) do
    movie = Repo.get(Movie, id)
    render(conn, :show, movie: movie)
  end

  def new(conn, _params) do
    changeset = Movie.changeset(%Movie{})

    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"movie" => movie_params}) do
    changeset = Movie.changeset(%Movie{}, movie_params)

    if changeset.valid? do
      Repo.insert(changeset)

      conn
        |> put_flash(:info, "movie added succesfully")
        |> redirect(to: movie_path(conn, :index))
    else
      render(conn, :new, changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id}) do
    movie = Repo.get(Movie, id)
    changeset = Movie.changeset(movie)
    render(conn, :edit, movie: movie, changeset: changeset)
  end

  def update(conn, %{"id" => id, "movie" => movie_params}) do
    movie = Repo.get(Movie, id)
    changeset = Movie.changeset(movie, movie_params)

    case Repo.update(changeset) do
      {:ok, movie} ->
        conn
          |> put_flash(:info, "Movie updated succesfully")
          |>redirect(to: movie_path(conn, :show, movie))
      {:error, changeset} ->
        render(conn, "edit.html", movie: movie, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    movie = Repo.get!(Movie, id)
    Repo.delete!(movie)

    conn
      |> put_flash(:info, "Movie deleted succesfully")
      |> redirect(to: movie_path(conn, :index))
  end

end
