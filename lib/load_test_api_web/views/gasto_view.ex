defmodule LoadTestApiWeb.GastoView do
  use LoadTestApiWeb, :view
  alias LoadTestApiWeb.GastoView

  def render("index.json", %{gastos: gastos}) do
    %{data: render_many(gastos, GastoView, "gasto.json")}
  end

  def render("show.json", %{gasto: gasto}) do
    %{data: render_one(gasto, GastoView, "gasto.json")}
  end

  def render("gasto.json", %{gasto: gasto}) do
    %{
      id: gasto.id,
      importe: gasto.importe,
      tipo: gasto.tipo,
      descripcion: gasto.descripcion
    }
  end
end
