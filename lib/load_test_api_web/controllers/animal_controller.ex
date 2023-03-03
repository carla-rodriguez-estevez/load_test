defmodule LoadTestApiWeb.AnimalController do
  use LoadTestApiWeb, :controller

  alias LoadTestApi.Animales
  alias LoadTestApi.Animales.Animal

  action_fallback LoadTestApiWeb.FallbackController

  def index(conn, _params) do
    animales = Animales.list_animales()
    render(conn, "index.json", animales: animales)
  end

  def create(conn, %{"animal" => animal_params}) do
    with {:ok, %Animal{} = animal} <- Animales.create_animal(animal_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.animal_path(conn, :show, animal))
      |> render("show.json", animal: animal)
    end
  end

  def show_listed(conn, %{"nombre" => nombre}) do
    animales = Animales.get_animales_name(nombre)
    render(conn, "animales_gastos.json", animales: animales)
  end

  def show(conn, %{"id" => id}) do
    animal = Animales.get_full_animal(id)
    render(conn, "full_animal.json", animal: animal)
  end

  def update(conn, %{"id" => id, "animal" => animal_params}) do
    animal = Animales.get_animal!(id)

    with {:ok, %Animal{} = animal} <- Animales.update_animal(animal, animal_params) do
      render(conn, "show.json", animal: animal)
    end
  end

  def delete(conn, %{"id" => id}) do
    animal = Animales.get_animal!(id)

    with {:ok, %Animal{}} <- Animales.delete_animal(animal) do
      send_resp(conn, :no_content, "")
    end
  end
end
