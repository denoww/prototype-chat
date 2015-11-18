angular.module 'app'
  .factory 'ComposicaoResource', [
    '$resource'
    ($resource)->
      return $resource '/composicao_cobrancas/:id.json', 
        id: '@id',
          'save':  method: 'POST'
          'get':   method: 'GET'
  ]