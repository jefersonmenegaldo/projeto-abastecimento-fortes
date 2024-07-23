# Projeto Abastecimento

## Requerimentos

* Delphi 11 Commnunity
* Fortes Report (https://github.com/fortesinformatica/fortesreport-ce)
* Banco de dados Firebird 5.0

## Rodar o projeto em desenvolvimento

* Rodar no cmd 
    ```
    cp .\.env.example .env 
    ```
    ```
    cp .env Build\Debug\ProjetoAbastecimento.ini 
    ```
 * Iniciar Container com docker do Firebird
    ```
    docker compose up -d
    ```   