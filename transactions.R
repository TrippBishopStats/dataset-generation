library(tidyverse)
N <- 500

sales_reps <- c("Marion Nichols", "Lowell Norton", "Felipe Weber", 
               "Paul Partick", "Aubrey Santiago", "Dale Warren", 
               "Rogelio Stanley", "Tomas Shaw", "Cesar Bryant", 
               "Scott Gonzalez", "Martin Lynch")

regions <- c("Midwestern", "Southern", "Western", "Northeastern")

state.abb

brands <- c("ADIDAS", "Puma", "Ralph Lauren", "Calvin Klein", "Jessica Simpson",
            "Tommy Hilfiger", "Nike", "New Balance")

start_date <- as.Date("2023-03-01")
end_date <- as.Date("2026-03-15")

dates <- sample(seq(start_date, end_date, by = "day"), size = N)
sales <- runif(N, min=30, max=600) |> round(2)
cog <- (sales*runif(N, min=0.25)) |> round(2)
reps <- sample(sales_reps, N, replace=TRUE)
reg <- sample(regions, N, replace=TRUE)
brand <- sample(brands, N, replace=TRUE)
state_ids <- sample(1:50, N, replace=TRUE)
  
df <- data.frame(date=dates,state_ids,sales_rep=reps, region=reg, brand, sales, cog) |> 
  mutate(
    state = state.abb[state_ids],
    region = state.region[state_ids]
  ) |> 
  select(-state_ids) |> 
  select("Date"=date, "Sales_Rep"=sales_rep, "Region"=region, "Brand"=brand, 
         "Sales"=sales, "COGS"=cog)

write_csv(df, "transactions.csv")