defmodule Cepix.IntegrationTest do
  use ExUnit.Case
  doctest Cepix

  alias Cepix.Integration
  @via_cep "01001000"
  @via_cep_invalid "viacep.com.br/ws/01001000"

  test "http_request" do
    assert Integration.http_request(@via_cep_invalid) == "Not found :("

    assert Integration.http_request(@via_cep) ==
             %{
               "bairro" => "Sé",
               "cep" => "01001-000",
               "complemento" => "lado ímpar",
               "gia" => "1004",
               "ibge" => "3550308",
               "localidade" => "São Paulo",
               "logradouro" => "Praça da Sé",
               "uf" => "SP",
               "unidade" => ""
             }
  end
end
