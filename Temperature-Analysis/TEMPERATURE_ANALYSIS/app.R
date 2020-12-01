library(shiny)
library(ggplot2)
library(fresh)
library(bs4Dash) 
library(readr)
library(plotly)
library(plyr)
library(reshape2)
library(waiter)

hyderabad <- read.csv("D:/Datasets/hyderabad.csv")
bengaluru <- read.csv("D:/Datasets/bengaluru.csv")
bombay <- read.csv("D:/Datasets/bombay.csv")
delhi <- read.csv("D:/Datasets/delhi.csv")
jaipur <- read.csv("D:/Datasets/jaipur.csv")
kanpur <- read.csv("D:/Datasets/kanpur.csv")
nagpur <- read.csv("D:/Datasets/nagpur.csv")
pune <- read.csv("D:/Datasets/pune.csv")
.theme<- theme(
  axis.line = element_line(colour = 'gray', size = .75),
  panel.background = element_blank(),
  plot.background = element_blank()
)


shiny::shinyApp(
  ui = bs4DashPage(
    navbar = bs4DashNavbar(
      skin = "dark",
      status = "dark",
      border = TRUE,
      sidebarIcon = "bars",
      controlbarIcon = "th",
      fixed = FALSE,
      leftUi = bs4DropdownMenu(
        show = FALSE,
        align = "left",
        status = "warning",
        menuIcon = "envelope-open",
        src = NULL
      ),
      rightUi =
        
        bs4DropdownMenu(
          show = FALSE,
          status = "danger",
          src = "https://www.google.fr",
          bs4DropdownMenuItem(
            message = "message 1",
            from = "Ranjith",
            src = "https://static.vecteezy.com/system/resources/previews/000/142/007/original/headshot-of-smiling-young-man-with-beard-vector.jpg",
            time = "today",
            status = "danger",
            type = "message"
          ), bs4DropdownMenuItem(
            message = "message 1",
            from = "Merin",
            src = "https://static.vecteezy.com/system/resources/previews/000/141/702/original/headshot-of-smiling-beautiful-employee-vector.jpg",
            time = "3 Days ago",
            status = "success",
            type = "message"
          ), bs4DropdownMenuItem(
            message = "message 1",
            from = "Glennis",
            src = "https://static.vecteezy.com/system/resources/previews/000/142/014/non_2x/headshot-of-smiling-women-with-orange-dress-vector.jpg",
            time = "4 Days ago",
            status = "danger",
            type = "message"
          ),
          bs4DropdownMenuItem(
            message = "message 2",
            from = "Brinda",
            src = "https://static.vecteezy.com/system/resources/previews/000/141/732/non_2x/headshot-of-smiling-older-lady-vector.jpg",
            time = "5 Days ago",
            status = "success",
            type = "message"
          )
        )
    ),
    sidebar = bs4DashSidebar(
      bs4SidebarMenu( skin = "light",
                      status = "primary",
                      brandColor = "primary",
                      show = FALSE,
                      elevation = 3,
                      opacity = 0,
                      bs4SidebarUserPanel(
                        img = "https://www.svgrepo.com/show/276664/cloudy-day-weather.svg",
                        text = "TEMPERATURE ANALYSIS"
                      ),
                      bs4SidebarHeader( 
                        title = "Welcome to DashBoard!"
                      ), 
                      
                      bs4SidebarMenuItem(text = "MAinPage",
                                         icon ="bars",
                                         startExpanded = TRUE,
                                         
                                         bs4SidebarMenuSubItem(text = "mainpage",
                                                               tabName = "item0",
                                                               icon = "files-o")),
                      bs4SidebarHeader("List of items 1"),
                      bs4SidebarMenuItem(
                        text = "Item List",
                        icon = "bars",
                        startExpanded = TRUE,
                        
                        bs4SidebarMenuSubItem(
                          text = "Home",
                          tabName = "item1",
                          icon = "home"
                        ),bs4SidebarMenuItem(text = "Select Options", icon = "th-list", 
                                             startExpanded = FALSE,
                                             bs4Card(width = 16,
                                                     bs4dash_sidebar_light(fileInput("file1", "Choose CSV File",
                                                                                     multiple = TRUE,
                                                                                     accept = c("text/csv",
                                                                                                "text/comma-separated-values,text/plain",
                                                                                                ".csv")),
                                                                           
                                                                           checkboxInput("header", "Header", TRUE),
                                                                           
                                                                           
                                                                           radioButtons("sep", "Separator",
                                                                                        choices = c(Semicolon = ";",
                                                                                                    Comma = ",",
                                                                                                    Tab = "\t"),
                                                                                        selected = ","),
                                                                           
                                                                           tags$hr(),
                                                                           
                                                                           
                                                                           
                                                                           selectInput("dataset","Data:",
                                                                                       choices =list(hyderabad = "hyderabad",bombay="bombay",bengaluru = "bengaluru",delhi="delhi",
                                                                                                     pune = "pune" , kanpur="kanpur",nagpur= "nagpur" ,jaipur = "jaipur",iris = "iris", mtcars = "mtcars",
                                                                                                     uploaded_file = "inFile"), selected=NULL),
                                                                           selectInput("group","Variable-X:", choices = NULL),
                                                                           selectInput("variable","Variable-Y:", choices = NULL),
                                                                           selectInput("plot.type","Plot Type:",
                                                                                       list(boxplot = "boxplot", histogram = "histogram", density = "density", bar = "bar")
                                                                           ),
                                                                           checkboxInput("show.points", "show points", TRUE)))),
                        bs4SidebarMenuSubItem(
                          text = "Data's",
                          tabName = "item2",
                          icon = "table"
                        ),bs4SidebarMenuItem(text = "DataSet", icon = "th-list", 
                                             startExpanded = FALSE,
                                             bs4Card(width = 16,
                                                     bs4dash_sidebar_dark(
                                                       
                                                       # Input: Numeric entry for number of obs to view ----
                                                       numericInput(inputId = "obs",
                                                                    label = "Number of observations to view:",
                                                                    value = 10))))
                      ),
                      
                      bs4SidebarHeader("List of items 2"),
                      bs4SidebarMenuItem(
                        text = "Item List 2",
                        icon = "bars",
                        startExpanded = TRUE,
                        #active = FALSE,
                        bs4SidebarMenuSubItem(
                          text = "Analysis",
                          tabName = "item4",
                          icon = "a fa-bar-chart-o"
                        ),
                        bs4SidebarMenuSubItem(
                          text = "Info",
                          tabName = "item5",
                          icon = "info"
                        )
                      )
      )
    ),
    controlbar = bs4DashControlbar(),
    footer = bs4DashFooter(),
    title = "test",
    body = bs4DashBody(
      
      
      bs4TabItems(
        bs4TabItem( tabName = "item0",
                    fluidPage(  img(src = "https://i.ibb.co/YQ3sxGb/ranji.png" , height = 1200, width = 1600))),
        bs4TabItem(
          tabName = "item1",
          fluidRow( bs4ValueBox(
            value = "22 to 28°C./24°Cand35°C",
            elevation = 3,
            subtitle = "MAX/MIN Temparature",
            status = "danger",
            icon = "temperature-low",
            href = "https://www.meteoblue.com/en/weather/map/maxmintemp/india",
            width = 4
          ),
          bs4ValueBox(
            value = "1010.1mb.",
            elevation = 3,
            subtitle = "Pressure",
            status = "primary",
            icon = "cloud-meatball",
            href = "https://www.meteoblue.com/en/weather/map/pressure/india",
            width = 4
          ),
          
          bs4ValueBox(
            value = "12.4 hours.",
            elevation = 3,
            subtitle = "SunHour",
            status = "warning",
            icon = "sun",
            href = "https://www.meteoblue.com/en/weather/map/solarradiation/india",
            width = 4
          )
          
          ),
          
          bs4Card(
            title = "GRAPH-PLOT", 
            
            closable = TRUE, 
            width = 12,elevation = 3,
            solidHeader = TRUE, 
            status = "primary",
            collapsible = TRUE,
            bs4Badge(
              position = "right",
              status = "warning",
              "PLoTTING TYPES"),
            h3(textOutput("caption")),
            #h3(htmlOutput("caption")),
            uiOutput("plot"), # depends on input
            
            p("Box Content")
            
          )
        ),
        bs4TabItem(
          tabName = "item2",
          bs4Card(icon = "fa-table ",
                  title = "Dataset Summary Table:",
                  ribbon = TRUE,
                  closable = TRUE, 
                  width = 6,
                  solidHeader = TRUE, 
                  status = "warning",
                  collapsible = TRUE,verbatimTextOutput("summary"),
                  
                  
                  p("Box Content")
          ), bs4Card(
            icon = "fa-table ",
            title = "DATA TABLE:",
            ribbon = TRUE,
            closable = TRUE, 
            width = 16,
            solidHeader = TRUE, 
            status = "warning",
            collapsible = TRUE,
            
            
            tableOutput("view"),
            p("Box Content")
          )
          
        ),
        
        bs4TabItem(
          tabName = "item4",
          bs4TabSetPanel(id ="tab" ,side = "center",
                         
                         
                         
                         bs4TabPanel(tabName = "MUMBAI WEATHER ANALYSIS",
                                     bs4Card(icon = "fa-table ",
                                             title = "ANALYSIS:",
                                             elevation = 3,
                                             ribbon = TRUE,
                                             closable = TRUE, 
                                             width = 12,
                                             solidHeader = TRUE, 
                                             status = "warning",
                                             collapsible = TRUE,
                                             fluidRow( mainPanel(width = 11,absolutePanel(width = 20,bottom = 1, right = -150, top = -100),
                                                                 h1(span("PROJECT REPORT
ANALYSIS OF VARIATION IN TEMPERATURE
MUMBAI CITY (2015-2020)", style = "color:#0cb330")),
                                                                 h2(span("Introduction:")),
                                                                 h3(span(" ")),(h4(p("The climate of Mumbai is tropical and is characterized by hot, humid weather with long
sunHours. It lies on the coast of Arabian sea. Since it is a coastal city, the air is highly
humid. The city falls on the windward side of the Western Ghats and thus experiences
heavy rainfall from the incoming south-west monsoon winds. The monsoon rains set in
between June and September. Due to it’s maritime location, it does not experience severe
winters. From December to January, the weather is dry, warm, and pleasant during the
day, and mild in the evenings. May is the hottest month. This means the daily maximum
hovers around 34.5 °C and the daily low is 29.1 °C. January is the coldest month of the
year for Mumbai with mean daily minimum being 16.4 °C and mean daily maximum
being 30.1 °C. On average, July is the wettest month and March is the driest month. The
average precipitation in the city is around 242.2cm .
    "),align ="justify")),
                                                                 h3(span("ANALYSIS AND INTERPRETATION:  ")),(h4(p("The original dataset contained around 26 parameters. Here, in this project we wish to
study and analyse the variation of temperature with respect to each of the parameters
present in our dataset. Simple Linear Regression had been applied to our data considering
tempC as the dependent variable. The Adjusted R-Squared value is significantly less for
the Simple Linear Regression Model which suggests that the model does not have a good
fit. Therefore, Multiple Linear Regression has been applied and the Adjusted R-Squared
Value is 0.8932 which suggests a good fit. Based on the p-value (at 5 % level of
significance) and corrplot, the parameters that have been selected for studying and
understanding the variation are listed as follows:  "),align ="justify")),
                                                                 h3(span("* maxTempC- (p-value : 0.2*10
-16 correlation value :")),(h4(p("(0.5880154) refers to the
maximum temperature recorded. Measured in Degree Celsius.
 "),align ="justify")),
                                                                 h3(span("* minTempC- (p-value : 0.2*10
-16 correlation value:")),(h4(p("(0.51059462)refers to the
minimum temperature recorded. Measured in Degree Celsius.
"),align ="justify")),
                                                                 h3(span("* FeelsLikeC- (p-value : 0.2*10
-16 correlation value:")),(h4(p("(0.94213123)The feels like
temperature is a measurement of how hot or cold it really feels like outside. The
“Feels Like” temperature relies on environmental data including the ambient air
temperature, relative humidity, and wind speed to determine how weather
conditions feel to bare skin. It is measured in degrees Celsius.
  "),align ="justify")),
                                                                 h3(span("* SunHour- (p-value : 0.2*10
-16 correlation value:")),(h4(p("0.23621959)refers to the solar
insolation which a particular location would receive if the sun were shining at its
maximum value for a certain number of hours. Though the correlation value is
less, this parameter has been considered because Mumbai has a tropical climate ."),align ="justify")),
                                                                 h3(span("* UvIndex.1-(p-value : 0.2*10
-16 correlation value:")),(h4(p("(0.77908562)The UV Index
represents the amount of skin-damaging UV radiation reaching the earth's surface
at any instant of time. The basic UV Index forecast is given for solar noon — the
sun's highest point in the sky and the time of the highest fluctuation in UV
radiation (under clear sky conditions). "),align ="justify")),
                                                                 h3(span("* WindDirDegree-(p-value : 0.2*10
-16 correlation value:")),(h4(p("(0.48977288)Refers to the
direction of the approaching south-west monsoon winds which is the primary
cause of rainfall in Mumbai city. Though the correlation value is less, this
parameter has been considered because Mumbai lies on the windward side of the
western Ghats. The wind direction degree helps to understand the impact and
hence the total amount of precipitation experienced.
 "),align ="justify")),
                                                                 h3(span("* Humidity- (p-value : 0.2*10
-16 correlation value:  ")),(h4(p("(-0.25691379)refer to the
amount of moisture present in the air. We have expressed humidity in terms of %.
Though the correlation value is less, this parameter has been considered because
Mumbai has a coastal location. Therefore, the level of humidity is an important
factor to understand the variation in temperature. "),align ="justify")),
                                                                 h3(span("* HeatIndexC- (p-value : 0.2*10
-16 correlation value: ")),(h4(p(": 0.93937543)The heat index,
also known as the apparent temperature, is what the temperature feels like to the
human body when relative humidity is combined with the air temperature. It is
measured in degrees Celsius.
 "),align ="justify")),
                                                                 
                                                                 
                                                                 h3(span(" ")),(h4(p("The coefficient of the above significant predictor variables have been obtained to
understand the effect on tempC for per unit change of these parameters. The coefficients
of the selected parameters have been listed in a tabular format: "),align ="justify")),  
                                                                 
                                                                 img(src = "https://i.ibb.co/0sR6Kqp/Screenshot-20201130-070747498-1-1.jpg" , height = 500, width = 1000),
                                                                 
                                                                 h3(span("Therefore, the regression equation can be framed as:
 ")),(h4(p("tempC = 9.26 + 0.0407*maxtempC + 0.286*mintempC + 0.629*FeelsLikeC -
0.044*humidity + 0.195*uvIndex.1 - 0.672*HeatIndexC + 0.1555*sunHour +
0.00168*winddirDegree + 0.57*WindChillC "),align ="justify")), 
                                                                 h3(span(" ")),(h4(p("We can say that if the maxtempC increases by one degree, the tempC increases by
0.0407 Degrees considering that remaining all the other independent variables are
kept constant.
“+” Indicates an increase and “-” Indicates a decrease."),align ="justify")),    
                                                                 
                                                                 
                                                                 br(),
                                                                 h1(span("YEARLY ANALYSIS OF THE PARAMETERS: (using BoxPlot)", style = "color:#5496ff")),
                                                                 h2(span("City-Mumbai:", style = "color:#d9aa1e")),
                                                                 br(),
                                                                 h3(span("*	TempC: ")),
                                                                 img(src = "https://i.ibb.co/JKdQLrD/tempc.png" , height = 500, width = 1000),
                                                                 (h4(p("For all the years 2015-20, the distribution is right-skewed which means the variation is more in the upper 50% of the data as (Q3 - Q2)>(Q2-Q1). Since the temperature has been recorded on an hourly basis for our dataset. Therefore, for a given day if the mean tempC recorded is above the median value, there is more variation in the hourly recorded temperature for that particular day. The boxplots for the years 2015,2016 and 2017 are significantly thick compared to the others which states enough variation is present and also the prediction might not be very accurate. The year 2020 shows the presence of outliers as well."),align ="justify")),
                                                                 h3(span("*	Humidity: ")),
                                                                 img(src = "https://i.ibb.co/Mk5TRn4/humidity.png" , height = 500, width = 1000),
                                                                 (h4(p("For the year 2015, 2017 and 2018 it  is left-skewed which means more variation has been observed in the lower 50% of the observation. The years 2016 , 2019 and 2020  are right-skewed. As the boxplot for the year 2018 is considerably thin, it states that the variation is less and it is more consistent compared to the remaining years.  Note: Year 2020 has observations only from the month of January."),align ="justify")),
                                                                 h3(span("*	MaxtempC: ")),
                                                                 img(src = "https://i.ibb.co/LRr0TPx/maxtempC.png" , height = 500, width = 1000),
                                                                 (h4(p("No variation has been observed in the maximum temperature that has been recorded over the last four years from 2015-2019.  All the maximum temperatures recorded on an hourly basis for the years are approximately equal to the median value. The year 2020 shows a left-skewed boxplot which means more variation in the lower quartiles has been observed. "),align ="justify")),
                                                                 (h4(p("Note: Year 2020 has observations only from the month of January. "),align ="justify")),
                                                                 h3(span("*	MintempC: ")),
                                                                 img(src = "https://i.ibb.co/41DWf2Z/MintempC.png" , height = 500, width = 1000),
                                                                 (h4(p("No variation has been observed in the minimum temperature that has been recorded over the last four years from 2015-2019. All the minimum temperatures recorded on an hourly basis for the years are approximately equal to the median value. The year 2020 shows an uniformly skewed boxplot.  "),align ="justify")),
                                                                 (h4(p("Note: Year 2020 has observations only from the month of January. "),align ="justify")),
                                                                 h3(span("* FeelsLikeC: ")),
                                                                 img(src = "https://i.ibb.co/my44mFk/Feels-Like-C.png" , height = 500, width = 1000),
                                                                 (h4(p("We can clearly say that the median FeelsLikeC is varying considerably over the years. All the years except 2015 and 2019 have a right skewed boxplot which means variation is more in the upper 50%  of the observations. The years 2015 and 2019 have a uniformly skewed boxplot.The year 2018 has a very thin boxplot which states the variation is less and it is consistent as opposed to the year 2016 where the variation will be much higher since the boxplot is thicker. Year 2020 shows presence of outliers. "),align ="justify")),
                                                                 (h4(p("Note: Year 2020 has observations only from the month of January. "),align ="justify")),
                                                                 h3(span("*  SunHour: ")),
                                                                 img(src = "https://i.ibb.co/WKmJ9WH/sunHour.png" , height = 500, width = 1000),
                                                                 (h4(p("The sunHour recorded over the last four years (2015-2020) shows no significant variation. All the observations recorded are approximately equal to the median value. The year 2020 has a left-skewed boxplot which means more variation in the lower 50% of the observation. It also contains an unusually higher number of outliers. "),align ="justify")),
                                                                 (h4(p("Note: Year 2020 has observations only from the month of January. "),align ="justify")),
                                                                 h3(span("* UvIndex.1: ")),
                                                                 img(src = "https://i.ibb.co/ggB43zH/uvindex-1.png" , height = 500, width = 1000),
                                                                 (h4(p("All the boxplots are highly left-skewed which means significant variation in the lower 50% of the observation.  The boxplots are highly thick which suggests a high range, enough variation and lack of consistency. The median value of all the years also varies . "),align ="justify")),
                                                                 (h4(p("Note: Year 2020 has observations only from the month of January. "),align ="justify")),
                                                                 h3(span("*  HeatIndexC: ")),
                                                                 img(src = "https://i.ibb.co/9TtQ5Fr/Heat-Index-C.png" , height = 500, width = 1000),
                                                                 (h4(p("The years 2015, 2016, 2017, 2018 and 2020 show a right-skewed box plot suggesting variation is high in the upper 50% of the observation. The boxplot for the year 2019 is uniformly skewed. The boxplot of the year 2020 contains outliers. Boxplot for the year 2015 is comparatively  thinner which suggests a low range and better consistency(i.e less of variation). "),align ="justify")),
                                                                 (h4(p("Note: Year 2020 has observations only from the month of January. "),align ="justify")),
                                                                 h3(span("* WinddirDegree: ")),
                                                                 img(src = "https://i.ibb.co/HgRcGYx/winddir-Degree.png" , height = 500, width = 1000),
                                                                 (h4(p("The year 2015, 2018 and 2020 are left-skewed and the years 2016, 2017 and 2019 are right skewed. All the boxplots suggest that over the five years the range of the wind direction( in degrees) is considerably high suggesting lack of consistency and presence of high amount of variation. "),align ="justify")),
                                                                 (h4(p("Note: Year 2020 has observations only from the month of January. "),align ="justify")),
                                                                 h3(span("*  WindChillC: ")),
                                                                 img(src = "https://i.ibb.co/qyj79P5/Wind-Chill-C.png" , height = 500, width = 1000),
                                                                 (h4(p("The boxplot for the years 2015, 2016, 2017, 2018 and 2019  are right-skewed. The boxplot of the year 2020 though uniformly skewed contains outliers. The boxplot for the 2018 is very thin which suggests less variation and more consistency compared to the other plots.  "),align ="justify")),
                                                                 (h4(p("Note: Year 2020 has observations only from the month of January. "),align ="justify")),
                                                                 br(),
                                                                 h1(span("RESULTS:", style = "color:#5496ff")),
                                                                 h3(span("2015 Results:")),
                                                                 h4(span("●	Mean maxtempC: 28 ℃")),
                                                                 h4(span("●	Mean mintempC: 20 ℃")),
                                                                 h4(span("●	Mean sunHour: 11 Hours")),
                                                                 h4(span("●	Mean uvIndex.1: 6")),
                                                                 h4(span("●	Mean FeelsLikeC: 25.04 ℃")),
                                                                 h4(span("●	Mean Humidity: 61.42 %")),
                                                                 h4(span("●	Mean HeatIndexC: 26")),
                                                                 h4(span("●	Mean winddirDegree: 209.3 °")),
                                                                 h4(span("●	Mean WindChillC : 24.62°")),
                                                                 
                                                                 h3(span("2016 Results:")),
                                                                 h4(span("●	Mean maxtempC: 32 ℃")),
                                                                 h4(span("●	Mean mintempC: 23 ℃")),
                                                                 h4(span("●	Mean sunHour: 11 Hours")),
                                                                 h4(span("●	Mean uvIndex.1: 4.50")),
                                                                 h4(span("●	Mean FeelsLikeC: 33.12 ℃")),
                                                                 h4(span("●	Mean Humidity: 44.12 %")),
                                                                 h4(span("●	Mean HeatIndexC: 32.12")),
                                                                 h4(span("●	Mean winddirDegree: 163.1 °")),
                                                                 h4(span("●	Mean WindChillC : 30.83°")),
                                                                 
                                                                 h3(span("2017 Results:")),
                                                                 h4(span("●	Mean maxtempC: 30 ℃")),
                                                                 h4(span("●	Mean mintempC: 22 ℃")),
                                                                 h4(span("●	Mean sunHour: 11 Hours")),
                                                                 h4(span("●	Mean uvIndex.1: 4.167")),
                                                                 h4(span("●	Mean FeelsLikeC: 31.67 ℃")),
                                                                 h4(span("●	Mean Humidity: 51.92 %")),
                                                                 h4(span("●	Mean HeatIndexC: 31.67")),
                                                                 h4(span("●	Mean winddirDegree: 135.21 °")),
                                                                 h4(span("●	Mean WindChillC : 29.96°")),
                                                                 
                                                                 h3(span("2017 Results:")),
                                                                 h4(span("●	Mean maxtempC: 28 ℃")),
                                                                 h4(span("●	Mean mintempC: 22 ℃")),
                                                                 h4(span("●	Mean sunHour: 11 Hours")),
                                                                 h4(span("●	Mean uvIndex.1: 4.125")),
                                                                 h4(span("●	Mean FeelsLikeC: 29.17 ℃")),
                                                                 h4(span("●	Mean Humidity: 52.75 %")),
                                                                 h4(span("●	Mean HeatIndexC: 29.17")),
                                                                 h4(span("●	Mean winddirDegree: 220.1 °")),
                                                                 h4(span("●	Mean WindChillC : 27,92°")),
                                                                 
                                                                 h3(span("2017 Results:")),
                                                                 h4(span("●	Mean maxtempC: 32 ℃")),
                                                                 h4(span("●	Mean mintempC: 24 ℃")),
                                                                 h4(span("●	Mean sunHour: 11 Hours")),
                                                                 h4(span("●	Mean uvIndex.1: 4.375")),
                                                                 h4(span("●	Mean FeelsLikeC: 28.17 ℃")),
                                                                 h4(span("●	Mean Humidity: 40 %")),
                                                                 h4(span("●	Mean HeatIndexC: 28.17")),
                                                                 h4(span("●	Mean winddirDegree: 148.0 °")),
                                                                 h4(span("●	Mean WindChillC : 27,46°")),
                                                                 
                                                                 
                                             ))),
                                     
                         ), bs4TabPanel(tabName = "PUNE WEATHER ANALYSIS",
                                        bs4Card(icon = "fa-table ",
                                                title = "ANALYSIS:",
                                                elevation = 3,
                                                ribbon = TRUE,
                                                closable = TRUE, 
                                                width = 12,
                                                solidHeader = TRUE, 
                                                status = "warning",
                                                collapsible = TRUE,
                                                fluidRow(mainPanel(width = 11,
                                                                   h1(span("Pune Weather Analysis ", style = "color:#0cb330")),
                                                                   h2(span("Definitions:",style = "color:#929c0c")),
                                                                   h3(span("Temperature ℃:",style = "color:#ff0000")),(h4(p("Temperature is a physical quantity that describes heat and cold and is proportional to the average kinetic energy of a mass. Thermometers are used to measure the temperature. In meteorology, as a rule, the air temperature is considered.     "),align ="justify")),
                                                                   h3(span("Dew point ℃:  ",style = "color:#ff0000")),(h4(p("Dew Point is the temperature at which air is saturated with water and condensation begins. The higher the dew point rises, the greater the amount of moisture in the air.    "),align ="justify")),
                                                                   h3(span("UV index: ",style = "color:#ff0000")),(h4(p("The World Health Organization’s Global Solar UV Index measures UV levels on a scale from 0 (Low) to 11+ (Extreme). Sun protection is recommended when UV levels are 3 (Moderate) or higher. "),align ="justify")),
                                                                   h3(span("Feels Like ℃: ",style = "color:#ff0000")),(h4(p("Feels like’ temperature considers wind speeds and humidity to assess how the human body feels temperature."),align ="justify")),
                                                                   h3(span("Heat index ℃: ",style = "color:#ff0000")),(h4(p("The heat index, also known as the apparent temperature, is what the temperature feels like to the human body when relative humidity is combined with the air temperature. This has important considerations for the human body’s comfort. When the body gets too hot, it begins to perspire or sweat to cool itself off.  "),align ="justify")),
                                                                   h3(span("Wind gust Kmph:",style = "color:#ff0000")),(h4(p("A wind gust generally last under 20 seconds. The longer that gust lasts, the longer it exerts force on an object, and the higher the potential to cause damage. "),align ="justify")),
                                                                   h3(span("Wind Speed Kmph:",style = "color:#ff0000")),(h4(p("A sustained wind is defined as the average wind speed over two minutes.  "),align ="justify")),
                                                                   h3(span("Cloud cover:",style = "color:#ff0000")),(h4(p(" Cloud cover is expressed in % of the maximum cloud cover. Cover is often grouped in classes of 0-25%, 25-50% etc. Zero percent means that there is no visible cloud in the sky. Fifty percent is equivalent to half of the sky being covered with clouds. Hundred percent cloud cover means no clear sky is visible. "),align ="justify")),
                                                                   h3(span("Humidity:  ",style = "color:#ff0000")),(h4(p("Here the relative humidity is expressed as a percent. It is the current absolute humidity relative to the maximum (highest point) for that temperature. If you will add more water vapor, it’ll start to condense. Same with temperature - if temperature decreases, water vapor starts to condense into little water droplets. Humidity is measured by the device called psychrometer.  "),align ="justify")),
                                                                   h3(span("PrecipMM: ",style = "color:#ff0000")),(h4(p("It is the amount of rain that it takes to cover the ground ‘x’ millimeters deep. It is normally measured in 24 hours and is measured each morning at a fixed time. "),align ="justify")),
                                                                   h3(span("Pressure:  ",style = "color:#ff0000")),(h4(p("Atmospheric pressure is the force per unit area exerted by the weight of the atmosphere. To measure that weight, meteorologists use a barometer. The measure is in millibars.  "),align ="justify")),
                                                                   h3(span("Visibility:",style = "color:#ff0000")),(h4(p(" Visibility is a measure of the distance at which an object or light can be clearly discerned. Meteorological visibility refers to transparency of air: in dark, meteorological visibility is still the same as in daylight for the same air. Here the measure is in km.   "),align ="justify")),
                                                                   h3(span("Wind direction degree and cardinal form:",style = "color:#ff0000")),(h4(p("Wind direction is defined as the direction the wind is coming from. For general purposes, the wind direction is reported to eight compass points: N, NE, E, SE, S, SW, W, NW. These directions can be further refined to 16 compass points with the addition of NNE, ENE, etc. When more precise wind directions are needed, directions are reported to 36 points of the compass in 10-degree increments: 360 degrees (due north), 350 degrees (very slightly east of due north), 340 degrees, etc. Due east is 90 degrees; due south, 180 degrees; due west, 270 degrees.  "),align ="justify")),
                                                                   h3(span("Wind Chill ℃:",style = "color:#ff0000")),(h4(p("Wind chill is the temperature that the environment feels like due to wind speed. The greater the wind speed, the colder the environment feels. Humans lose heat through radiation and convection, which occur faster when the environment feels colder."),align ="justify")),
                                                                   
                                                                   
                                                                   br(),
                                                                   h1(span("Weather Analysis", style = "color:#5496ff")),
                                                                   h2(span("City-Pune:", style = "color:#d9aa1e")),
                                                                   br(),
                                                                   h3(span("Average Weather in Pune India: ",style = "color:#ff0000")),(h4(p("The purposes of this report, the geographical coordinates of Pune are 18.520 deg latitude, 73.855 deg longitude, and 554 m elevation. In Pune, the wet season is oppressive, windy, and overcast; the dry season is mostly clear; and it is hot year-round. Over the course of the year, the temperature typically varies from 9°C to 36°C. Pune experiences three seasons: summer, monsoon, and winter. Typical summer months are from mid-March to mid-June. The warmest month in Pune is May. The city often has heavy dusty winds in May, with humidity remaining high. Even during the hottest months, the nights are usually cool due to Pune’s high altitude. The monsoon lasts from June to October, with moderate rainfall and temperatures ranging from 22 to 28 °C. Most of the 722 mm (28.43 in) of annual rainfall in the city falls between June and September, and July is the wettest month of the year. For most of December and January the daytime temperature hovers around 26 °C while night temperatures are around below 9 °C. Based on the fact of the greatest number of rainless days and with perceived temperatures between 24°C and 35°C, the best time of year to visit Pune for hot-weather activities is from early March to mid-May."),align ="justify")),
                                                                   h3(span("Correlation between the parameters and TempC:  ",)),(h4(p("Correlation is a standardized covariance measure that will tell you both the strength and direction of the relationship between two different variables (i.e. as one variable increases in value, does the other variable also increase? as one variable increases in value, does the other variable decrease?) Correlation coefficients can only take on values between -1 and +1. The correlation function should be calculating the correlation of each attribute against every other attribute in your dataset; if you have k numeric attributes in your dataset, then you will have a correlation matrix returned with shape kxk showing the correlation coefficients for each possible pair of attributes. "),align ="justify")),
                                                                   (h4(p("Initially, P-value test was considered to identify the significant parameters. But due to the large sample size of the data, "),align ="justify")),
                                                                   img(src = "https://i.ibb.co/bgjTdCQ/corrplot1.png" , height = 700, width = 1000),
                                                                   (h4(p("corrThe function corrplot(), in the package of the same name, creates a graphical display of a correlation matrix, highlighting the most correlated variables in a data table. In this plot, correlation coefficients are colored according to the value. Correlation matrix can be also reordered according to the degree of association between variables. "),align ="justify")),
                                                                   (h4(p("From the correlation matrix applied to the given data set. We find that with that the most significant parameters are the FeelsLikeC, HeatIndexC and WindChillC. All of which have a very strong positive relationship with tempC.. "),align ="justify")),
                                                                   h3(span("•	FeelsLikeC:  ",)),(h4(p("It is the temperature that is felt by the human body when relative humidity is combined with the air temperature. Correlation value: 0.985763277 "),align ="justify")),
                                                                   h3(span("•	HeatIndexC:  ",)),(h4(p("It is the temperature considering wind speeds and humidity to assess how the human body feels temperature. Correlation value: 0.98973017 "),align ="justify")),
                                                                   h3(span("•	WindChillC:   ",)),(h4(p("It is the temperature that the environment feels like due to wind speed. The greater the wind speed, the colder the environment feels. Correlation value: 0.97453891 "),align ="justify")),
                                                                   h3(span("•	UVIndexMax and UVIndexMin:   ",)),(h4(p("It is the intensity of UV radiation. 
Correlation values: 0.89966364 and 0.85727290, respectively.
 "),align ="justify")),
                                                                   h3(span("•	SunHour:   ",)),(h4(p("The available sun hours. Correlation values: 0.77508902 "),align ="justify")),
                                                                   h3(span("•	Humidity:   ",)),(h4(p("Here the relative humidity is expressed as a percent. Pune experiences extreme seasonal variation in the perceived humidity. Correlation value: -0.58304699"),align ="justify")),
                                                                   h3(span("•	WinddirDegree:  ",)),(h4(p("Wind direction is defined as the direction the wind is coming from. 
Correlation value: 0.40505048 Though the correlation value is low, the direction and speed of wind and contribute towards the monsoons in Pune. 
 "),align ="justify")),
                                                                   
                                                                   
                                                                   
                                                                   
                                                                   
                                                                   h1(span("An Overall yearly analysis", style = "color:#5496ff")),
                                                                   h2(span("Pune:", style = "color:#d9aa1e")),
                                                                   br(),
                                                                   h3(span("Average Weather in Pune India: ",style = "color:#ff0000")),(h4(p("The purposes of this report, the geographical coordinates of Pune are 18.520 deg latitude, 73.855 deg longitude, and 554 m elevation. In Pune, the wet season is oppressive, windy, and overcast; the dry season is mostly clear; and it is hot year-round. Over the course of the year, the temperature typically varies from 9°C to 36°C. Pune experiences three seasons: summer, monsoon, and winter. Typical summer months are from mid-March to mid-June. The warmest month in Pune is May. The city often has heavy dusty winds in May, with humidity remaining high. Even during the hottest months, the nights are usually cool due to Pune’s high altitude. The monsoon lasts from June to October, with moderate rainfall and temperatures ranging from 22 to 28 °C. Most of the 722 mm (28.43 in) of annual rainfall in the city falls between June and September, and July is the wettest month of the year. For most of December and January the daytime temperature hovers around 26 °C while night temperatures are around below 9 °C. Based on the fact of the greatest number of rainless days and with perceived temperatures between 24°C and 35°C, the best time of year to visit Pune for hot-weather activities is from early March to mid-May."),align ="justify")),
                                                                   h3(span("Correlation between the parameters and TempC:  ",)),(h4(p("Correlation is a standardized covariance measure that will tell you both the strength and direction of the relationship between two different variables (i.e. as one variable increases in value, does the other variable also increase? as one variable increases in value, does the other variable decrease?) Correlation coefficients can only take on values between -1 and +1. The correlation function should be calculating the correlation of each attribute against every other attribute in your dataset; if you have k numeric attributes in your dataset, then you will have a correlation matrix returned with shape kxk showing the correlation coefficients for each possible pair of attributes. "),align ="justify")),
                                                                   (h4(p("Initially, P-value test was considered to identify the significant parameters. But due to the large sample size of the data, "),align ="justify")),
                                                                   img(src = "https://i.ibb.co/bgjTdCQ/corrplot1.png" , height = 700, width = 1000),
                                                                   (h4(p("corrThe function corrplot(), in the package of the same name, creates a graphical display of a correlation matrix, highlighting the most correlated variables in a data table. In this plot, correlation coefficients are colored according to the value. Correlation matrix can be also reordered according to the degree of association between variables. "),align ="justify")),
                                                                   (h4(p("From the correlation matrix applied to the given data set. We find that with that the most significant parameters are the FeelsLikeC, HeatIndexC and WindChillC. All of which have a very strong positive relationship with tempC.. "),align ="justify")),
                                                                   h3(span("•	FeelsLikeC:  ",)),(h4(p("It is the temperature that is felt by the human body when relative humidity is combined with the air temperature. Correlation value: 0.985763277 "),align ="justify")),
                                                                   h3(span("•	HeatIndexC:  ",)),(h4(p("It is the temperature considering wind speeds and humidity to assess how the human body feels temperature. Correlation value: 0.98973017 "),align ="justify")),
                                                                   h3(span("•	WindChillC:   ",)),(h4(p("It is the temperature that the environment feels like due to wind speed. The greater the wind speed, the colder the environment feels. Correlation value: 0.97453891 "),align ="justify")),
                                                                   h3(span("•	UVIndexMax and UVIndexMin:   ",)),(h4(p("It is the intensity of UV radiation. 
Correlation values: 0.89966364 and 0.85727290, respectively.
 "),align ="justify")),
                                                                   h3(span("•	SunHour:   ",)),(h4(p("The available sun hours. Correlation values: 0.77508902 "),align ="justify")),
                                                                   h3(span("•	Humidity:   ",)),(h4(p("Here the relative humidity is expressed as a percent. Pune experiences extreme seasonal variation in the perceived humidity. Correlation value: -0.58304699"),align ="justify")),
                                                                   h3(span("•	WinddirDegree:  ",)),(h4(p("Wind direction is defined as the direction the wind is coming from. 
Correlation value: 0.40505048 Though the correlation value is low, the direction and speed of wind and contribute towards the monsoons in Pune. 
 "),align ="justify")),
                                                                   
                                                                   h1(span("An Overall yearly analysis", style = "color:#5496ff")),
                                                                   h2(span("Pune:", style = "color:#d9aa1e")),                                         
                                                                   h3(span("Temperature: ",style = "color:#ff0000")),
                                                                   img(src = "https://i.ibb.co/2dCdyzy/temperature.png" , height = 500, width = 1000),
                                                                   h3(span("•	Year 2015:",)),(h4(p("The highest maximum temperature at monthly average was in May at 37.2℃, while the lowest minimum temperature at monthly average was in January 15℃. But the Feels like temperature was almost consistent throughout the year at around 26.5°C. "),align ="justify")),
                                                                   h3(span("•	Year 2016:",)),(h4(p("The highest maximum temperature at monthly average was in April at 38℃, while the lowest minimum temperature at a monthly average was in January 15℃. But the Feels like temperature was the highest at around 31°C during the month of May. "),align ="justify")),
                                                                   h3(span("•	Year 2017:",)),(h4(p("The highest maximum temperature at monthly average was in April at 38℃, while the lowest minimum temperature at a monthly average was in January 14.6℃. But the Feels like temperature was the highest at around 31.3°C during the month of May."),align ="justify")),
                                                                   h3(span("•	Year 2018:",)),(h4(p("The highest maximum temperature at monthly average was in May at 37℃, while the lowest minimum temperature at a monthly average was in December 16.7℃. But the Feels like temperature was the highest at around 31.9°C during the month of May. "),align ="justify")),
                                                                   h3(span("•	Year 2019:",)),(h4(p("The highest maximum temperature at monthly average was in April at 38.8℃, while the lowest minimum temperature at a monthly average was in December 19.2℃. But the Feels like temperature was the highest at around 32.7°C during the month of May. "),align ="justify")),
                                                                   
                                                                   h3(span("Sun Hour: ",style = "color:#ff0000")),
                                                                   img(src = "https://i.ibb.co/HhDV1Mk/sunhour1.png" , height = 500, width = 1000),
                                                                   h3(span("•	Year 2015:",)),(h4(p("The most amount of sun light was during the month of May, with a monthly average of 12.5 hours. The UV index was of maximum value during the summer months of April-May. "),align ="justify")),
                                                                   h3(span("•	Year 2016:",)),(h4(p("The most amount of sun light was during the month of May, with a monthly average of 12.2 hours. The UV index was of maximum value during the summer months of April-May. "),align ="justify")),
                                                                   h3(span("•	Year 2017:",)),(h4(p("The most amount of sun light was during the month of May, with a monthly average of 12.4 hours. The UV index was of maximum value during the summer months of May-June. "),align ="justify")),
                                                                   h3(span("•	Year 2018:",)),(h4(p("The most amount of sun light was during the month of May, with a monthly average of 12.4 hours. The UV index was of maximum value during the summer months of March-May. "),align ="justify")),
                                                                   h3(span("•	Year 2019:",)),(h4(p("The most amount of sun light was during the month of May, with a monthly average of 12.4 hours. The UV index was of maximum value during the summer months of March-May. "),align ="justify")),
                                                                   
                                                                   h3(span("Rainfall: ",style = "color:#ff0000")),
                                                                   img(src = "https://i.ibb.co/Tcd8kRP/Rainfall.png" , height = 500, width = 1000),
                                                                   h3(span("•	Year 2015:",)),(h4(p("The rainfall was the highest during the month of June with the average of 0.182mm, the relative humidity was the highest during the months of July and August at a combined monthly average of 81.8%, the average dew point was a highest during the months of June to September at 20.5°C, all of which are consistent with the  monsoon months. The pressure was consistent throughout the year at around 1010mb. "),align ="justify")),
                                                                   h3(span("•	Year 2016:",)),(h4(p("The rainfall was the highest during the month of July with the average of 0.172mm, the relative humidity was the highest during the months of July and August at a combined monthly average of 87.4%, the average dew point was the highest during the months of June to September at 20.8°C, all of which are consistent with the  monsoon months. The pressure was consistent throughout the year at around 1010.3mb.  "),align ="justify")),
                                                                   h3(span("•	Year 2017:",)),(h4(p("The rainfall was the highest during the month of June with the average of 0.201mm, the relative humidity was the highest during the months of July and August at a combined monthly average of 87.4%, the average dew point was the highest during the months of June to September at 20.7°C, all of which are consistent with the  monsoon months. The pressure was consistent throughout the year at around 1010.1mb. "),align ="justify")),
                                                                   h3(span("•	Year 2018:",)),(h4(p("The rainfall was the highest during the month of June with the average of 0.215mm, the relative humidity was the highest during the months of July and August at a combined monthly average of 83.7%, the average dew point was the highest during the months of June to September at 20.3°C, all of which are consistent with the  monsoon months. The pressure was consistent throughout the year at around 1010mb.  "),align ="justify")),
                                                                   h3(span("•	Year 2019:",)),(h4(p("The rainfall was the highest during the month of October with the average of 0.69mm, the relative humidity was the highest during the months of July-October at a combined monthly average of 83%, the average dew point was the highest during the months of June to October at 20.8°C, all of which are consistent with the  monsoon months. The pressure was consistent throughout the year at around 1009.8mb. "),align ="justify")),   
                                                                   
                                                                   h3(span("windChillC: ",style = "color:#ff0000")),
                                                                   img(src = "https://i.ibb.co/3pDgjYD/Wind-Chill1.png" , height = 500, width = 1000),
                                                                   h3(span("•	Year 2015:",)),(h4(p("The wind speed was the highest during the month of July with the monthly average of 17.3 Kmph. "),align ="justify")),
                                                                   h3(span("•	Year 2016:",)),(h4(p("The wind speed was the highest during the month of July with the monthly average of 14 Kmph.  "),align ="justify")),
                                                                   h3(span("•	Year 2017:",)),(h4(p("The wind speed was the highest during the month of July with the monthly average of 17.9 Kmph. "),align ="justify")),
                                                                   h3(span("•	Year 2018:",)),(h4(p("The wind speed was the highest during the month of July with the monthly average of 20.7 Kmph  "),align ="justify")),
                                                                   h3(span("•	Year 2019:",)),(h4(p("The wind speed was the highest during the month of August with the monthly average of 18.6 Kmph. "),align ="justify")),   
                                                                   
                                                )) ),        
                         ),
                         bs4TabPanel(tabName = "JAIPUR WEATHER ANALYSIS",
                                     bs4Card( title = "ANALYSIS", 
                                              elevation = 3,
                                              closable = TRUE, 
                                              width = 12,
                                              solidHeader = TRUE, 
                                              status = "success",
                                              collapsible = TRUE,
                                              fluidRow(mainPanel(width = 11,
                                                                 h1(span("Jaipur Weather Analysis", style = "color:#0cb330")),
                                                                 h2(span("Definition of Parameters:",style = "color:#929c0c")),
                                                                 h3(span("Temperature ℃:",style = "color:#ff0000")),(h4(p("Temperature is a physical quantity that describes heat and cold and is proportional to the average kinetic energy of a mass. Thermometers are used to measure the temperature. In meteorology, as a rule, the air temperature is considered.     "),align ="justify")),
                                                                 h3(span("Dew point ℃:  ",style = "color:#ff0000")),(h4(p("Dew Point is the temperature at which air is saturated with water and condensation begins. The higher the dew point rises, the greater the amount of moisture in the air.    "),align ="justify")),
                                                                 h3(span("UV index: ",style = "color:#ff0000")),(h4(p("The World Health Organization’s Global Solar UV Index measures UV levels on a scale from 0 (Low) to 11+ (Extreme). Sun protection is recommended when UV levels are 3 (Moderate) or higher. "),align ="justify")),
                                                                 h3(span("Feels Like ℃: ",style = "color:#ff0000")),(h4(p("Feels like’ temperature considers wind speeds and humidity to assess how the human body feels temperature."),align ="justify")),
                                                                 h3(span("Heat index ℃: ",style = "color:#ff0000")),(h4(p("The heat index, also known as the apparent temperature, is what the temperature feels like to the human body when relative humidity is combined with the air temperature. This has important considerations for the human body’s comfort. When the body gets too hot, it begins to perspire or sweat to cool itself off.  "),align ="justify")),
                                                                 h3(span("Wind gust Kmph:",style = "color:#ff0000")),(h4(p("A wind gust generally last under 20 seconds. The longer that gust lasts, the longer it exerts force on an object, and the higher the potential to cause damage. "),align ="justify")),
                                                                 h3(span("Wind Speed Kmph:",style = "color:#ff0000")),(h4(p("A sustained wind is defined as the average wind speed over two minutes.  "),align ="justify")),
                                                                 h3(span("Cloud cover:",style = "color:#ff0000")),(h4(p(" Cloud cover is expressed in % of the maximum cloud cover. Cover is often grouped in classes of 0-25%, 25-50% etc. Zero percent means that there is no visible cloud in the sky. Fifty percent is equivalent to half of the sky being covered with clouds. Hundred percent cloud cover means no clear sky is visible. "),align ="justify")),
                                                                 h3(span("Humidity:  ",style = "color:#ff0000")),(h4(p("Here the relative humidity is expressed as a percent. It is the current absolute humidity relative to the maximum (highest point) for that temperature. If you will add more water vapor, it’ll start to condense. Same with temperature - if temperature decreases, water vapor starts to condense into little water droplets. Humidity is measured by the device called psychrometer.  "),align ="justify")),
                                                                 h3(span("PrecipMM: ",style = "color:#ff0000")),(h4(p("It is the amount of rain that it takes to cover the ground ‘x’ millimeters deep. It is normally measured in 24 hours and is measured each morning at a fixed time. "),align ="justify")),
                                                                 h3(span("Pressure:  ",style = "color:#ff0000")),(h4(p("Atmospheric pressure is the force per unit area exerted by the weight of the atmosphere. To measure that weight, meteorologists use a barometer. The measure is in millibars.  "),align ="justify")),
                                                                 h3(span("Visibility:",style = "color:#ff0000")),(h4(p(" Visibility is a measure of the distance at which an object or light can be clearly discerned. Meteorological visibility refers to transparency of air: in dark, meteorological visibility is still the same as in daylight for the same air. Here the measure is in km.   "),align ="justify")),
                                                                 h3(span("Wind direction degree and cardinal form:",style = "color:#ff0000")),(h4(p("Wind direction is defined as the direction the wind is coming from. For general purposes, the wind direction is reported to eight compass points: N, NE, E, SE, S, SW, W, NW. These directions can be further refined to 16 compass points with the addition of NNE, ENE, etc. When more precise wind directions are needed, directions are reported to 36 points of the compass in 10-degree increments: 360 degrees (due north), 350 degrees (very slightly east of due north), 340 degrees, etc. Due east is 90 degrees; due south, 180 degrees; due west, 270 degrees.  "),align ="justify")),
                                                                 h3(span("Wind Chill ℃:",style = "color:#ff0000")),(h4(p("Wind chill is the temperature that the environment feels like due to wind speed. The greater the wind speed, the colder the environment feels. Humans lose heat through radiation and convection, which occur faster when the environment feels colder."),align ="justify")),
                                                                 
                                                                 
                                                                 br(),
                                                                 h1(span("Jaipur", style = "color:#5496ff")),
                                                                 
                                                                 br(),
                                                                 h3(span(" ",style = "color:#ff0000")),
                                                                 (h4(p("Jaipur is the capital and largest city of Rajasthan India. It has a monsoon influenced hot semi-arid climate with long extremely hot summers and short, mild warm winters. It is located in the east border of Thar Desert which is the only desert of India. In western direction it shares a common international boundary of mesmerizing and mysterious desert with Pakistan. Jaipur is situated at an altitude of 431 meters / 1417 feet above the sea level and it is enclosed by Aravalli hills on form three sides."),align ="justify")),
                                                                 (h4(p("Comparison of 2015,16,17,18 and 19:"),align ="justify")),
                                                                 (h4(p("while comparing the tempC with other parameters we have found that wind gust and visibility doesn’t affect the change of temperature over 10 year. But maxtempC, mintempC, uvindex, feelslikeC, heatindexC and windchillC are highly positively correlated whereas pressure and humidity are negatively correlated. After 10 year of time period, the temperature of the Jaipur city has a increase in its value."),align ="justify")),
                                                                 
                                                                 
                                                                 
                                                                 h3(span("•	Year 2015:",)),(h4(p("In the year 2015 the maximum temperature recorded in the month of May 42.89-degree Celsius and the minimum reported in the month of January 21.32 degree Celsius. even though it reported a temp of 42degree Celsius the feel like temperature was in the entire year was 28 degree Celsius. Throughout the year pressure showed a constant value of 1010. The rainfall was highest during the month of July 220.8mm. "),align ="justify")),
                                                                 h3(span("•	Year 2016:",)),(h4(p("The highest temperature reported in the month of May 43 degree Celsius and min temperature reports in the month of January which was 18 degree Celsius. The average moon illumination was much lower than all other years but the value of uv index has got a increase by 0.1. in the year 2016 the average feel like temperature was reported as29.8-degree Celsius. The clod cover in the sky reduced and also the humidity reduced. Which in turn result in the increase of the temperature value.  "),align ="justify")),
                                                                 h3(span("•	Year 2017:",)),(h4(p("The maximum of the year 2017 reported in the month of may and august which was greater than 40 degree Celsius. The minimum temperature reported in the month of December which was 20 degree Celsius. The average cloud cover shows a significant reduction and the humidity also reduces, which increase the temperature on the earth surface. The highest rainfall reported in the month of august which was 268mm. but the pressure was remain a constant 1009 throughout the year.  "),align ="justify")),
                                                                 h3(span("•	Year 2018:",)),(h4(p("The average maximum temperature has a drop when compared with the other maximum temperature. The minimum temperature obtained in the month of January and maximum temperature reported on may. The uv index values increased and the visibility factor is reducing by a .002 value. The most of the rain reported in the month of august 280.4mm. humidity value also increased during the year of 2018. The pressure was a constant 1010. "),align ="justify")),
                                                                 h3(span("•	Year 2019:",)),(h4(p("The highest maximum temperature at monthly average was in august at 42 degree Celsius, while the lowest minimum temperature at a monthly average was in December 14 degree Celsius. But the Feels like temperature was the highest at around 32 during the month of May. The rainfall was the highest during the month of June with the average of 215mm. "),align ="justify")),   
                                                                 
                                                                 h3(span("",)),(h4(p("Form the above observations we can conclude that most of days in Jaipur is sunny and only the month of July and august show a little bit variation. The maximum temperature experienced by Jaipur in the month of May and June greater than 40 degree Celsius whereas January and December have a temperature less than 15 degree Celsius. During the month of September precipitation is taking a value greater than 100mm even though most of the days in a year are dry. The wind has the highest speed during the month of June greater than 28km/h. the monsoon creates a steady strong wind from the December to April and calm wind from June to October.
 

 "),align ="justify")), 
                                              )),
                                              
                                              p("Box Content"))) 
          ) 
        ),
        bs4TabItem(
          tabName = "item5",
          bs4Card(
            title = "Project Information",
            elevation = 3,
            closable = TRUE, 
            width = 12,
            solidHeader = TRUE, 
            status = "success",
            collapsible = TRUE,
            fluidRow(  mainPanel(width = absolutePanel(width = 20,bottom = 1, right = -150, top = -100),
                                 h1(span("Info:")),
                                 
                                 h3(span(" ")),(h4(p("* The application describes the Weather Variatins in Major Cities of India for the year 2015 to 2019 by different Cities ,  Therefore, Multiple Linear Regression has been applied and the Adjusted R-Squared
Value is 0.8932 which suggests a good fit. Based on the p-value (at 5 % level of
significance) and corrplot, the parameters that have been selected for studying and
understanding the variation.

    "),align ="justify")),(h4(p("* The Data Types selected dataset contained around 26 parameters. Here, in this project we wish to
                                study and analyse the variation of temperature with respect to each of the parameters
                                present in our dataset."),align ="justify")),
                                 (h4(p("* The Simple Linear Regression had been applied to our data considering
tempC as the dependent variable. The Adjusted R-Squared value is significantly less for
the Simple Linear Regression Model which suggests that the model does not have a good
fit."),align ="justify")),
                                 
                                 (h4(p("* Therefore, Multiple Linear Regression has been applied and the Adjusted R-Squared
Value is 0.8932 which suggests a good fit. Based on the p-value (at 5 % level of
significance) and corrplot, the parameters that have been selected for studying and
understanding the variation."),align ="justify")),
                                 h1(span("Data:")), 
                                 
                                 h3(span(" ")),(h4(p("The application was created from Open data from Kaggle:

    "),align ="justify")),  h4(span( tags$h3(""),
                                     tags$a(href="https://www.kaggle.com/hiteshsoneji/historical-weather-data-for-indian-cities", 
                                            "Kaggle"),
    )),
    h3(span(" ")),(h4(p("It was the reference data from worldweatheronline:

    "),align ="justify")),  h4(span( tags$h3(""),
                                     tags$a(href="https://www.worldweatheronline.com/india-weather.aspx", 
                                            "worldweatheronline"),
    )),   h3(span(" ")),(h4(p("The information on the lines comes from Wikipedia

    "),align ="justify")),
    
    
    h1(span("Packages:")), 
    h4(span( tags$h4(""),
             tags$a(href="https://shiny.rstudio.com", 
                    "shiny:","for the application"),
    )),
    h4(span( tags$h4(""),
             tags$a(href="https://ggplot2.tidyverse.org", 
                    "ggplot2:","for plotting the different plots"),
    )),
    h4(span( tags$h4(""),
             tags$a(href="https://cran.r-project.org/web/packages/bs4Dash/index.html", 
                    "bs4Dash:","To customize the appearance of the application"),
    )),
    h4(span( tags$h4(""),
             tags$a(href="https://cran.r-project.org/web/packages/fresh/index.html", 
                    "fresh:","To customize the dashboard theme"),
    )),
    h4(span( tags$h4(""),
             tags$a(href="https://cran.r-project.org/web/packages/plotly/index.html", 
                    "plotly:","Mainly used to make creating graphs faster and more efficient."),
    )),
    h4(span( tags$h4(""),
             tags$a(href="https://cran.r-project.org/web/packages/reshape2/index.html", 
                    "reshape2:","Reshape2 is a package that allows us to easily transform our data into whatever structure we may need. "),
    )),
    h1(span("Project Group Details:")),
    
    h2(span("Merin George  ",style = "color:#f5c402")),(h4(p("20BDA11

    "),align ="justify")),
    (h4(p("COURSE:MSc in BIG DATA ANALYSIS

    "),align ="justify")),
    (h4(p("ST.JOSEPH'S COLLEGE

    "),align ="justify")),
    (h4(p("BENGALURU

    "),align ="justify")),
    
    
    h2(span("Glennis Elwin Dsouza ",style = "color:#c73c00")),(h4(p("20BDA24

    "),align ="justify")),
    (h4(p("COURSE:MSc in BIG DATA ANALYSIS

    "),align ="justify")),
    (h4(p("ST.JOSEPH'S COLLEGE

    "),align ="justify")),
    (h4(p("BENGALURU

    "),align ="justify")),
    
    h2(span("Brinda Dasgupta  ",style = "color:#f200ff")),(h4(p("20BDA30

    "),align ="justify")),
    (h4(p("COURSE:MSc in BIG DATA ANALYSIS

    "),align ="justify")),
    (h4(p("ST.JOSEPH'S COLLEGE

    "),align ="justify")),
    (h4(p("BENGALURU

    "),align ="justify")),
    
    h2(span("Ranjith Kumar K.N  ",style = "color:#0091ff")),(h4(p("20BDA30

    "),align ="justify")),
    (h4(p("COURSE:MSc in BIG DATA ANALYSIS

    "),align ="justify")),
    (h4(p("ST.JOSEPH'S COLLEGE

    "),align ="justify")),
    (h4(p("BENGALURU

    "),align ="justify")),
    
            )),
    
    p("Box Content")
          )
        )
      )
    )
  ),
  server = function(input, output, session) {
    
    datasetInput <- reactive({
      switch(input$dataset,"hyderabad" = hyderabad,"bengaluru"=bengaluru,"bombay"= bombay,"pune" = pune,"delhi"= delhi,"jaipur"=jaipur,
             "kanpur"=kanpur,nagpur = "nagpur")
    })
    
    
    output$summary <- renderPrint({
      dataset <- datasetInput()
      summary(dataset)
    })
    
    
    output$view <- renderTable({
      head(datasetInput(), n = input$obs)
    })
    
    observe({
      #browser()
      if(!exists(input$dataset)) return() #make sure upload exists
      var.opts<-colnames(get(input$dataset))
      updateSelectInput(session, "variable", choices = var.opts)
      updateSelectInput(session, "group", choices = var.opts)
    })
    
    output$caption<-renderText({
      switch(input$plot.type,
             "boxplot" 	= 	"Boxplot",
             "histogram" =	"Histogram",
             "density" 	=	"Density plot",
             "bar" 		=	"Bar graph")
    })
    
    
    output$plot <- renderUI({
      plotOutput("p")
    })
    
    
    get_data<-reactive({
      
      if(!exists(input$dataset)) return() # if no upload
      
      check<-function(x){is.null(x) || x==""}
      if(check(input$dataset)) return()
      
      obj<-list(data=get(input$dataset),
                variable=input$variable,
                group=input$group
      )
      
      
      if(any(sapply(obj,check))) return()
      
      check<-function(obj){
        !all(c(obj$variable,obj$group) %in% colnames(obj$data))
      }
      
      if(check(obj)) return()
      
      
      obj
      
    })
    
    
    output$p <- renderPlot({
      
      plot.obj<-get_data()
      
      if(is.null(plot.obj)) return()
      
      
      if(plot.obj$variable == "" | plot.obj$group =="") return()
      
      
      plot.type<-switch(input$plot.type,
                        "boxplot" 	= geom_boxplot(),
                        "histogram" =	geom_histogram(alpha=0.5,position="identity"),
                        "density" 	=	geom_density(alpha=.75),
                        "bar" 		=	geom_bar(position="dodge")
      )
      
      
      if(input$plot.type=="boxplot")	{		#control for 1D or 2D graphs
        p<-ggplot(plot.obj$data,
                  aes_string(
                    x 		= plot.obj$group,
                    y 		= plot.obj$variable,
                    fill 	= plot.obj$group # let type determine plotting
                  )
        ) + plot.type
        
        if(input$show.points==TRUE)
        {
          p<-p+ geom_point(color='black',alpha=0.5, position = 'jitter')
        }
        
      } else {
        
        p<-ggplot(plot.obj$data,
                  aes_string(
                    x 		= plot.obj$variable,
                    fill 	= plot.obj$group,
                    group 	= plot.obj$group
                    #color 	= as.factor(plot.obj$group)
                  )
        ) + plot.type
      }
      
      p<-p+labs(
        fill 	= input$group,
        x 		= "",
        y 		= input$variable
      )  +
        .theme
      print(p)
    })
    
    
    upload_data<-reactive({
      
      inFile <- input$file1
      
      if (is.null(inFile))
        return(NULL)
      
      
      read.csv(inFile$datapath,
               header = input$header,
               sep = input$sep)
    })
    
    observeEvent(input$file1,{
      inFile<<-upload_data()
    })
  }
)

