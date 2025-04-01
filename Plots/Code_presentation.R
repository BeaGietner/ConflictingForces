library(ggplot2)
library(dplyr)

# Step 1: Create the data frame with significant estimates only
coef_data <- data.frame(
  Variable = rep(c("Cognition", "Conscientiousness", "Agreeableness", 
                   "Emotional stability", "Cognition × Emot.", "Cognition × Open.", "Male"), 2),
  Subject = rep(c("Maths", "English"), each = 7),
  Estimate = c(0.7176, 0.1371, NA, 0.0580, -0.0678, NA, -0.1167,  # Maths
               0.4483, 0.0801, 0.0369, NA, -0.0262, -0.0234, -0.4443),  # English
  SE = c(0.0161, 0.0211, NA, 0.0211, 0.0156, NA, 0.0400,
         0.0138, 0.0181, 0.0181, NA, 0.0134, 0.0134, 0.0343),
  Significance = c("***", "***", NA, "***", "***", NA, "***",
                   "***", "***", "**", NA, "*", "*", "***")
)

# Remove NA rows
coef_data <- coef_data %>% filter(!is.na(Estimate))

# Add CIs
coef_data <- coef_data %>%
  mutate(
    CI_lower = Estimate - 1.96 * SE,
    CI_upper = Estimate + 1.96 * SE
  )

# Set factor levels for ordering
coef_data$Variable <- factor(coef_data$Variable, 
                             levels = rev(c("Cognition", "Conscientiousness", "Agreeableness", 
                                            "Emotional stability", "Cognition × Emot.", 
                                            "Cognition × Open.", "Male")))

# Plot
ggplot(coef_data, aes(x = Estimate, y = Variable, color = Subject)) +
  geom_point(position = position_dodge(width = 0.6), size = 3) +
  geom_errorbarh(aes(xmin = CI_lower, xmax = CI_upper), 
                 height = 0.2, position = position_dodge(width = 0.6)) +
  geom_text(aes(label = Significance), 
            position = position_dodge(width = 0.6), 
            hjust = -0.6, size = 4.5) +
  geom_vline(xintercept = 0, linetype = "dashed") +
  labs(title = "Significant Effects of Cognitive and Personality Traits on Achievement",
       subtitle = "(TIPI, Standardized Coefficients with 95% CI)",
       x = "Standardized Coefficient", y = NULL) +
  scale_color_manual(values = c("Maths" = "#1f77b4", "English" = "#ffbf00")) +
  theme_minimal(base_size = 13) +
  theme(legend.position = "top")+
  guides(color = guide_legend(override.aes = list(shape = 16, size = 4)))


library(ggplot2)
library(dplyr)

# Create dataframe with significant estimates and significance stars
df <- tribble(
  ~Variable, ~Subject, ~Estimate, ~SE, ~Sig,
  "Cognition", "Maths", 0.6703, 0.0164, "***",
  "Emotional Resilience", "Maths", 0.0462, 0.0227, "**",
  "Good Conduct", "Maths", 0.0740, 0.0234, "***",
  "Focused Behaviour", "Maths", 0.2166, 0.0236, "***",
  "Male", "Maths", -0.0693, 0.0402, "*",
  "Cognition × E.R.", "Maths", -0.0316, 0.0161, "**",
  "Cognition × F.B.", "Maths", -0.0565, 0.0171, "***",
  
  "Cognition", "English", 0.4170, 0.0141, "***",
  "Focused Behaviour", "English", 0.1795, 0.0202, "***",
  "Positive Peer Relationships", "English", 0.0573, 0.0188, "***",
  "Male", "English", -0.4007, 0.0345, "***",
  "Cognition × G.C.", "English", 0.0266, 0.0157, "*",
  "Cognition × F.B.", "English", -0.0735, 0.0148, "***",
  "Cognition × P.P.R.", "English", -0.0264, 0.0128, "**"
)

# Adjust for plotting
df <- df %>%
  mutate(
    Variable = factor(Variable, levels = rev(unique(df$Variable))),
    lower = Estimate - 1.96 * SE,
    upper = Estimate + 1.96 * SE
  )

# Relabel Subject as a proper factor to avoid weird legend artifacts
df$Subject <- factor(df$Subject, levels = c("English", "Maths"))
grid::grid.newpage()

