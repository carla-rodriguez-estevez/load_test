defmodule LoadTestApi.GastosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LoadTestApi.Gastos` context.
  """

  @doc """
  Generate a gasto.
  """
  def gasto_fixture(attrs \\ %{}) do
    {:ok, gasto} =
      attrs
      |> Enum.into(%{
        descripcion: "some descripcion",
        importe: 42,
        tipo: "some tipo"
      })
      |> LoadTestApi.Gastos.create_gasto()

    gasto
  end
end
