execute: 
 rake db:setup
para poder atualizar o bd


Caso prefira fazer manualmente

- Criar uma cobranca (nome da tabela: cobrancas) manualmente (pois este é apenas para teste e não possibitará o cadastro do tal), com os campos:
  > valor (R$)-(Float)
  > juros (%)-(Float)
  > multa (%)-(Float)
  > atualizado (Float) - este é atualizado apenas durante o recebimento, iniciar com 0
  > vencimento (date)

  ex.: "insert into cobrancas(valor, juros, multa, atualizado, vencimento) values(95, 0.03, 2, 0, "2015-10-12");" (sem aspas)

- Criar composicao de cobrancas (nome da tabela: composicao_cobrancas) (pois este é apenas para teste e não possibitará o cadastro do tal), com os campos:
  > titulo (string)
  > valor (R$)-(Float)
  > cobranca_id (integer)

  obs: O valor total das composicoes deve ser igual ao valor de cobranca.
  obs: caso siga a risca do cadastro de cobranca, o id inicial será 1, logo este exemplo se segue.

  ex.: "insert into composicao_cobrancas(titulo, valor, cobranca_id) values("Multa", 15, 1);
  ex.: "insert into composicao_cobrancas(titulo, valor, cobranca_id) values("Multa 2", 80, 1);

  OBS: Caso houver mudança no ID da cobranca, deve ser alterado os valores do id em "<caminho>/calculoCobranca/app/assets/javascripts/angular-app/controllers/cobrancas/index.coffee", pois esta configurado para id = 1 (alterar a variavel 'idCobranca' na linha 6)