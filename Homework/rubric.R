# Creating rubric object that can be used site-wide

library(tidyverse)
library(gt)

## homework

rubric_table <- tibble(Evaluation = c("Didn't turn anything in.", 
                                "Low effort, assignment ignores many directions.", 
                                "Decent effort, assignment follows most of the directions but some parts are missing without comment.", 
                                "Good effort, assignment follows the directions even if there are errors in some of the implementation."), 
                 Points = 0:3)

rubric <- rubric_table |>  
  gt() |> 
  # tab_options(table.font.names = c("Quattrocento", "Raleway")) |>
  cols_align(align = "center") |> 
  # Color each evaluation
  tab_style(style = cell_fill(color = "#E0454592"),
            locations = cells_body(rows = Points == 0)) |>
  tab_style(style = cell_fill(color = "#F2ED5779"),
            locations = cells_body(rows = Points == 1)) |>
  tab_style(style = cell_fill(color = "#66BDBDAF"),
            locations = cells_body(rows = Points == 2)) |>
  tab_style(style = cell_fill(color = "#4F79A8B1"),
            locations = cells_body(rows = Points == 3)) |>
  # Change label font style
  cols_label(Evaluation = md("**Evaluation**"), 
             Points = md("**Points**")) |> 
  # Adding border around label row
  tab_style(style = cell_borders(sides = "top",  weight = px(2)),
            locations = cells_column_labels()) |> 
  tab_style(style = cell_borders(sides = "left",  weight = px(2)),
            locations = list(cells_column_labels(columns = "Evaluation"),
                             cells_body(columns = "Evaluation"))) |> 
  tab_style(style = cell_borders(sides = "right",  weight = px(2)),
            locations = list(cells_column_labels(columns = "Points"), 
                             cells_body(columns = "Points"))) |> 
  tab_style(style = cell_borders(sides = "bottom",  weight = px(2)),
            locations = cells_body(rows = Points == 3))

## peer review

peer_review_table <- tibble(Evaluation = c("Didn't follow all peer-review instructions.", 
                                           "Peer review is at least four sentences long, <br> 
                                           kindly mentions and explains any key issues with the assignment, <br> 
                                           points out at least one positive thing in your <br> 
                                           peer’s work, and clearly states the number of points earned."),
                            Points = 0:1)

peer_review_rubric <- peer_review_table |> 
  gt() |> 
  # tab_options(table.font.names = c("Quattrocento", "Raleway")) |>
  cols_align(align = "center") |> 
  # Color each evaluation
  tab_style(style = cell_fill(color = "#F2ED5779"),
            locations = cells_body(rows = Points == 0)) |>
  tab_style(style = cell_fill(color = "#66BDBDAF"),
            locations = cells_body(rows = Points == 1)) |>
  # Change label font style
  cols_label(Evaluation = md("**Evaluation**"), 
             Points = md("**Points**")) |> 
  # Adding border around label row
  tab_style(style = cell_borders(sides = "top",  weight = px(2)),
            locations = cells_column_labels()) |> 
  tab_style(style = cell_borders(sides = "left",  weight = px(2)),
            locations = list(cells_column_labels(columns = "Evaluation"),
                             cells_body(columns = "Evaluation"))) |> 
  tab_style(style = cell_borders(sides = "right",  weight = px(2)),
            locations = list(cells_column_labels(columns = "Points"), 
                             cells_body(columns = "Points"))) |> 
  tab_style(style = cell_borders(sides = "bottom",  weight = px(2)),
            locations = cells_body(rows = Points == 1)) |> 
  fmt_markdown(columns = TRUE)
