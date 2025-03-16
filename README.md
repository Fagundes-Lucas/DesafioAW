Sobre o Projeto
Este projeto tem como objetivo modelar os dados do ERP Adventure Works utilizando o dbt (Data Build Tool), seguindo boas práticas de modelagem dimensional para facilitar a análise e construção de painéis de BI.

Estrutura do Projeto
A estrutura do projeto segue a divisão em três camadas principais:

Staging (stg_erp__)
Camada responsável por padronizar e limpar os dados, convertendo tipos e criando chaves primárias e estrangeiras.

Intermediate (int_)
Camada intermediária onde os dados são enriquecidos e tabelas são combinadas para agregar informações relevantes.

Marts (fact_ e dim_)

Fatos (fact_): Contém eventos transacionais, como vendas.
Dimensões (dim_): Contém atributos descritivos, como clientes, produtos e localizações.
Testes Implementados
Foi implementado um conjunto de testes para garantir a qualidade dos dados, incluindo:

Testes de integridade para verificar chaves primárias e estrangeiras.
Validação de valores auditados, como a verificação do total de vendas brutas de 2011.
Testes de consistência para identificar possíveis falhas nos dados.