angular.module 'app'
  .factory 'RecebimentoResource', [
    '$resource'
    ($resource)->
      return $resource '/recebimentos/:id.json', 
        id: '@id',
          'save':     method: 'POST'
          'delete':     method: 'DELETE'
  ]