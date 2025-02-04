install.packages(c("ggplot2", "plotly"))
library(ggplot2)
library(plotly)

df <- penglings
df <- na.omit(df)


p <- ggplot(df, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(aes(color = species, size= bill_length_mm), alpha = 0.8) +
  labs(x = "Flipper Length (mm)", y = "Body Mass (g)", size = "Bill Length (mm)") +
  theme_minimal() +
  scale_color_manual(values = c("blue", "red", "green")) +
  guides(color = guide_legend(title = "Species"), size = "none") +
  theme(axis.title.x = element_text(face = "bold", margin = margin(t = 40, r = 0, b = 0, l = 0)),
        axis.title.y = element_text(face = "bold", margin = margin(t = 0, r = 20, b = 0, l = 0))) 


# Convert ggplot to plotly for hover features
p <- ggplotly(p, tooltip = c("species", "flipper_length_mm", "body_mass_g", "bill_length_mm"),
              originalData = TRUE)


p <- ggplotly(p, tooltip = c("species", "flipper_length_mm", "body_mass_g", "bill_length_mm"))


print(p)
