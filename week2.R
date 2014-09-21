library(datasets)


##### LATTICE #####
library(lattice)

## Simple scatterplot
xyplot(Ozone ~ Wind, data = airquality)

airquality <- transform(airquality, Month = factor(Month))
xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5, 1))


set.seed(10)
x <- rnorm(100)
f <- rep(0:1, each = 50)
y <- x + f - f * x + rnorm(100, sd = 0.5)
f <- factor(f, labels = c("Group 1", "Group 2"))
xyplot(y ~ x | f, layout = c(2, 1))

## Custom panel function
xyplot(y ~ x | f, panel = function(x, y, ...) {
    panel.xyplot(x, y, ...) ## First call the default panel function for 'xyplot'
    panel.abline(h = median(y), lty = 2) ## Add a horizontal line at the median
    panel.lmline(x, y, col = 2) ## Overlay a simple linear regression line
})

#### QUIZ ####
xyplot(weight ~ Time | Diet, BodyWeight)

##### GGPLOT 2 #####
library(ggplot2)

qplot(displ, hwy, data = mpg) ## scatter plot
qplot(displ, hwy, data = mpg, color = drv) ## scatter plot with colored variable
qplot(displ, hwy, data = mpg, geom = c("point", "smooth")) ## scatter plot with additional stat geoms
qplot(hwy, data = mpg, fill = drv) ## histogram
qplot(displ, hwy, data = mpg, facets = . ~ drv) ## multifaceted plot split by drv as columns
qplot(hwy, data = mpg, facets = drv ~ ., binwidth = 2) ## multifaceted histogram split by drv as rows
qplot(hwy, data = mpg, facets = drv ~ cyl, binwidth = 2) ## drv as rows, cyl as columns




#### QUIZ ####
airquality = transform(airquality, Month = factor(Month))
qplot(Wind, Ozone, data = airquality, facets = . ~ Month)

qplot(votes, rating, data = movies) + geom_smooth()