defmodule Cepix do
  @moduledoc """
  Documentation for Cepix.
  """

  @doc """
  """

  def run_cep(cep_code)

  def run_cep(cep_code) when is_list(cep_code) do
    Enum.map(cep_code, fn u_cep -> run_cep(u_cep) end)
  end

  def run_cep(cep_code) when is_integer(cep_code) do
    run_cep(Integer.to_string(cep_code))
  end

  def run_cep(cep_code) do
    http_request(cep_code)
  end

  def run_place(uf, city, street) do
    http_request(uf <> "/" <> replace_nil(city) <> "/" <> street)
  end

  def http_request(attrs) do
    url = "viacep.com.br/ws/#{attrs}/json"
    HTTPoison.start()

    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        parser(body)

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        "Not found :("

      {:error, %HTTPoison.Error{reason: reason}} ->
        reason
    end
  end

  defp parser(body_json), do: Poison.decode!(body_json)

  defp replace_nil(attr), do: String.replace(attr, " ", "%20")
end
