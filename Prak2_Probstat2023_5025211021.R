# No 1
  X <- c(78, 75, 67, 77, 70, 72, 78, 70, 77)
  Y <- c(100, 95, 70, 90, 90,   90, 89, 100, 100)
  
  # Poin A
  difference <- Y - X
  sd(difference)
  
  # Poin B
  t.test(Y, X, paired = TRUE)
  
  # Poin C
  # Jawaban terlampir di README.md

# No 2
  # Poin A & C
  library(BSDA)
  mu <- 25000
  n_x <- 100
  mean_x <- 23500
  sd <- 3000
  
  zsum.test(
    mean.x = mean_x, 
    sigma.x = sd, 
    n.x = n_x,
    alternative = "greater", 
    mu = mu, 
    conf.level=0.95
  )

# No 3
  # Poin A
  # Jawaban terlampir di README.md
  
  # Poin B
  library(BSDA)
  tsum.test(mean.x=3.64, s.x = 1.67, n.x = 20, 
            mean.y =2.79 , s.y = 1.5, n.y = 27, 
            alternative = "two.side", var.equal = TRUE)
  
  # Poin C
  library(mosaic)
  plotDist(dist = 't', df = 2, col = "red")
  
  # Poin D
  kritikal_kiri <- qt(p = 0.025, df = 2, lower.tail = TRUE)
  kritikal_kanan <- qt(p = 0.025, df = 2, lower.tail = FALSE)
  kritikal_kiri
  kritikal_kanan
  
  # Poin E & F
  # Jawaban terlampir di README.md
  
# Soal 5
  install.packages("multcompView")
  library(readr)
  library(ggplot2)
  library(multcompView)
  library(dplyr)
  
  # Poin A
  nama_file <- "GTL.csv"
  GTL <- read_csv(nama_file)
  head(GTL)
  str(GTL)
  qplot(x = Temp, y = Light, geom = "point", data = GTL) + facet_grid(.~Glass, labeller = label_both)
  
  # Poin B
  model <- aov(Light ~ Glass*Temp, data = GTL)
  anova(model)
  
  # Poin C
  data_summary <- group_by(GTL, Glass, Temp) %>%
    summarise(mean = mean(Light), sd = sd(Light)) %>%
    arrange(desc(mean))
  print(data_summary)