# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
App.group = App.cable.subscriptions.create "GroupChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    # 通信が確立された時

  disconnected: ->
    # Called when the subscription has been terminated by the server
    # 通信が切断された時

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    # 値を受け取った時
    $('#groupposts').append("<p>"+data["message"]+"</p>"); # 投稿を追加

  speak: (message) ->
    @perform 'speak', message: message　#サーバーサイドのspeakアクションにmessageパラメータを渡す

jQuery(document).on 'keypress', '[data-behavior~=group_speaker]', (event) ->
  if event.keyCode is 13 # return キーのキーコードが13
    App.group.speak [event.target.value, $('[data-member]').attr('data-member'), $('[data-group]').attr('data-group')] # speak メソッド, event.target.valueを引数に.
    event.target.value = ''
    event.preventDefault()


