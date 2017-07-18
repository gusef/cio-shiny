require(jsonlite)
require(data.table)
require(shiny)

#' R Shiny Input using a jsTree to select a node
#'
#' A reactive input value based on clicks on the jsTree nodes.
#' @param inputID The unique id to set for this element
#' @param df A dataframe with 'id', 'text', 'parent', and 'value' fields
#' @param select The id of the node to default as selected (unless id is not used, then it is the text)
#' @export
jsTreeSelectorInput <- function(inputID,df=NULL,selected=NULL) {
  if (is.null(df)) { df = data.table::rbindlist(list(list(id="ALL")),fill=TRUE); }
  tagList(
    shiny::singleton(
      shiny::tags$head(
        initResourcePaths()
      )
    ),
    shiny::singleton(
      shiny::tags$head(
        shiny::tags$script(src="CIOShiny/vakata-jstree-a6a0d0d/dist/jstree.js")
      )
    ),
    shiny::singleton(
      shiny::tags$head(
        shiny::tags$link(rel="stylesheet",type="text/css",href="CIOShiny/vakata-jstree-a6a0d0d/dist/themes/default/style.css")
      )
    ),
    shiny::singleton(
      shiny::tags$head(
        shiny::tags$script(src="CIOShiny/jstree-selector-input.js")
      )
    ),
    shiny::tags$div(id = inputID,type="jsTreeSelectorInput"),
    shiny::tags$script(paste('initjsTreeSelectorInput("#',inputID,'",',"'",toJSON(df),"','",toJSON(selected),"'",')',sep=''))

    )
}

#' update an existing jsTreeSelectorInput
#'
#' A reactive input value based on clicks on the jsTree nodes.
#' @param session The session this input is part of
#' @param inputID The unique id to set for this element
#' @param df A dataframe to replace the current one with 'id', 'text', 'parent', and 'value' fields
#' @param select The id of the node to default as selected (unless id is not used, then it is the text)
#' @export
updatejsTreeSelectorInput <- function(session, inputID, df, selected=NULL) {
  message <- toJSON(list(data=df,selected=selected))
  session$sendInputMessage(inputID,message)
}