# Create the plot (updated legend title fix)
ggplot(df, aes(x = Estimate, y = Variable, color = Subject)) +
  geom_point(position = position_dodge(width = 0.7), size = 3) +
  geom_errorbarh(aes(xmin = lower, xmax = upper), height = 0.2,
                 position = position_dodge(width = 0.7)) +
  geom_text(aes(label = Sig), hjust = -1.2,
            position = position_dodge(width = 0.7), size = 4) +
  scale_color_manual(
    values = c("Maths" = "#1f77b4", "English" = "#ffb000"),
    name = "Subject"  # ✅ Explicitly reset the legend title
  ) +
  labs(
    title = "Effects of Cognitive Ability and SDQ Dimensions on Academic Performance",
    subtitle = "Significant Estimates with 95% Confidence Intervals (Model 3)",
    x = "Standardized Coefficient",
    y = NULL
  ) +
  theme_minimal(base_size = 13) +
  theme(legend.position = "top")



library(tidyverse)

df_maths <- tribble(
  ~Parameter, ~Model, ~Group, ~Estimate, ~SE, ~Sig,
  # TIPI
  "α (Cognition)", "TIPI", "Full Sample", 0.83, 0.02, "***",
  "α (Cognition)", "TIPI", "Boys",        0.85, 0.02, "***",
  "α (Cognition)", "TIPI", "Girls",       0.82, 0.02, "***",
  
  "β (Noncognition)", "TIPI", "Full Sample", 0.04, 0.01, "***",
  "β (Noncognition)", "TIPI", "Boys",        0.04, 0.01, "***",
  "β (Noncognition)", "TIPI", "Girls",       0.05, 0.01, "***",
  
  "γ1 (Cognition²)", "TIPI", "Boys",   0.31, 0.18, "*",
  
  "γ2 (Noncognition²)", "TIPI", "Full Sample", 0.05, 0.01, "***",
  "γ2 (Noncognition²)", "TIPI", "Boys",        0.03, 0.02, "*",
  "γ2 (Noncognition²)", "TIPI", "Girls",       0.07, 0.02, "***",
  
  "γ12 (Cognition×Noncognition)", "TIPI", "Boys", -0.09, 0.04, "**",
  
  # SDQ
  "α (Cognition)", "SDQ", "Full Sample", 0.79, 0.02, "***",
  "α (Cognition)", "SDQ", "Boys",        0.81, 0.02, "***",
  "α (Cognition)", "SDQ", "Girls",       0.78, 0.02, "***",
  
  "β (Noncognition)", "SDQ", "Full Sample", 0.10, 0.01, "***",
  "β (Noncognition)", "SDQ", "Boys",        0.09, 0.01, "***",
  "β (Noncognition)", "SDQ", "Girls",       0.12, 0.01, "***",
  
  "γ1 (Cognition²)", "SDQ", "Full Sample", 0.20, 0.11, "*",
  "γ1 (Cognition²)", "SDQ", "Boys",        0.37, 0.18, "**",
  
  "γ2 (Noncognition²)", "SDQ", "Full Sample", 0.06, 0.01, "***",
  "γ2 (Noncognition²)", "SDQ", "Boys",        0.05, 0.01, "***",
  "γ2 (Noncognition²)", "SDQ", "Girls",       0.08, 0.02, "***",
  
  "γ12 (Cognition×Noncognition)", "SDQ", "Full Sample", -0.13, 0.03, "***",
  "γ12 (Cognition×Noncognition)", "SDQ", "Boys",        -0.11, 0.04, "***",
  "γ12 (Cognition×Noncognition)", "SDQ", "Girls",       -0.15, 0.05, "***"
)

df_maths <- df_maths %>%
  mutate(
    Group = factor(Group, levels = c("Boys", "Full Sample", "Girls")),
    Parameter = factor(Parameter, levels = rev(unique(df_maths$Parameter))),
    lower = Estimate - 1.96 * SE,
    upper = Estimate + 1.96 * SE
  )

