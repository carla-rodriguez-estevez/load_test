defmodule LoadTestApi.Gastos do
  @moduledoc """
  The Gastos context.
  """

  import Ecto.Query, warn: false
  alias LoadTestApi.Repo

  alias LoadTestApi.Gastos.Gasto

  @doc """
  Returns the list of gastos.

  ## Examples

      iex> list_gastos()
      [%Gasto{}, ...]

  """
  def list_gastos do
    Repo.all(Gasto)
  end

  @doc """
  Gets a single gasto.

  Raises `Ecto.NoResultsError` if the Gasto does not exist.

  ## Examples

      iex> get_gasto!(123)
      %Gasto{}

      iex> get_gasto!(456)
      ** (Ecto.NoResultsError)

  """
  def get_gasto!(id), do: Repo.get!(Gasto, id)

  @doc """
  Creates a gasto.

  ## Examples

      iex> create_gasto(%{field: value})
      {:ok, %Gasto{}}

      iex> create_gasto(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_gasto(attrs \\ %{}) do
    %Gasto{}
    |> Gasto.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a gasto.

  ## Examples

      iex> update_gasto(gasto, %{field: new_value})
      {:ok, %Gasto{}}

      iex> update_gasto(gasto, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_gasto(%Gasto{} = gasto, attrs) do
    gasto
    |> Gasto.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a gasto.

  ## Examples

      iex> delete_gasto(gasto)
      {:ok, %Gasto{}}

      iex> delete_gasto(gasto)
      {:error, %Ecto.Changeset{}}

  """
  def delete_gasto(%Gasto{} = gasto) do
    Repo.delete(gasto)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking gasto changes.

  ## Examples

      iex> change_gasto(gasto)
      %Ecto.Changeset{data: %Gasto{}}

  """
  def change_gasto(%Gasto{} = gasto, attrs \\ %{}) do
    Gasto.changeset(gasto, attrs)
  end
end
