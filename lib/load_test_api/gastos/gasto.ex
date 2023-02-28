defmodule LoadTestApi.Gastos.Gasto do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "gastos" do
    field :descripcion, :string
    field :importe, :integer
    field :tipo, :string
    belongs_to :animal, LoadTestApi.Animales.Animal

    timestamps()
  end

  @doc false
  def changeset(gasto, attrs) do
    gasto
    |> cast(attrs, [:importe, :tipo, :descripcion])
    |> validate_required([:importe, :tipo, :descripcion])
  end
end