ggplot(df_maths, aes(x = Estimate, y = Parameter, color = Model, shape = Group)) +
  geom_point(position = position_dodge(width = 0.7), size = 3) +
  geom_errorbarh(aes(xmin = lower, xmax = upper), height = 0.2,
                 position = position_dodge(width = 0.7)) +
  geom_text(aes(label = Sig), hjust = -1.2,
            position = position_dodge(width = 0.7), size = 4) +
  scale_color_manual(values = c("SDQ" = "#ffb000", "TIPI" = "#1f77b4")) +
  scale_shape_manual(values = c(17, 16, 15)) +
  labs(
    title = "Translog Production Function Estimates for Maths Achievement",
    subtitle = "Comparison of TIPI and SDQ Models Across Full Sample and Gender Subgroups",
    x = "Estimate with 95% CI",
    y = NULL,
    color = "Model",
    shape = "Sample"
  ) +
  theme_minimal(base_size = 13) +
  theme(legend.position = "top")




library(tidyverse)

df_english <- tribble(
  ~Parameter, ~Model, ~Group, ~Estimate, ~SE, ~Sig,
  
  # TIPI
  "α (Cognition)", "TIPI", "Full Sample", 0.45, 0.01, "***",
  "α (Cognition)", "TIPI", "Boys",        0.51, 0.02, "***",
  "α (Cognition)", "TIPI", "Girls",       0.44, 0.02, "***",
  
  "β (Noncognition)", "TIPI", "Full Sample", 0.02, 0.00, "***",
  "β (Noncognition)", "TIPI", "Boys",        0.02, 0.01, "***",
  "β (Noncognition)", "TIPI", "Girls",       0.02, 0.01, "***",
  
  "γ1 (Cognition²)", "TIPI", "Full Sample", -0.25, 0.09, "***",
  "γ1 (Cognition²)", "TIPI", "Girls",       -0.32, 0.12, "***",
  
  "γ2 (Noncognition²)", "TIPI", "Full Sample", 0.03, 0.01, "***",
  "γ2 (Noncognition²)", "TIPI", "Boys",        0.03, 0.02, "*",
  
  # SDQ
  "α (Cognition)", "SDQ", "Full Sample", 0.41, 0.01, "***",
  "α (Cognition)", "SDQ", "Boys",        0.47, 0.02, "***",
  "α (Cognition)", "SDQ", "Girls",       0.41, 0.02, "***",
  
  "β (Noncognition)", "SDQ", "Full Sample", 0.09, 0.01, "***",
  "β (Noncognition)", "SDQ", "Boys",        0.07, 0.01, "***",
  "β (Noncognition)", "SDQ", "Girls",       0.08, 0.01, "***",
  
  "γ1 (Cognition²)", "SDQ", "Full Sample", -0.17, 0.09, "*",
  
  "γ2 (Noncognition²)", "SDQ", "Full Sample", 0.06, 0.01, "***",
  "γ2 (Noncognition²)", "SDQ", "Boys",        0.05, 0.01, "***",
  "γ2 (Noncognition²)", "SDQ", "Girls",       0.06, 0.01, "***",
  
  "γ12 (Cognition×Noncognition)", "SDQ", "Full Sample", -0.12, 0.02, "***",
  "γ12 (Cognition×Noncognition)", "SDQ", "Boys",        -0.12, 0.03, "***",
  "γ12 (Cognition×Noncognition)", "SDQ", "Girls",       -0.15, 0.04, "***"
)

df_english <- df_english %>%
  mutate(
    Group = factor(Group, levels = c("Boys", "Full Sample", "Girls")),
    Parameter = factor(Parameter, levels = rev(unique(df_english$Parameter))),
    lower = Estimate - 1.96 * SE,
    upper = Estimate + 1.96 * SE
  )
grid::grid.newpage()

ggplot(df_english, aes(x = Estimate, y = Parameter, color = Model, shape = Group)) +
  geom_point(position = position_dodge(width = 0.7), size = 3) +
  geom_errorbarh(aes(xmin = lower, xmax = upper), height = 0.2,
                 position = position_dodge(width = 0.7)) +
  geom_text(aes(label = Sig), hjust = -1.2,
            position = position_dodge(width = 0.7), size = 4) +
  scale_color_manual(values = c("SDQ" = "#ffb000", "TIPI" = "#1f77b4")) +
  scale_shape_manual(values = c(17, 16, 15)) +
  labs(
    title = "Translog Production Function Estimates for English Achievement",
    subtitle = "Comparison of TIPI and SDQ Models Across Full Sample and Gender Subgroups",
    x = "Estimate with 95% CI",
    y = NULL,
    color = "Model",
    shape = "Sample"
  ) +
  theme_minimal(base_size = 13) +
  theme(legend.position = "top")
