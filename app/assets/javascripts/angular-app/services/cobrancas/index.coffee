angular.module 'app'
  .factory 'CobrancaResource', [
    '$resource'
    ($resource)->
      return $resource '/cobrancas/:id.json', 
        id: '@id',
          'get':    method: 'GET'
          'update':  method: 'PUT'
  ]