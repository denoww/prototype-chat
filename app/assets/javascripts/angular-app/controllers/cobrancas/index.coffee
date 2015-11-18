angular.module 'app'
  .controller 'Cobranca::IndexCtrl', [
    '$scope', '$filter', 'CobrancaResource', 'RecebimentoResource', 'ComposicaoResource', 'ReceberResource'
    (sc, $filter, CobrancaResource, RecebimentoResource, ComposicaoResource, ReceberResource)->

      idCobranca = 1

      sc.cobranca = CobrancaResource.get id: idCobranca

      sc.receber =
        data: ''
        valor: 0
        juros: 0
        multa: 0
        cobranca_id: idCobranca

      resetReceb = ()->
        sc.receber =
          data: ''
          valor: 0
          juros: 0
          multa: 0
          cobranca_id: idCobranca

      sc.addRec = ()->
        if sc.receber.valor != 0
          if sc.receber.juros > 0
            composicao = 
              titulo: 'Juros'
              valor: sc.receber.juros
              cobranca_id: sc.receber.cobranca_id

            ComposicaoResource.save composicao,
              (data)->
                sc.cobranca.composicaoCobranca.push data
              (response)->

          if sc.receber.multa > 0
            composicao = 
              titulo: 'Multa'
              valor: sc.receber.multa
              cobranca_id: sc.receber.cobranca_id

            ComposicaoResource.save composicao,
              (data)->
                sc.cobranca.composicaoCobranca.push data
              (response)->

          RecebimentoResource.save sc.receber,
            (data)->
              sc.cobranca.recebimentos.push data.recebimento
              sc.cobranca.totais.recebimentos = data.totais.recebimentos
              sc.cobranca.totais.composicao = data.totais.composicao
              sc.cobranca.divida_cobranca = data.divida_cobranca
              resetReceb()
            (response)->
      
      sc.$watch 'receber.data', ()->
        atualizaJurosMulta()
      sc.$watch 'receber.valor', ()->
        atualizaJurosMulta()
      sc.$watch 'receber.juros', ()->
        atualizaJurosMulta()
      sc.$watch 'receber.multa', ()->
        atualizaJurosMulta()
        
      atualizaJurosMulta = ()->
        sc.receber.divida_cobranca = sc.cobranca.divida_cobranca
        ReceberResource.jurosMulta sc.receber,
          (data)->
            sc.receber.juros = data.juros
            sc.receber.multa = data.multa
            sc.receber.divida_cobranca = data.divida_cobranca
          (response)->

      sc.deleteReceb = (item, index)->
        RecebimentoResource.delete
          id: item.id,
          (data)->
            sc.cobranca.recebimentos.splice index, 1
            sc.cobranca.totais.recebimentos = data.totais.recebimentos
            sc.cobranca.totais.composicao = data.totais.composicao
            sc.cobranca.divida_cobranca = data.divida_cobranca
          (response)->

]