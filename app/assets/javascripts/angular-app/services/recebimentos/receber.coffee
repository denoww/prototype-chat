angular.module 'app'
  .factory 'ReceberResource', [
    '$resource'
    ($resource)->
      return $resource '/recebimentos/receber.json', 
        {},
          'jurosMulta': method: 'POST'
  ]