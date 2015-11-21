angular.module 'app'
  .controller 'Cobranca::IndexCtrl', [
    '$scope', '$timeout', '$filter', 'CobrancaResource', 'RecebimentoResource', 'ReceberResource', 'scTopMessages', 'scAlert'
    (sc, $timeout, $filter, CobrancaResource, RecebimentoResource, ReceberResource, scTopMessages, scAlert)->

      idCobranca = 1

      sc.carregando = true
      sc.cobranca = CobrancaResource.get {id: idCobranca},
        (data)->
          sc.carregando = false
        (response)->
          scTopMessages.openDanger "Houve algum erro na busca da cobrança, contate ao Suporte se percistir!"


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
          RecebimentoResource.save sc.receber,
            (data)->
              sc.receber.salvando = false
              sc.cobranca.recebimentos.push data.recebimento
              sc.cobranca.totais = data.totais
              sc.cobranca.pagamentoMaior = data.pagamentoMaior
              sc.cobranca.divida_cobranca = data.divida_cobranca
              resetReceb()
              scTopMessages.openSuccess "Recebimento realizado com sucesso!"
              $timeout ()->
                scTopMessages.close()
              , 5000
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
        scAlert.open
          title: 'Você tem certeza?'
          messages: 'Você não será capaz de recuperar esse registro!'
          buttons: [
            {
              label: 'Cancelar'
              color: 'gray'
            }
            {
              label: 'Excluír'
              color: 'red'
              action: ()->
                RecebimentoResource.delete
                  id: item.id,
                  (data)->
                    sc.cobranca.recebimentos.splice index, 1
                    sc.cobranca.totais = data.totais
                    sc.cobranca.divida_cobranca = data.divida_cobranca
                    sc.cobranca.pagamentoMaior = data.pagamentoMaior
                    scTopMessages.openDanger "Recebimento excluido com sucesso!"
                    $timeout ()->
                      scTopMessages.close()
                    , 5000
            }
          ]
          (response)->

]
