defmodule LoadTestApiWeb.AnimalControllerTest do
  use LoadTestApiWeb.ConnCase

  import LoadTestApi.AnimalesFixtures

  alias LoadTestApi.Animales.Animal

  @create_attrs %{
    descripcion: "some descripcion",
    edad: 42,
    nombre: "some nombre",
    tamaño: 42
  }
  @update_attrs %{
    descripcion: "some updated descripcion",
    edad: 43,
    nombre: "some updated nombre",
    tamaño: 43
  }
  @invalid_attrs %{descripcion: nil, edad: nil, nombre: nil, tamaño: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all animales", %{conn: conn} do
      conn = get(conn, Routes.animal_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create animal" do
    test "renders animal when data is valid", %{conn: conn} do
      conn = post(conn, Routes.animal_path(conn, :create), animal: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.animal_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "descripcion" => "some descripcion",
               "edad" => 42,
               "nombre" => "some nombre",
               "tamaño" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.animal_path(conn, :create), animal: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update animal" do
    setup [:create_animal]

    test "renders animal when data is valid", %{conn: conn, animal: %Animal{id: id} = animal} do
      conn = put(conn, Routes.animal_path(conn, :update, animal), animal: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.animal_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "descripcion" => "some updated descripcion",
               "edad" => 43,
               "nombre" => "some updated nombre",
               "tamaño" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, animal: animal} do
      conn = put(conn, Routes.animal_path(conn, :update, animal), animal: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete animal" do
    setup [:create_animal]

    test "deletes chosen animal", %{conn: conn, animal: animal} do
      conn = delete(conn, Routes.animal_path(conn, :delete, animal))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.animal_path(conn, :show, animal))
      end
    end
  end

  defp create_animal(_) do
    animal = animal_fixture()
    %{animal: animal}
  end
end
