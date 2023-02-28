defmodule LoadTestApi.AnimalesTest do
  use LoadTestApi.DataCase

  alias LoadTestApi.Animales

  describe "animales" do
    alias LoadTestApi.Animales.Animal

    import LoadTestApi.AnimalesFixtures

    @invalid_attrs %{descripcion: nil, edad: nil, nombre: nil, tamaño: nil}

    test "list_animales/0 returns all animales" do
      animal = animal_fixture()
      assert Animales.list_animales() == [animal]
    end

    test "get_animal!/1 returns the animal with given id" do
      animal = animal_fixture()
      assert Animales.get_animal!(animal.id) == animal
    end

    test "create_animal/1 with valid data creates a animal" do
      valid_attrs = %{descripcion: "some descripcion", edad: 42, nombre: "some nombre", tamaño: 42}

      assert {:ok, %Animal{} = animal} = Animales.create_animal(valid_attrs)
      assert animal.descripcion == "some descripcion"
      assert animal.edad == 42
      assert animal.nombre == "some nombre"
      assert animal.tamaño == 42
    end

    test "create_animal/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Animales.create_animal(@invalid_attrs)
    end

    test "update_animal/2 with valid data updates the animal" do
      animal = animal_fixture()
      update_attrs = %{descripcion: "some updated descripcion", edad: 43, nombre: "some updated nombre", tamaño: 43}

      assert {:ok, %Animal{} = animal} = Animales.update_animal(animal, update_attrs)
      assert animal.descripcion == "some updated descripcion"
      assert animal.edad == 43
      assert animal.nombre == "some updated nombre"
      assert animal.tamaño == 43
    end

    test "update_animal/2 with invalid data returns error changeset" do
      animal = animal_fixture()
      assert {:error, %Ecto.Changeset{}} = Animales.update_animal(animal, @invalid_attrs)
      assert animal == Animales.get_animal!(animal.id)
    end

    test "delete_animal/1 deletes the animal" do
      animal = animal_fixture()
      assert {:ok, %Animal{}} = Animales.delete_animal(animal)
      assert_raise Ecto.NoResultsError, fn -> Animales.get_animal!(animal.id) end
    end

    test "change_animal/1 returns a animal changeset" do
      animal = animal_fixture()
      assert %Ecto.Changeset{} = Animales.change_animal(animal)
    end
  end
end
