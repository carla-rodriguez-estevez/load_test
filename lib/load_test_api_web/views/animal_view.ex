defmodule LoadTestApiWeb.AnimalView do
  use LoadTestApiWeb, :view
  alias LoadTestApiWeb.AnimalView

  def render("index.json", %{animales: animales}) do
    %{data: render_many(animales, AnimalView, "animal.json")}
  end

  def render("show.json", %{animal: animal}) do
    %{data: render_one(animal, AnimalView, "animal.json")}
  end

  def render("animal.json", %{animal: animal}) do
    %{
      id: animal.id,
      nombre: animal.nombre,
      edad: animal.edad,
      descripcion: animal.descripcion,
      tamaño: animal.tamaño
    }
  end
end
