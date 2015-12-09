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
            id: 0
            nome: "Aguardando Atendimento"
            tipo_conta: 'Duvida'
            status: true
            foto: '//www.todaletra.com.br/wp-content/uploads/2012/10/duvidas-300x3001.jpg'
            conversas: [
              {texto: 'Oi',             recebe: true, hora: new Date()}
            ]
          }
          {
            id: 1
            nome: "Aguardando Atendimento"
            tipo_conta: 'Ajuda'
            status: true
            foto: '//www.todaletra.com.br/wp-content/uploads/2012/09/d%C3%BAvida.jpg'
            conversas: [
              {texto: 'Oi',             envia: true, hora: new Date()}
            ]
          }
          {
            id: 2
            nome: "Aguardando Atendimento"
            tipo_conta: 'Ajuda'
            status: true
            foto: '//www.todaletra.com.br/wp-content/uploads/2012/09/d%C3%BAvida.jpg'
            conversas: [
              {texto: 'Oi',             recebe: true, hora: new Date()}
            ]
          }
          {
            id: 3
            nome: "Aguardando Atendimento"
            tipo_conta: 'Duvida'
            status: true
            foto: '//www.todaletra.com.br/wp-content/uploads/2012/10/duvidas-300x3001.jpg'
            conversas: [
              {texto: 'Oi',             envia: true, hora: new Date()}
            ]
          }
        ]
        administracoes: [
          {
            id: 4
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
            id: 5
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
          {
            id: 6
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
          {
            id: 7
            nome: "Relson Mescleu"
            tipo_conta: 'Porteiro'
            status: true
            foto: "//img.ibxk.com.br/2012/1/materias/17166216157.jpg?w=1040&h=585&mode=crop"
            conversas: [
              {texto: 'Olá.',           envia: true, hora: new Date()}
              {texto: 'Olá, tudo bem?', recebe: true, hora: new Date()}
              {texto: 'Tudo.',          envia:  true, hora: new Date()}
              {texto: 'Que bom...',     recebe: true, hora: new Date()}
            ]
          }
          {
            id: 8
            nome: "Relson Mescleu"
            tipo_conta: 'Porteiro'
            status: true
            foto: "//img.ibxk.com.br/2012/1/materias/17166216157.jpg?w=1040&h=585&mode=crop"
            conversas: [
              {texto: 'Olá.',           envia: true, hora: new Date()}
              {texto: 'Olá, tudo bem?', recebe: true, hora: new Date()}
              {texto: 'Tudo.',          envia:  true, hora: new Date()}
              {texto: 'Que bom...',     recebe: true, hora: new Date()}
            ]
          }
          {
            id: 9
            nome: "Relson Mescleu"
            tipo_conta: 'Porteiro'
            status: true
            foto: "//img.ibxk.com.br/2012/1/materias/17166216157.jpg?w=1040&h=585&mode=crop"
            conversas: [
              {texto: 'Olá.',           envia: true, hora: new Date()}
              {texto: 'Olá, tudo bem?', recebe: true, hora: new Date()}
              {texto: 'Tudo.',          envia:  true, hora: new Date()}
              {texto: 'Que bom...',     envia: true, hora: new Date()}
            ]
          }
          {
            id: 10
            nome: "Relson Mescleu"
            tipo_conta: 'Porteiro'
            status: true
            foto: "//img.ibxk.com.br/2012/1/materias/17166216157.jpg?w=1040&h=585&mode=crop"
            conversas: [
              {texto: 'Olá.',           envia: true, hora: new Date()}
              {texto: 'Olá, tudo bem?', recebe: true, hora: new Date()}
              {texto: 'Tudo.',          envia:  true, hora: new Date()}
              {texto: 'Que bom...',     recebe: true, hora: new Date()}
            ]
          }
        ]
        moradores: [
          {
            id: 11
            nome: "Jubileu Tadeu Benzeno"
            status: true
            foto: '//www2.uol.com.br/vivermente/noticias/img/voce_e_uma_pessoa_boa__1__2014-01-08155855.jpg'
            conversas: []
          }
          {
            id: 12
            nome: "Relson Mescleu"
            status: true
            foto: '//www.sitedecuriosidades.com/im/g/CEA60.jpg'
            conversas: [
              {texto: 'Olá.',           envia: true, hora: new Date()}
              {texto: 'Olá, tudo bem?', recebe: true, hora: new Date()}
              {texto: 'Tudo.',          envia:  true, hora: new Date()}
              {texto: 'Que bom...',     recebe: true, hora: new Date()}
            ]
          }
          {
            id: 13
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
            id: 14
            nome: "Body do enzi"
            status: true
            foto: '//pbs.twimg.com/profile_images/453273471234375682/cPc0k7E6.jpeg'
            conversas: []
          }
          {
            id: 15
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
            id: 16
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
            id: 17
            nome: "Anna Maria"
            status: true
            foto: '//www.paranaportal.com.br/wp-content/uploads/2015/06/fernando-pessoa.jpg'
            conversas: []
          }
          {
            id: 18
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
            id: 19
            nome: "Relson Mescleu"
            status: true
            foto: '//mulheresnacomputacao.files.wordpress.com/2015/01/3-pessoas-apontando-cc3a2mera.jpg'
            conversas: []
          }
          {
            id: 20
            nome: "Body do enzi"
            status: true
            foto: '//mulheresnacomputacao.files.wordpress.com/2015/01/3-pessoas-apontando-cc3a2mera.jpg'
            conversas: []
          }
          {
            id: 21
            nome: "Anna Maria"
            status: true
            foto: '//mulheresnacomputacao.files.wordpress.com/2015/01/3-pessoas-apontando-cc3a2mera.jpg'
            conversas: []
          }
        ]

      sc.historyChat = ()->
        conversas = []
        for k, v of sc.users
          if v.length
            conversas.push i for i in v when i.conversas.length
        conversas

      sc.batePapo =
        adm: true
        morador: false
        users: sc.users

      sc.chats = []
      sc.agrupados = []

      sc.openChat = (obj)->
        unless ja_aberto(obj)
          if sc.chats.length >= sc.chatDef.limit
            sc.chatDef.plus = true
            sc.agrupados.push sc.chats[0]
            sc.chats.splice 0, 1, { open: true, params: obj }
          else
            sc.chats.unshift
              open: true
              params: obj
          sc.chatDef.open = false unless sc.chatDef.fixed
          sc.chatDef.chat = true
          unless angular.element('html').outerWidth() >= 480
            angular.element('body').css("overflow", "hidden")
          sc.chatDef.mobile = false
          sc.chatDef.mobile = true if angular.element('html').outerWidth() >= 480
          $timeout ->
            sc.atualizaMenuFix()
          , 500

      sc.fecharChat = (obj, index)->
        obj.splice index, 1
        unless angular.element('html').outerWidth() >= 480
          angular.element('body').css("overflow", "auto")
        sc.atualizaMenuFix()

      ja_aberto = (obj)->
        return true for i in sc.chats when i.params.id == obj.id
        return true for i in sc.agrupados when i.params.id == obj.id
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
        obj.typeMessage ||= ''
        unless obj.typeMessage == ""
          obj.params.conversas.push
            texto: obj.typeMessage
            envia: true
            hora: new Date()

          obj.typeMessage = ''
          obj.params.type = false

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
                  sc.chatDef.open = sc.chatDef.active = true
                  sc.atualizaMenuFix()
              }
            ]

      $(window).resize -> sc.atualizaMenuFix()

      sc.atualizaMenuFix = ()->
        win = angular.element('html')

        listChat = angular.element(".list-chat")
        caixaConversa = angular.element("#caixa-conversa")

        sc.chatDef.limit = parseInt((listChat.outerWidth() / caixaConversa.outerWidth()) - 1.4)

        if sc.chatDef.active
          if win.outerWidth() >= 1500
            $timeout ->
              sc.chatDef.open = sc.chatDef.fixed = true
            angular.element('#chat').css("border-radius", "0")
            angular.element('body').css("width", "calc(100% - 16.25em)")
          else
            $timeout ->
              sc.chatDef.fixed = false
            angular.element('#chat').css("border-radius", ".3em .3em 0 0")
            angular.element('body').css("width", "100%")
        else
          $timeout ->
            sc.chatDef.fixed = sc.chatDef.open = false
          angular.element('#chat').css("border-radius", ".3em .3em 0 0")
          angular.element('body').css("width", "100%")
        if win.outerWidth() <= 480
          sc.chatDef.open = false if sc.chatDef.chat
          sc.chatDef.mobile = false

        reagrupaChat()

      reagrupaChat = ()->
        if sc.chatDef.limit >= 1
          while sc.chats.length > sc.chatDef.limit
            sc.chatDef.plus = true
            sc.agrupados.unshift sc.chats[0]
            sc.chats.splice 0, 1

          while sc.chats.length < sc.chatDef.limit && sc.agrupados.length > 0
              sc.chats.unshift sc.agrupados[0]
              sc.agrupados.splice 0, 1
        else
          sc.agrupados = []
          sc.chatDef.plus = false

        sc.chatDef.plus = sc.agrupados.length > 0

      sc.abrirAgrupados = (obj, index)->
        sc.agrupados.splice index, 1, sc.chats[0]
        sc.chats.splice 0, 1, obj

      sc.atualizaMenuFix()

      typeTimeout = null

      sc.digitando = (obj)->
        obj.params.type = true
        clearTimeout typeTimeout if typeTimeout
        typeTimeout = setTimeout ->
          sc.$apply ->
            obj.params.type = false
        , 900

      sc.minimizeChat = (obj)->
        obj.open = !obj.open if sc.chatDef.mobile
  ]

