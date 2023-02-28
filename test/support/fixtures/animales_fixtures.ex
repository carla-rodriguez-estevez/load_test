defmodule LoadTestApi.AnimalesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LoadTestApi.Animales` context.
  """

  @doc """
  Generate a animal.
  """
  def animal_fixture(attrs \\ %{}) do
    {:ok, animal} =
      attrs
      |> Enum.into(%{
        descripcion: "some descripcion",
        edad: 42,
        nombre: "some nombre",
        tamaño: 42
      })
      |> LoadTestApi.Animales.create_animal()

    animal
  end
end
