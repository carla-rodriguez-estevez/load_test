defmodule LoadTestApiWeb.GastoControllerTest do
  use LoadTestApiWeb.ConnCase

  import LoadTestApi.GastosFixtures

  alias LoadTestApi.Gastos.Gasto

  @create_attrs %{
    descripcion: "some descripcion",
    importe: 42,
    tipo: "some tipo"
  }
  @update_attrs %{
    descripcion: "some updated descripcion",
    importe: 43,
    tipo: "some updated tipo"
  }
  @invalid_attrs %{descripcion: nil, importe: nil, tipo: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all gastos", %{conn: conn} do
      conn = get(conn, Routes.gasto_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create gasto" do
    test "renders gasto when data is valid", %{conn: conn} do
      conn = post(conn, Routes.gasto_path(conn, :create), gasto: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.gasto_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "descripcion" => "some descripcion",
               "importe" => 42,
               "tipo" => "some tipo"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.gasto_path(conn, :create), gasto: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update gasto" do
    setup [:create_gasto]

    test "renders gasto when data is valid", %{conn: conn, gasto: %Gasto{id: id} = gasto} do
      conn = put(conn, Routes.gasto_path(conn, :update, gasto), gasto: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.gasto_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "descripcion" => "some updated descripcion",
               "importe" => 43,
               "tipo" => "some updated tipo"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, gasto: gasto} do
      conn = put(conn, Routes.gasto_path(conn, :update, gasto), gasto: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete gasto" do
    setup [:create_gasto]

    test "deletes chosen gasto", %{conn: conn, gasto: gasto} do
      conn = delete(conn, Routes.gasto_path(conn, :delete, gasto))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.gasto_path(conn, :show, gasto))
      end
    end
  end

  defp create_gasto(_) do
    gasto = gasto_fixture()
    %{gasto: gasto}
  end
end
