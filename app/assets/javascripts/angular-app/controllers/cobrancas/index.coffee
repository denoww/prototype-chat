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
        valor_base: 0
        juros_atual: 0
        multa_atual: 0
        cobranca_id: idCobranca

      resetReceb = ()->
        sc.receber =
          data: ''
          valor: 0
          juros: 0
          multa: 0
          valor_base: 0
          juros_atual: 0
          multa_atual: 0
          cobranca_id: idCobranca

      sc.addRec = ()->
        if sc.receber.valor != 0
          sc.receber.salvando = true
          console.log 'addRec'
          console.log sc.receber
          RecebimentoResource.save sc.receber,
            (data)->
              sc.receber.salvando = false
              sc.cobranca.recebimentos.push data.recebimento
              sc.cobranca.totais = data.totais
              sc.cobranca.pagamentoMaior = data.pagamentoMaior
              sc.cobranca.divida_cobranca = data.divida_cobranca
              resetReceb()
            (response)->
              sc.receber.salvando = false

      sc.calcularSemJurosMulta = ->
        sc.receber.juros = null
        sc.receber.multa = null
        calcular()

      sc.calcularComJurosMulta = ()->
        $timeout ->
          sc.receber.data = null
          calcular()
        , 500

      calcular = ()->
        sc.receber.calculando = true
        console.log 'calcular'
        console.log sc.receber
        ReceberResource.calcular_divida sc.receber,
          (data)->
            sc.receber.calculando = false
            sc.receber.juros = data.juros
            sc.receber.multa = data.multa
            sc.receber.multa_atual = data.multa_atual
            sc.receber.juros_atual = data.juros_atual
            sc.receber.valor_base = data.valor_base
            sc.receber.divida_cobranca = data.divida_cobranca
            sc.receber.pagamentoMaior = data.pagamentoMaior
          (response)->
            sc.receber.calculando = false

      sc.deleteReceb = (item, index)->
        RecebimentoResource.delete
          id: item.id,
          (data)->
            sc.cobranca.recebimentos.splice index, 1
            sc.cobranca.totais = data.totais
            sc.cobranca.divida_cobranca = data.divida_cobranca
            sc.cobranca.pagamentoMaior = data.pagamentoMaior
          (response)->

]
