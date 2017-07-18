self <- new.env()

initResourcePaths <- function () {
  if (is.null(self$loaded)) {
    shiny::addResourcePath(
      prefix = 'CIOShiny',
      directoryPath = system.file('www',package='CIOShiny'))
    self$loaded <- TRUE
  }
  shiny::HTML("")
}
