defmodule Apisort.Challenge do
  @moduledoc """
  The Challenge context.
  """

  import Ecto.Query, warn: false
  alias Apisort.Repo

  alias Apisort.Challenge.ApiSort

  @doc """
  Returns the list of apisorts.

  ## Examples

      iex> list_apisorts()
      [%ApiSort{}, ...]

  """
  def list_apisorts do
    Repo.all(ApiSort)
  end

  @doc """
  Gets a single api_sort.

  Raises `Ecto.NoResultsError` if the Api sort does not exist.

  ## Examples

      iex> get_api_sort!(123)
      %ApiSort{}

      iex> get_api_sort!(456)
      ** (Ecto.NoResultsError)

  """
  def get_api_sort!(id), do: Repo.get!(ApiSort, id)

  @doc """
  Creates a api_sort.

  ## Examples

      iex> create_api_sort(%{field: value})
      {:ok, %ApiSort{}}

      iex> create_api_sort(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_api_sort(attrs \\ %{}) do
    %ApiSort{}
    |> ApiSort.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a api_sort.

  ## Examples

      iex> update_api_sort(api_sort, %{field: new_value})
      {:ok, %ApiSort{}}

      iex> update_api_sort(api_sort, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_api_sort(%ApiSort{} = api_sort, attrs) do
    api_sort
    |> ApiSort.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a api_sort.

  ## Examples

      iex> delete_api_sort(api_sort)
      {:ok, %ApiSort{}}

      iex> delete_api_sort(api_sort)
      {:error, %Ecto.Changeset{}}

  """
  def delete_api_sort(%ApiSort{} = api_sort) do
    Repo.delete(api_sort)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking api_sort changes.

  ## Examples

      iex> change_api_sort(api_sort)
      %Ecto.Changeset{data: %ApiSort{}}

  """
  def change_api_sort(%ApiSort{} = api_sort, attrs \\ %{}) do
    ApiSort.changeset(api_sort, attrs)
  end
end
