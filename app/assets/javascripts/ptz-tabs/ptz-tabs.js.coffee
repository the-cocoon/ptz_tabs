###################################
# Variant 1
###################################
#
# div(ptz_tabs-scope='page_edit')
#   .ptz_tabs--item.active(ptz_tab-id='comments') Comments (90)
#   .ptz_tabs--item(ptz_tab-id='files') Files (2)
#   .ptz_tabs--item(ptz_tab-id='specs') Specs (1)
#
# div(ptz_tabs-scope='page_edit')
#   .ptz_tabs--content-item.active(ptz_tab-content='comments')
#   .ptz_tabs--content-item(ptz_tab-content='files')
#   .ptz_tabs--content-item(ptz_tab-content='specs')

###################################
# Variant 2
###################################
#
# .ptz_tabs(ptz_tabs-scope='page_edit_2')
#   .ptz_tabs--holder
#     .ptz_tabs--item.ptz_tabs--active(ptz_tab-id='comments') Comments (90)
#     .ptz_tabs--item(ptz_tab-id='files') Files (2)
#     .ptz_tabs--item(ptz_tab-id='specs') Specs (1)
#   .m20
#     .ptz_tabs--content-item.ptz_tabs--active(ptz_tab-content='comments')
#       | 1
#     .ptz_tabs--content-item(ptz_tab-content='files')
#       | 2
#     .ptz_tabs--content-item(ptz_tab-content='specs')
#       | 3

@PtzTabs = do ->
  # Init once for Turbolinks
  init: ->
    @inited ||= do =>
      doc  = $ document
      tabs = '[ptz_tab-id]'

      doc.on 'click', tabs, (e) ->
        tab = $ e.target
        return false if tab.hasClass 'ptz_tabs--active'

        tabs_scope = tab.parents('[ptz_tabs-scope]').first().attr('ptz_tabs-scope')
        return false unless tabs_scope

        tab_id = tab.attr('ptz_tab-id')
        window.location.hash = "ptz_tabs--#{ tabs_scope }--#{ tab_id }"

        tabs          = $("[ptz_tabs-scope=#{ tabs_scope }] [ptz_tab-id]")
        atabs         = $("[ptz_tabs-scope=#{ tabs_scope }] [ptz_tab-id=#{ tab_id }]")
        content_items = $("[ptz_tabs-scope=#{ tabs_scope }] [ptz_tab-content]")

        content_item  = content_items.filter("[ptz_tab-content=#{ tab_id }]")
        return false if content_item.length is 0

        tabs.removeClass('ptz_tabs--active')
        atabs.addClass('ptz_tabs--active')

        content_items.removeClass('ptz_tabs--active')
        content_item.addClass('ptz_tabs--active')

        content_items.hide()
        content_item.show()

    # ACTIVATE TAB if need
    if window.location.hash.length > 0
      anchor = window.location.hash
      anchor = anchor.slice(1, anchor.lenght)
      anchor = anchor.split('ptz_tabs--')

      if anchor.length > 1
        [scope, id]= anchor[1].split('--')
        $("[ptz_tabs-scope=#{ scope }] [ptz_tab-id=#{ id }]").click()
