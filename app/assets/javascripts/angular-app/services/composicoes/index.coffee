angular.module 'app'
  .factory 'ComposicaoResource', [
    '$resource'
    ($resource)->
      return $resource '/composicao_cobranca/:id.json', 
        id: '@id',
          'save':  method: 'POST'
          'get':   method: 'GET'
  ]