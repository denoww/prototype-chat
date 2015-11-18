angular.module 'app'
  .factory 'ReceberResource', [
    '$resource'
    ($resource)->
      return $resource '/recebimentos/calcular_divida.json', 
        {},
          'calcular_divida': method: 'POST'
  ]