defmodule Cepix do
  @moduledoc """
  This is the main module of Cepix.
  The main objetive of it is to make a little bit easier to get the CEP for brazilians address.
  """

  alias Cepix.Integration

  @doc """
  This will return a list of ceps from the cep_code list passes as argument.

  ## Examples
  iex> Cepix.run_cep "80030000"
  %{
    "bairro" => "Alto da Glória",
    "cep" => "80030-000",
    "complemento" => "até 1343/1344",
    "gia" => "",
    "ibge" => "4106902",
    "localidade" => "Curitiba",
    "logradouro" => "Avenida João Gualberto",
    "uf" => "PR",
    "unidade" => ""
  }

  iex> Cepix.run_cep "80030000"
  "Not found :("

  """
  def run_cep(cep_code)

  def run_cep(cep_code) when is_list(cep_code) do
    Enum.map(cep_code, fn u_cep -> run_cep(u_cep) end)
  end

  def run_cep(cep_code) when is_integer(cep_code) do
    run_cep(Integer.to_string(cep_code))
  end

  def run_cep(cep_code) do
    Integration.http_request(cep_code)
  end

  def run_place(uf, city, street) do
    Integration.http_request(uf <> "/" <> replace_nil(city) <> "/" <> street)
  end

  defp replace_nil(attr), do: String.replace(attr, " ", "%20")
end
