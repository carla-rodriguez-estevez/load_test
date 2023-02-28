defmodule LoadTestApi.GastosTest do
  use LoadTestApi.DataCase

  alias LoadTestApi.Gastos

  describe "gastos" do
    alias LoadTestApi.Gastos.Gasto

    import LoadTestApi.GastosFixtures

    @invalid_attrs %{descripcion: nil, importe: nil, tipo: nil}

    test "list_gastos/0 returns all gastos" do
      gasto = gasto_fixture()
      assert Gastos.list_gastos() == [gasto]
    end

    test "get_gasto!/1 returns the gasto with given id" do
      gasto = gasto_fixture()
      assert Gastos.get_gasto!(gasto.id) == gasto
    end

    test "create_gasto/1 with valid data creates a gasto" do
      valid_attrs = %{descripcion: "some descripcion", importe: 42, tipo: "some tipo"}

      assert {:ok, %Gasto{} = gasto} = Gastos.create_gasto(valid_attrs)
      assert gasto.descripcion == "some descripcion"
      assert gasto.importe == 42
      assert gasto.tipo == "some tipo"
    end

    test "create_gasto/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Gastos.create_gasto(@invalid_attrs)
    end

    test "update_gasto/2 with valid data updates the gasto" do
      gasto = gasto_fixture()
      update_attrs = %{descripcion: "some updated descripcion", importe: 43, tipo: "some updated tipo"}

      assert {:ok, %Gasto{} = gasto} = Gastos.update_gasto(gasto, update_attrs)
      assert gasto.descripcion == "some updated descripcion"
      assert gasto.importe == 43
      assert gasto.tipo == "some updated tipo"
    end

    test "update_gasto/2 with invalid data returns error changeset" do
      gasto = gasto_fixture()
      assert {:error, %Ecto.Changeset{}} = Gastos.update_gasto(gasto, @invalid_attrs)
      assert gasto == Gastos.get_gasto!(gasto.id)
    end

    test "delete_gasto/1 deletes the gasto" do
      gasto = gasto_fixture()
      assert {:ok, %Gasto{}} = Gastos.delete_gasto(gasto)
      assert_raise Ecto.NoResultsError, fn -> Gastos.get_gasto!(gasto.id) end
    end

    test "change_gasto/1 returns a gasto changeset" do
      gasto = gasto_fixture()
      assert %Ecto.Changeset{} = Gastos.change_gasto(gasto)
    end
  end
end
