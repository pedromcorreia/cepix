defmodule CepixTest do
  use ExUnit.Case
  doctest Cepix

  @cep_test "01001000"
  @cep_test_integer 01001000
  @cep_test_list ["01001000", "09781300", "05602110"]
  @via_cep "01001000"
  @via_cep_invalid "viacep.com.br/ws/01001000"

  test "run_cep" do
    assert Cepix.run_cep(@cep_test_integer) == %{
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
    assert Cepix.run_cep(@via_cep_invalid) == "Not found :("

    assert Cepix.run_cep(@cep_test_list) == [
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
      },
      %{
        "bairro" => "Santa Terezinha",
        "cep" => "09781-300",
        "complemento" => "(Jd Yrajá)",
        "gia" => "6350",
        "ibge" => "3548708",
        "localidade" => "São Bernardo do Campo",
        "logradouro" => "Rua Everardo Martins de Vasconcelos",
        "uf" => "SP",
        "unidade" => ""
      },
      %{
        "bairro" => "Jardim Everest",
        "cep" => "05602-110",
        "complemento" => "",
        "gia" => "1004",
        "ibge" => "3550308",
        "localidade" => "São Paulo",
        "logradouro" => "Praça Professor Hugo Sarmento",
        "uf" => "SP",
        "unidade" => ""
      }
    ]

    assert Cepix.run_cep(@cep_test) ==
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

  test "run_place" do
    assert Cepix.run_place("SC", "A", "AA") == "Not found :("
    result_list = Cepix.run_place("RS", "Porto Alegre", "Domingos")

    assert result_list |> List.first() == %{
      "bairro" => "Bom Jesus",
      "cep" => "91420-270",
      "complemento" => "",
      "gia" => "",
      "ibge" => "4314902",
      "localidade" => "Porto Alegre",
      "logradouro" => "Rua São Domingos",
      "uf" => "RS",
      "unidade" => ""
    }

    assert result_list |> Enum.count() == 15
  end

  test "http_request" do
    assert Cepix.http_request(@via_cep_invalid) == "Not found :("

    assert Cepix.http_request(@via_cep) ==
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
