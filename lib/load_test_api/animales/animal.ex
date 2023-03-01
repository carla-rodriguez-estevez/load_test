defmodule LoadTestApi.Animales.Animal do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "animales" do
    field :descripcion, :string
    field :edad, :integer
    field :nombre, :string
    field :tamaño, :integer
    has_many :gasto, LoadTestApi.Gastos.Gasto

    timestamps()
  end

  @doc false
  def changeset(animal, attrs) do
    animal
    |> cast(attrs, [:nombre, :edad, :descripcion, :tamaño])
    |> validate_required([:nombre, :descripcion])
  end
end
