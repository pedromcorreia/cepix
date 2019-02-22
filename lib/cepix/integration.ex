defmodule Cepix.Integration do
  @moduledoc """
  This is the module of Cepix that request the data.
  """

  @doc """
  This is responsable to request for the url and return the data
  """
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
end
