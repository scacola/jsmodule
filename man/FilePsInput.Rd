% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/FilePsInput.R
\name{FilePsInput}
\alias{FilePsInput}
\title{FilePsInput: Shiny module UI for propensity score analysis.}
\usage{
FilePsInput(id, label = "Upload data (csv/xlsx/sav/sas7bdat/dta)")
}
\arguments{
\item{id}{A string, the module id.}

\item{label}{A string, the label for the file input.}
}
\value{
A Shiny UI object.
}
\description{
Provides a file input and UI outputs for options related to
propensity score matching.
}
\examples{
if (interactive()) {
  library(shiny)
  library(DT)
  library(jstable)

  ui <- fluidPage(
    sidebarLayout(
      sidebarPanel(
        FilePsInput("datafile")
      ),
      mainPanel(
        tabsetPanel(
          type = "pills",
          tabPanel("Data", DTOutput("data")),
          tabPanel("Matching data", DTOutput("matdata")),
          tabPanel("Label", DTOutput("data_label"))
        )
      )
    )
  )

  server <- function(input, output, session) {
    mat_info <- callModule(FilePs, "datafile")

    output$data <- renderDT({ mat_info()$data })
    output$matdata <- renderDT({ mat_info()$matdata })
    output$data_label <- renderDT({ mat_info()$label })
  }
  shinyApp(ui, server)
}
}
