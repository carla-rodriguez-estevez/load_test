defmodule LoadTestApi.Repo.Migrations.CreateGastos do
  use Ecto.Migration

  def change do
    create table(:gastos, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :importe, :integer
      add :tipo, :string
      add :descripcion, :string
      add :animal_id, references(:animales, type: :binary_id, on_delete: :nothing, null: false)

      timestamps()
    end


    create index(:gastos, [:animal_id])

  end
end
