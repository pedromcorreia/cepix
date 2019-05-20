
# Cepix [![Build Status](https://travis-ci.com/pedromcorreia/cepix.svg?branch=master)](https://travis-ci.com/pedromcorreia/cepix) 
An lib that return a list of brazilian code postal, as know as CEP.

## Installation

First, add Cepix to your  `mix.exs`  dependencies:
```
def deps do
  [{:cepix, git: "https://github.com/pedromcorreia/cepix"}]
end
```

and run `$ mix deps.get`. Elixir version is 1.3 or lower:
## Usage
```

iex> Cepix.run_cep("01001000")
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
iex> Cepix.run_cep(["01001000", "09781300", "05602110"])
[                                   
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
iex> Cepix.run_cep(01_001_000)
"Not found :("
```
