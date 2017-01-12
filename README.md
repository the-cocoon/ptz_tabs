# PtzTabs

1.

gem 'ptz_tabs', path: './X_GEMS/VIEW/ptz_tabs'

2.

JS

//= require components/ptz-tabs

CSS

/*
  #= require components/ptz-tabs
*/

JS INIT

$(document).on "ready page:load", ->
  PtzTabs.init()

HTML/SLIM

##################################
# Variant 1
##################################

div(ptz_tabs-scope='page_edit')
  .ptz_tabs--item.active(ptz_tab-id='comments') Comments (90)
  .ptz_tabs--item(ptz_tab-id='files') Files (2)
  .ptz_tabs--item(ptz_tab-id='specs') Specs (1)

div(ptz_tabs-scope='page_edit')
  .ptz_tabs--content-item.active(ptz_tab-content='comments')
  .ptz_tabs--content-item(ptz_tab-content='files')
  .ptz_tabs--content-item(ptz_tab-content='specs')

##################################
# Variant 2
##################################

.ptz_tabs(ptz_tabs-scope='page_edit_2')
  .ptz_tabs--holder
    .ptz_tabs--item.ptz_tabs--active(ptz_tab-id='comments') Comments (90)
    .ptz_tabs--item(ptz_tab-id='files') Files (2)
    .ptz_tabs--item(ptz_tab-id='specs') Specs (1)
  .m20
    .ptz_tabs--content-item.ptz_tabs--active(ptz_tab-content='comments')
      | 1
    .ptz_tabs--content-item(ptz_tab-content='files')
      | 2
    .ptz_tabs--content-item(ptz_tab-content='specs')
      | 3
