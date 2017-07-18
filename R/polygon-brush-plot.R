#' R Shiny Plot With Additional Polygon Brush
#'
#' A reactive input value based on clicks on the jsTree nodes.
#' @param inputID The unique id to set for this element
#' @export
polygonBrushPlot <- function(inputID) {
  fname <- system.file('www','polygon-brush-plot.js',package='CIOShiny')
  #js <- readLines(fname)
  tagList(
    shiny::singleton(
      shiny::tags$head(
        initResourcePaths()
      )
    ),
    shinyjs::useShinyjs(),
    shinyjs::extendShinyjs(script = fname),
    #shiny::singleton(
    #  shiny::tags$head(
    #    shiny::tags$script(src="CIOShiny/polygon-brush-plot.js")
    #  )
    #),
    shiny::tags$div(
      id = inputID,
      type="polygonBrushPlot",
      actionButton('PolygonButton','',icon = icon("pencil",lib = "glyphicon")),
      actionButton('PolygonViewButton','',icon = icon("eye-open",lib = "glyphicon")),
      actionButton('PolygonResetButton','',icon = icon("remove",lib = "glyphicon")),
      plotOutput("GatingPanel",
                   height="100%",
                   click = "gate_click",
                   brush = brushOpts(
                     id = "GateBrush",
                     fill = "#FF1414", 
                     stroke = "#FF1414"
    )))
  )
}
