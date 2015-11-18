angular.module 'app'
  .controller 'Cobranca::IndexCtrl', [
    '$scope', '$timeout', '$filter', 'CobrancaResource', 'RecebimentoResource', 'ReceberResource'
    (sc, $timeout, $filter, CobrancaResource, RecebimentoResource, ReceberResource)->

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
          sc.receber.carregando = true
          RecebimentoResource.save sc.receber,
            (data)->
              sc.receber.carregando = false
              sc.cobranca.recebimentos.push data.recebimento
              sc.cobranca.totais = data.totais
              sc.cobranca.divida_cobranca = data.divida_cobranca
              resetReceb()
            (response)->
              sc.receber.carregando = false
      
      sc.calcularSemJurosMulta = ->
        sc.receber.juros = null
        sc.receber.multa = null
        sc.calcularComJurosMulta()
      
      sc.calcularComJurosMulta = ()->
        sc.receber.data = null
        $timeout ->
          ReceberResource.calcular_divida sc.receber,
            (data)->
              sc.receber.juros = data.juros
              sc.receber.multa = data.multa
              sc.receber.divida_cobranca = data.divida_cobranca
            (response)->
        , 500

      sc.deleteReceb = (item, index)->
        RecebimentoResource.delete
          id: item.id,
          (data)->
            sc.cobranca.recebimentos.splice index, 1
            sc.cobranca.totais = data.totais
            sc.cobranca.divida_cobranca = data.divida_cobranca
          (response)->

]