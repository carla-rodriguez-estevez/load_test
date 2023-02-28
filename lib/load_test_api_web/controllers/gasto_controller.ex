defmodule LoadTestApiWeb.GastoController do
  use LoadTestApiWeb, :controller

  alias LoadTestApi.Gastos
  alias LoadTestApi.Gastos.Gasto

  action_fallback LoadTestApiWeb.FallbackController

  def index(conn, _params) do
    gastos = Gastos.list_gastos()
    render(conn, "index.json", gastos: gastos)
  end

  def create(conn, %{"gasto" => gasto_params}) do
    with {:ok, %Gasto{} = gasto} <- Gastos.create_gasto(gasto_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.gasto_path(conn, :show, gasto))
      |> render("show.json", gasto: gasto)
    end
  end

  def show(conn, %{"id" => id}) do
    gasto = Gastos.get_gasto!(id)
    render(conn, "show.json", gasto: gasto)
  end

  def update(conn, %{"id" => id, "gasto" => gasto_params}) do
    gasto = Gastos.get_gasto!(id)

    with {:ok, %Gasto{} = gasto} <- Gastos.update_gasto(gasto, gasto_params) do
      render(conn, "show.json", gasto: gasto)
    end
  end

  def delete(conn, %{"id" => id}) do
    gasto = Gastos.get_gasto!(id)

    with {:ok, %Gasto{}} <- Gastos.delete_gasto(gasto) do
      send_resp(conn, :no_content, "")
    end
  end
end
