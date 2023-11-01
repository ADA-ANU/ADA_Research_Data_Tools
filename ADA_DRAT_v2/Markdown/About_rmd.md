---
title: "Inline Output in R Markdown Documents"
author: "Yihui Xie"
runtime: shiny
output: html_document
---

Since **shiny** 0.10.1, you can embed inline output elements. We have added an argument `inline` to a few output functions such as `textOutput()`, `plotOutput()`, and `uiOutput()`. This argument will be set to `TRUE` automatically when these types of output are rendered in the inline R expressions of R Markdown documents, e.g. `` `r renderText(input$foo)` ``.

First we show a normal shiny app, with a select input to change the title of a plot, and a slider to change the size of points:


```r
library(shiny)
sidebarLayout(
  sidebarPanel(
    selectizeInput('main', 'Main title', LETTERS),
    sliderInput('size', 'Point size', min = 0.2, max = 5, value = 1)
  ),
  mainPanel(
    renderPlot(plot(cars, main = input$main, cex = input$size, pch = 19),
               width = 600, height = 400)
  )
)
```

<!--html_preserve--><div class="row">
<div class="col-sm-4">
<form class="well" role="complementary">
<div class="form-group shiny-input-container">
<label class="control-label" id="main-label" for="main">Main title</label>
<div>
<select id="main" class="form-control"><option value="A" selected>A</option>
<option value="B">B</option>
<option value="C">C</option>
<option value="D">D</option>
<option value="E">E</option>
<option value="F">F</option>
<option value="G">G</option>
<option value="H">H</option>
<option value="I">I</option>
<option value="J">J</option>
<option value="K">K</option>
<option value="L">L</option>
<option value="M">M</option>
<option value="N">N</option>
<option value="O">O</option>
<option value="P">P</option>
<option value="Q">Q</option>
<option value="R">R</option>
<option value="S">S</option>
<option value="T">T</option>
<option value="U">U</option>
<option value="V">V</option>
<option value="W">W</option>
<option value="X">X</option>
<option value="Y">Y</option>
<option value="Z">Z</option></select>
<script type="application/json" data-for="main">{"plugins":["selectize-plugin-a11y"]}</script>
</div>
</div>
<div class="form-group shiny-input-container">
<label class="control-label" id="size-label" for="size">Point size</label>
<input class="js-range-slider" id="size" data-skin="shiny" data-min="0.2" data-max="5" data-from="1" data-step="0.05" data-grid="true" data-grid-num="9.6" data-grid-snap="false" data-prettify-separator="," data-prettify-enabled="true" data-keyboard="true" data-data-type="number"/>
</div>
</form>
</div>
<div class="col-sm-8" role="main">
<div id="out11830b32373bf361" class="shiny-plot-output" style="width:100%;"></div>
</div>
</div><!--/html_preserve-->

Now we use `renderText()` to render the plot title and point size in this paragraph. The main title is **<!--html_preserve--><span id="out0a6fb3dbb7b4bcd3" class="shiny-text-output"></span><!--/html_preserve-->** and the point size is **<!--html_preserve--><span id="outf7612811dbeac723" class="shiny-text-output"></span><!--/html_preserve-->**.

Besides `renderText()`, you can also embed some other output elements inline. We define a function to draw the `sunspots` data, with the aspect ratio value from a slider:


```r
sunspots_line = function() {
  par(mar = rep(0, 4))
  plot(sunspots, axes = FALSE, ann = FALSE, asp = input$asp)
}
sunspots_width = function() {
  if (input$asp <= 0.11) 300 else 30/input$asp
}
sliderInput('asp', 'Change the aspect ratio', .02, .3, .2)
```

<!--html_preserve--><div class="form-group shiny-input-container">
<label class="control-label" id="asp-label" for="asp">Change the aspect ratio</label>
<input class="js-range-slider" id="asp" data-skin="shiny" data-min="0.02" data-max="0.3" data-from="0.2" data-step="0.002" data-grid="true" data-grid-num="10" data-grid-snap="false" data-prettify-separator="," data-prettify-enabled="true" data-keyboard="true" data-data-type="number"/>
</div><!--/html_preserve-->

Here is a spark line <!--html_preserve--><span id="out8d8179b39f9d0656" class="shiny-plot-output"></span><!--/html_preserve--> that shows you the time series `sunspots`. Note when you render inline plots, you must provide both `width` and `height` values (in pixels), because it is not possible for **shiny** to figure out the width and height values automatically in this case. We used `40` as the fixed height here, and a changing width (calculated from the function `sunspots_width()`) depending on the aspect ratio.
