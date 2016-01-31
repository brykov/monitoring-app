$ ->
  $(document).on 'click', '[data-delete-node]', (e) ->
    $el = $(e.currentTarget)
    swal {
      title: 'Are you sure?'
      text: "You are about to delete the node <strong>#{$el.data('base-url')}</strong><form method='post' action=''><input type='hidden' name='authenticity_token' value=''><input type='hidden' name='_method' value='delete'></form>"
      type: 'warning'
      showCancelButton: true
      confirmButtonText: 'Delete!'
      html: true
    }, ->
      $alert = $('.sweet-alert.showSweetAlert.visible')
      $form = $('form', $alert)
      $form.find('[name=authenticity_token]').val($('meta[name=csrf-token]').attr('content'))
      $form.attr('action', "/nodes/#{$el.data('delete-node')}").submit()

  $(document).on 'click', '[data-shutdown-node]', (e) ->
    $el = $(e.currentTarget)
    swal {
      title: 'Are you sure?'
      text: "You are about to shutdown the node <strong>#{$el.data('base-url')}</strong><form method='post' action=''><input type='hidden' name='authenticity_token' value=''></form>"
      type: 'warning'
      showCancelButton: true
      confirmButtonText: 'Shutdown!'
      html: true
    }, ->
      $alert = $('.sweet-alert.showSweetAlert.visible')
      $form = $('form', $alert)
      $form.find('[name=authenticity_token]').val($('meta[name=csrf-token]').attr('content'))
      $form.attr('action', "/nodes/#{$el.data('shutdown-node')}/shutdown").submit()
