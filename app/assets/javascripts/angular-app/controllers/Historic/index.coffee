angular.module 'app'
  .controller 'Contato::indexCtrl', [
    '$scope', '$filter', '$timeout', 'scAlert'
    (sc, $filter, $timeout, scAlert)->

      sc.users =
        suporte:
          nome: "Tire sua duvida"
          tipo_conta: 'Suporte'
          status: true
          foto: '//staging.seucondominio.com.br/assets/responsivo/predio-e85d8c4a02b1ed922ab06ddc1b7f1bbf.png'
        suportes: [
          {
            nome: "Aguardando Atendimento"
            tipo_conta: 'Duvida'
            status: true
            foto: '//www.todaletra.com.br/wp-content/uploads/2012/10/duvidas-300x3001.jpg'
            conversas: [
              {texto: 'Oi',             recebe: true, hora: new Date()}
            ]
          }
          {
            nome: "Aguardando Atendimento"
            tipo_conta: 'Ajuda'
            status: true
            foto: '//www.todaletra.com.br/wp-content/uploads/2012/09/d%C3%BAvida.jpg'
            conversas: [
              {texto: 'Oi',             recebe: true, hora: new Date()}
            ]
          }
          {
            nome: "Aguardando Atendimento"
            tipo_conta: 'Ajuda'
            status: true
            foto: '//www.todaletra.com.br/wp-content/uploads/2012/09/d%C3%BAvida.jpg'
            conversas: [
              {texto: 'Oi',             recebe: true, hora: new Date()}
            ]
          }
          {
            nome: "Aguardando Atendimento"
            tipo_conta: 'Duvida'
            status: true
            foto: '//www.todaletra.com.br/wp-content/uploads/2012/10/duvidas-300x3001.jpg'
            conversas: [
              {texto: 'Oi',             recebe: true, hora: new Date()}
            ]
          }
        ]
        administracoes: [
          {
            nome: "Jubileu Tadeu Benzeno"
            tipo_conta: 'Sindico'
            status: true
            foto: "//www.revistabula.com/wp/wp-content/uploads/2013/06/Fernando-Pessoa-620x400.jpg"
            conversas: [
              {texto: 'Olá.',           recebe: true, hora: new Date()}
              {texto: 'Olá, tudo bem?', recebe: true, hora: new Date()}
              {texto: 'Tudo.',          envia:  true, hora: new Date()}
              {texto: 'Que bom...',     recebe: true, hora: new Date()}
            ]
          }
          {
            nome: "Relson Mescleu"
            tipo_conta: 'Porteiro'
            status: true
            foto: "//img.ibxk.com.br/2012/1/materias/17166216157.jpg?w=1040&h=585&mode=crop"
            conversas: [
              {texto: 'Olá.',           recebe: true, hora: new Date()}
              {texto: 'Olá, tudo bem?', recebe: true, hora: new Date()}
              {texto: 'Tudo.',          envia:  true, hora: new Date()}
              {texto: 'Que bom...',     recebe: true, hora: new Date()}
            ]
          }
        ]
        moradores: [
          {
            nome: "Jubileu Tadeu Benzeno"
            status: true
            foto: '//www2.uol.com.br/vivermente/noticias/img/voce_e_uma_pessoa_boa__1__2014-01-08155855.jpg'
            conversas: []
          }
          {
            nome: "Relson Mescleu"
            status: true
            foto: '//www.sitedecuriosidades.com/im/g/CEA60.jpg'
            conversas: [
              {texto: 'Olá.',           recebe: true, hora: new Date()}
              {texto: 'Olá, tudo bem?', recebe: true, hora: new Date()}
              {texto: 'Tudo.',          envia:  true, hora: new Date()}
              {texto: 'Que bom...',     recebe: true, hora: new Date()}
            ]
          }
          {
            nome: "Body do enzi"
            status: true
            foto: '//pbs.twimg.com/profile_images/453273471234375682/cPc0k7E6.jpeg'
            conversas: []
          }
          {
            nome: "Anna Maria"
            status: true
            foto: '//www.paranaportal.com.br/wp-content/uploads/2015/06/fernando-pessoa.jpg'
            conversas: []
          }
          {
            nome: "Jubileu Tadeu Benzeno"
            status: true
            foto: '//mulheresnacomputacao.files.wordpress.com/2015/01/3-pessoas-apontando-cc3a2mera.jpg'
            conversas: [
              {texto: 'Olá.',           recebe: true, hora: new Date()}
              {texto: 'Olá, tudo bem?', recebe: true, hora: new Date()}
              {texto: 'Tudo.',          envia:  true, hora: new Date()}
              {texto: 'Que bom...',     recebe: true, hora: new Date()}
            ]
          }
          {
            nome: "Relson Mescleu"
            status: true
            foto: '//mulheresnacomputacao.files.wordpress.com/2015/01/3-pessoas-apontando-cc3a2mera.jpg'
            conversas: []
          }
          {
            nome: "Body do enzi"
            status: true
            foto: '//mulheresnacomputacao.files.wordpress.com/2015/01/3-pessoas-apontando-cc3a2mera.jpg'
            conversas: []
          }
          {
            nome: "Anna Maria"
            status: true
            foto: '//mulheresnacomputacao.files.wordpress.com/2015/01/3-pessoas-apontando-cc3a2mera.jpg'
            conversas: []
          }
        ]

      sc.batePapo =
        adm: true
        morador: false
        users: sc.users

      sc.chats = []

      sc.openChat = (obj)->
        unless ja_aberto(obj)
          sc.chats.push obj
          sc.chats[sc.chats.length-1].open = true
          sc.chatDef.open = false unless sc.chatDef.fixed
          sc.chatDef.chat = true
          angular.element('body').css("overflow", "hidden") unless angular.element('html').outerWidth() >= 480

      sc.fecharChat = (index)->
        sc.chats.splice index, 1
        angular.element('body').css("overflow", "auto") unless angular.element('html').outerWidth() >= 480

      ja_aberto = (obj)->
        for i in sc.chats
          if i == obj
            return true
        return false

      sc.listaAdm = ()->
        sc.batePapo.adm = true
        sc.batePapo.morador = false
        sc.batePapo.users = sc.users.administracoes

      sc.listaMorador = ()->
        sc.batePapo.adm = false
        sc.batePapo.morador = true
        sc.batePapo.users = sc.users.moradores

      sc.addMessage = (obj)->
        obj.conversas.push
          texto: obj.typeMessage
          envia: true
          hora: new Date()

        obj.typeMessage = ''

      sc.openBatePapo = ()->
        if sc.chatDef.active
          sc.chatDef.open = !sc.chatDef.open
        else
          scAlert.open
            title: 'Deseja ativar o bate papo?'
            messages: 'No momento seu Bate Papo se encontra desativado, ative para continuar'
            buttons: [
              {
                label: 'Cancelar'
                color: 'gray'
              }
              {
                label: 'Ativar'
                color: 'green'
                action: ->
                  sc.chatDef.open = sc.chatDef.active = sc.chatDef.fixed = true
              }
            ]

      $(window).resize -> sc.atualizaMenuFix()

      sc.atualizaMenuFix = ()->
        win = angular.element('html')
        if sc.chatDef.active
          if win.outerWidth() >= 1500
            $timeout ->
              sc.chatDef.open = sc.chatDef.fixed = true
            angular.element('#chat').css("position", "fixed")
            angular.element('#chat').css("border-radius", "0")
            angular.element('body').css("width", "calc(100% - 16.25em)")
          else
            $timeout ->
              sc.chatDef.fixed = false
            angular.element('#chat').css("position", "absolute")
            angular.element('#chat').css("border-radius", ".3em .3em 0 0")
            angular.element('body').css("width", "100%")
        else
          $timeout ->
              sc.chatDef.fixed = sc.chatDef.open = false
            angular.element('#chat').css("position", "absolute")
            angular.element('#chat').css("border-radius", ".3em .3em 0 0")
            angular.element('body').css("width", "100%")

      sc.atualizaMenuFix()

      sc.parandoDigitar = (obj)->
        $timeout ->
          obj.type = false
        , 4000

      sc.digitando = (obj)->
        obj.type = true
  ]

