defmodule LoadTestApi.Repo.Migrations.CreateAnimales do
  use Ecto.Migration

  def change do
    create table(:animales, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :nombre, :string
      add :edad, :integer
      add :descripcion, :text
      add :tamaño, :integer

      timestamps()
    end

    create index(:animales, [:nombre])

  end
end
