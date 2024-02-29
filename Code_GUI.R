#--------------------------------
# YP TIPI variables:

# Wave 3
# Child self report:
# Extravert: w3cq_extravert
# Agreeable: w3cq_agreeable
# Conscientious: w3cq_conscientious
# Emotional stability: w3cq_emotstab
# Openess: w3cq_openness

# PCG on STUDY CHILD TIPI:
# Extravert: w3pc_extraver
# Agreeable: w3pc_agreeable
# Conscientious: w3pc_conscientious
# Emotional stability: w3pc_emotstab
# Openess: w3pc_openness

# SCG on STUDY CHILD TIPI:
# Extravert: w3sc_extravert
# Agreeable: w3sc_agreeable
# Conscientious: w3sc_conscientious
# Emotional stability: w3sc_emotstab
# Openess: w3sc_openness

# Wave 2: 
# PCG on STUDY CHILD TIPI:
# Extravert: w2pcd3_extraver
# Agreeable: w2pcd3_agreeable
# Conscientious: w2pcd3_conscientious
# Emotional stability: w2pcd3_emotstab
# Openess: w2pcd3_openness

# TIPI vars PCG on STUDY CHILD: w2pcd3_extravert, w2pcd3_agreeable, w2pcd3_conscientious, w2pcd3_emotstab, w2pcd3_openness

# Wave 3:
# TIPI vars STUDY CHILD: w3cq_extravert, w3cq_agreeable, w3cq_conscientious, w3cq_emotstab, w3cq_openness -> 1:7(0.5)
# TIPI vars PCG on STUDY CHILD: w3pc_extravert, w3pc_agreeable, w3pc_conscientious, w3pc_emotstab, w3pc_openness -> 1:7(0.5)
# TIPI vars SCG on STUDY CHILD: w3sc_extravert, w3sc_agreeable, w3sc_conscientious, w3sc_emotstab, w3sc_openness -> 1:7(0.5)

# SES vars: ID, TC2 (gender, 1 = male, 2 = female), PCG born in IRE (pc3f14), SCG born in IRE(sc3e14),
# Study-child born in IRE (MML51), Study-child citizen of IRE (MML49).
# PCG highest ed level (pc3f1educ), SCG's (sc3e1educ):
# No formal education = 1, Primary education = 2,
# Lower Secondary = 3, Upper Secondary = 4, Technical or Vocational qualification = 5,  
# Both Upper Secondary and Technical or Vocational qualification =6, (drop 99 and NA)

# PCG's mother (pc3j15), PCG's father(pc3j5), SCG's mother(sc3f15), SCG's father (sc3f5):
# Primary level or no formal education = 1
# Lower secondary level (e.g. Junior/Intermediate Certificate)= 2
# Upper secondary level (e.g. Leaving Certificate) = 3
# Third level or equivalent (e.g. Degree or professional qualification, etc) = 4

# Parental involvement vars (PCG):
# Discussed subjects: pc3c2a
# Discussed amount of work: pc3c2b
# Discussed teachers: pc3c2c
# Discussed plans for the future: pc3c2d
# Discussed going on with friends: pc3c2e
# Discussed exams: pc3c2f
# How far do you expect ST to go in educ/training: pc3c3 (PCG) and sc3b1 (SCG)
# Junior Certificate or equivalent = 1, Leaving Certificate or equivalent = 2,
# An apprenticeship or trade = 3, Diploma/Certificate = 4, Degree = 5, Postgraduate/higher degree = 6,
# Don’t know = 7.

# JC grades vars (for level, change "b" to "a"):
# Irish: cq3b31b (1->5, 5 = E or lower)
# English: cq3b32b (1->5, 5 = E or lower)
# Maths: cq3b33b (1->5, 5 = E or lower)
# History: cq3b34b (1->5, 5 = E or lower)
# Geography: cq3b35b (1->5, 5 = E or lower)
# Art, craft, design: cq3b310b (1->4, 4 = D or lower)
# Science: cq3b312b (1->5, 5 = E or lower)
# French: cq3b36b (1->5, 5 = E or lower)
# German: cq3b37b (1->4, 4 = D or lower)
# Spanish: cq3b38b (1->4, 4 = D or lower)
# Music: cq3b311b (1->4, 4 = D or lower)
# Home Economics: cq3b314b (1->4, 4 = D or lower)
# Materials Technology: cq3b315b (1->4, 4 = D or lower)
# Metalwork: cq3b316b (1->4, 4 = D or lower)
# Technical Graphics: cq3b317b (1->4, 4 = D or lower)
# Business Studies: cq3b318b (1->4, 4 = D or lower)
# Technology: cq3b321b (1->4, 4 = D or lower)
# Religious Education: cq3b325b (1->4, 4 = D or lower)
# Civic, Social and Political Education: cq3b326b (1->4, 4 = D or lower)

# School vars:
# p3q6 (type of school): Fee-paying secondary = 1, Non-fee paying secondary = 2, Vocational school = 3,
# Community college = 4, Community school/Comprehensive school = 5 (99 = don't know)
# p3q7 (DEIS status): Yes, DEIS post-primary = 1, No = 5
# p3q29 (proportion of students that go to HEI, open question in the questionnaire, percentage in dataset)
#   1 [50% or fewer]   130
#   2 [51%-60%]        175
#   3 [61%-70%]        416
#   4 [71%-80%]        954
#   5 [81%-90%]       1175
#   6 [91%-100%]      1437

# Grinds costs
# variables: pc3g23b, pc3g24bcomp, cq3b17a, cq3b17b 


# # Histograms for grades and gender

# History

Merged_Child_subset$Gender_MF_2 <- factor(Merged_Child_subset$Gender_MF, levels = c(1, 2), labels = c("Male", "Female"))
Merged_Child_subset$History_Grade <- factor(Merged_Child_subset$History, levels = c(1,2,3,4,5), labels = c("E or lower", "D", "C", "B", "A"))

history_data <- Merged_Child_subset[complete.cases(Merged_Child_subset$History_Grade, Merged_Child_subset$Gender_MF_2), ]
library(ggplot2)
histhist <- ggplot(history_data, aes(x = History_Grade, fill = Gender_MF_2)) +
  geom_bar(position = "dodge") + 
  labs(title = "JC Scores in History by Gender",
       x = "Score", y = "Frequency") +
  scale_fill_manual(values = c("blue", "pink")) +
  theme_minimal() +
  theme(legend.title = element_blank(), legend.position = "bottom")
print(histhist)

# English

Merged_Child_subset$English_Grade <- factor(Merged_Child_subset$English, levels = c(1,2,3,4,5), labels = c("E or lower", "D", "C", "B", "A"))
english_data <- Merged_Child_subset[complete.cases(Merged_Child_subset$English_Grade, Merged_Child_subset$Gender_MF_2), ]

englishhist <- ggplot(english_data, aes(x = English_Grade, fill = Gender_MF_2)) +
  geom_bar(position = "dodge") + 
  labs(title = "JC Scores in English by Gender",
       x = "Score", y = "Frequency") +
  scale_fill_manual(values = c("blue", "pink")) +
  theme_minimal() +
  theme(legend.title = element_blank(), legend.position = "bottom")
plot(englishhist)

# Maths

Merged_Child_subset$Maths_Grade <- factor(Merged_Child_subset$Maths, levels = c(1,2,3,4,5), labels = c("E or lower", "D", "C", "B", "A"))

maths_data <- Merged_Child_subset[complete.cases(Merged_Child_subset$Maths_Grade, Merged_Child_subset$Gender_MF_2), ]

mathshist <- ggplot(maths_data, aes(x = Maths_Grade, fill = Gender_MF_2)) +
  geom_bar(position = "dodge") + 
  labs(title = "JC Scores in Maths by Gender",
       x = "Score", y = "Frequency") +
  scale_fill_manual(values = c("blue", "pink")) +
  theme_minimal() +
  theme(legend.title = element_blank(), legend.position = "bottom")
plot(mathshist)

# Irish

Merged_Child_subset$Irish_Grade <- factor(Merged_Child_subset$Irish, levels = c(1,2,3,4,5), labels = c("E or lower", "D", "C", "B", "A"))

irish_data <- Merged_Child_subset[complete.cases(Merged_Child_subset$Irish_Grade, Merged_Child_subset$Gender_MF_2), ]

irishhist <- ggplot(irish_data, aes(x = Irish_Grade, fill = Gender_MF_2)) +
  geom_bar(position = "dodge") + 
  labs(title = "JC Scores in Irish by Gender",
       x = "Score", y = "Frequency") +
  scale_fill_manual(values = c("blue", "pink")) +
  theme_minimal() +
  theme(legend.title = element_blank(), legend.position = "bottom")
plot(irishhist)

# Plotting side by side

library(gridExtra)
side_by_side <- grid.arrange(englishhist, irishhist, histhist, mathshist, nrow = 2, ncol = 2)

# Saving the plots

ggsave("Frequency of Test Scores in Irish by Gender.jpeg", plot = irishhist, width = 6, height = 4, dpi = 300)
ggsave("Frequency of Test Scores in History by Gender.jpeg", plot = histhist, width = 6, height = 4, dpi = 300)
ggsave("Frequency of Test Scores in Maths by Gender.jpeg", plot = mathshist, width = 6, height = 4, dpi = 300)
ggsave("Frequency of Test Scores in English by Gender.jpeg", plot = englishhist, width = 6, height = 4, dpi = 300)
ggsave("Frequency of Test Scores by Gender side by side.jpeg", plot = side_by_side, width = 12, height = 8, dpi = 300)

# Histograms for TIPI scores YP WAVE 3

# Extravert

Extravert_YPW3_data <- Merged_Child_subset[complete.cases(Merged_Child_subset$Extravert_W3_YP, Merged_Child_subset$Gender_MF_2), ]

Extravert_YPW3_hist <- ggplot(Extravert_YPW3_data , aes(x = Extravert_W3_YP, fill = Gender_MF_2)) +
  geom_histogram(binwidth = 0.25,position = "dodge") + 
  labs(title = "Extravert scores by Gender, YP W3",
       x = "Score", y = "Frequency") +
  scale_fill_manual(values = c("blue", "pink")) +
  theme_minimal() +
  theme(legend.title = element_blank(), legend.position = "bottom")
print(Extravert_YPW3_hist)

# Openness

Openness_YPW3_data <- Merged_Child_subset[complete.cases(Merged_Child_subset$Openness_W3_YP, Merged_Child_subset$Gender_MF_2), ]

Open_YPW3_hist <- ggplot(Openness_YPW3_data, aes(x = Openness_W3_YP, fill = Gender_MF_2)) +
  geom_histogram(binwidth = 0.25,position = "dodge") + 
  labs(title = "Openness scores by Gender, YP W3",
       x = "Score", y = "Frequency") +
  scale_fill_manual(values = c("blue", "pink")) +
  theme_minimal() +
  theme(legend.title = element_blank(), legend.position = "bottom")
print(Open_YPW3_hist)

# Emotional Stability

Emostab_YPW3_data <- Merged_Child_subset[complete.cases(Merged_Child_subset$Emo_Stability_W3_YP, Merged_Child_subset$Gender_MF_2), ]

# Create histogram using ggplot2
Emostab_YPW3_hist <- ggplot(Emostab_YPW3_data, aes(x = Emo_Stability_W3_YP, fill = Gender_MF_2)) +
  geom_histogram(binwidth = 0.25,position = "dodge") + 
  labs(title = "Emot. Stability scores by Gender, YP W3",
       x = "Score", y = "Frequency") +
  scale_fill_manual(values = c("blue", "pink")) +
  theme_minimal() +
  theme(legend.title = element_blank(), legend.position = "bottom")
print(Emostab_YPW3_hist)

# Conscientious

Cons_YPW3_data <- Merged_Child_subset[complete.cases(Merged_Child_subset$Conscientious_W3_YP, Merged_Child_subset$Gender_MF_2), ]

Cons_YPW3_hist <- ggplot(Cons_YPW3_data, aes(x = Conscientious_W3_YP, fill = Gender_MF_2)) +
  geom_histogram(binwidth = 0.25,position = "dodge") + 
  labs(title = "Conscientious scores by Gender, YP W3",
       x = "Score", y = "Frequency") +
  scale_fill_manual(values = c("blue", "pink")) +
  theme_minimal() +
  theme(legend.title = element_blank(), legend.position = "bottom")
print(Cons_YPW3_hist)

# Agreeable

Agreeable_YPW3_data <- Merged_Child_subset[complete.cases(Merged_Child_subset$Agreeable_W3_YP, Merged_Child_subset$Gender_MF_2), ]

Agreeable_YPW3_hist <- ggplot(Agreeable_YPW3_data, aes(x = Agreeable_W3_YP, fill = Gender_MF_2)) +
  geom_histogram(binwidth = 0.25,position = "dodge") + 
  labs(title = "Agreeable scores by Gender, YP W3",
       x = "Score", y = "Frequency") +
  scale_fill_manual(values = c("blue", "pink")) +
  theme_minimal() +
  theme(legend.title = element_blank(), legend.position = "bottom")
print(Agreeable_YPW3_hist)

# Plotting side by side 

library(gridExtra)
grid.arrange(Agreeable_YPW3_hist, Open_YPW3_hist, Emostab_YPW3_hist, Extravert_YPW3_hist, Cons_YPW3_hist, nrow = 3, ncol = 2)

# Saving the plots 

ggsave("Frequency of Agreeable by Gender.jpeg", plot = Agreeable_YPW3_hist, width = 6, height = 4, dpi = 300)
ggsave("Frequency of Conscientious by Gender.jpeg", plot = Cons_YPW3_hist, width = 6, height = 4, dpi = 300)
ggsave("Frequency of Emotional Stability Gender.jpeg", plot = Emostab_YPW3_hist, width = 6, height = 4, dpi = 300)
ggsave("Frequency of Extravert by Gender.jpeg", plot = Extravert_YPW3_hist, width = 6, height = 4, dpi = 300)
ggsave("Frequency of Openness by Gender side by side.jpeg", plot = Open_YPW3_hist, width = 6, height = 4, dpi = 300)


# Histograms for TIPI scores, PCG on Child, Waves 2 and 3

# OPENNESS PCG WAVES 2 AND 3

library(ggplot2)
library(nord)

nord_colors_1 <- c("#D08770", "#EBCB8B")
nord_colors <- c("#EBCB8B", "#BF616A")
nord_colors2 <- c("#EBCB8B","#B48EAD")
nord_colors3 <- c("#5E81AC", "#A3BE8C")

# OPENNESS PCG WAVES 2 AND 3 

wave3_frequencies_open <- data.frame(
  Openness = c(0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(7, 12, 39, 69, 99, 217, 559, 633, 701, 689, 934, 1002, 1016, 62),
  Wave = "Wave 3"
)

wave2_frequencies_open <- data.frame(
  Openness = c(0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(36, 128, 151, 209, 319, 688, 867, 319, 318, 339, 418, 412, 437, 1386),
  Wave = "Wave 2"
)

combined_frequencies_open <- rbind(wave3_frequencies_open, wave2_frequencies_open)

scatterplot_open <- ggplot(combined_frequencies_open, aes(x = Openness, y = Frequency, color = Wave)) +
  geom_point(size = 3) +  
  labs(title = "Openness scores by Wave, PCG on YP",
       x = "Openness Score", y = "Frequency") +
  scale_x_continuous(breaks = seq(0, 7, by = 0.5)) +
  scale_color_manual(values = nord_colors_1) + 
  theme_minimal() +
  theme(legend.position = "bottom")

print(scatterplot_open)

# AGREEABLE PCG WAVES 2 AND 3

agreeable_wave2 <- data.frame(
  Agreeable = c(0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(31, 144, 385, 111, 193, 441, 702, 245, 204, 545, 252, 288, 484, 2010),
  Wave = "Wave 2"
)

agreeable_wave3 <- data.frame(
  Agreeable = c(1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(6, 8, 34, 33, 80, 198, 449, 610, 691, 451, 814, 1091, 1523),
  Wave = "Wave 3"
)

combined_agreeable <- rbind(agreeable_wave2, agreeable_wave3)

scatterplot_agreeable <- ggplot(combined_agreeable, aes(x = Agreeable, y = Frequency, color = Wave)) +
  geom_point(size = 3) +  
  labs(title = "Agreeable scores by Wave, PCG on YP",
       x = "Agreeable Score", y = "Frequency") +
  scale_x_continuous(breaks = seq(0, 7, by = 0.5)) +
  scale_color_manual(values = nord_colors_1) +  
  theme_minimal() +
  theme(legend.position = "bottom")

print(scatterplot_agreeable)

# EMOTIONAL STABILITY PCG WAVES 2 AND 3

emo_stability_wave2 <- data.frame(
  Emo_Stability = c(0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(61, 232, 563, 198, 259, 643, 693, 383, 313, 529, 256, 217, 395, 1291),
  Wave = "Wave 2"
)

emo_stability_wave3 <- data.frame(
  Emo_Stability = c(1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(42, 55, 93, 122, 221, 246, 536, 758, 599, 485, 821, 882, 1126),
  Wave = "Wave 3"
)

combined_emo_stability <- rbind(emo_stability_wave2, emo_stability_wave3)

scatterplot_emo_stability <- ggplot(combined_emo_stability, aes(x = Emo_Stability, y = Frequency, color = Wave)) +
  geom_point(size = 3) + 
  labs(title = "Emot. Stability scores by Wave, PCG on YP",
       x = "Emotional Stability Score", y = "Frequency") +
  scale_x_continuous(breaks = seq(0, 7, by = 0.5)) +
  scale_color_manual(values = nord_colors_1) +  
  theme_minimal() +
  theme(legend.position = "bottom")

print(scatterplot_emo_stability)

# EXTRAVERT PCG WAVES 2 AND 3

extravert_wave2 <- data.frame(
  Extravert = c(0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(114, 370, 569, 268, 391, 658, 761, 484, 326, 384, 232, 223, 298, 955),
  Wave = "Wave 2"
)

extravert_wave3 <- data.frame(
  Extravert = c(1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(93, 98, 204, 237, 326, 485, 850, 814, 552, 424, 616, 608, 682),
  Wave = "Wave 3"
)

combined_extravert <- rbind(extravert_wave2, extravert_wave3)

scatterplot_extravert <- ggplot(combined_extravert, aes(x = Extravert, y = Frequency, color = Wave)) +
  geom_point(size = 3) +  
  labs(title = "Extravert scores by Wave, PCG on YP",
       x = "Extraversion Score", y = "Frequency") +
  scale_x_continuous(breaks = seq(0, 7, by = 0.5)) +
  scale_color_manual(values = nord_colors_1) + 
  theme_minimal() +
  theme(legend.position = "bottom")

print(scatterplot_extravert)

# CONSCIENTIOUS PCG WAVES 2 AND 3

conscientious_wave2 <- data.frame(
  Conscientious = c(0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(158, 300, 592, 201, 257, 479, 615, 411, 339, 610, 206, 187, 341, 1337),
  Wave = "Wave 2"
)

conscientious_wave3 <- data.frame(
  Conscientious = c(1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(27, 44, 86, 119, 212, 321, 634, 843, 744, 415, 555, 712, 1271),
  Wave = "Wave 3"
)

combined_conscientious <- rbind(conscientious_wave2, conscientious_wave3)

scatterplot_conscientious <- ggplot(combined_conscientious, aes(x = Conscientious, y = Frequency, color = Wave)) +
  geom_point(size = 3) + 
  labs(title = "Conscientious scores by Wave, PCG on YP",
       x = "Conscientiousness Score", y = "Frequency") +
  scale_x_continuous(breaks = seq(0, 7, by = 0.5)) +
  scale_color_manual(values = nord_colors_1) +  
  theme(legend.position = "bottom")

print(scatterplot_conscientious)

# Plotting histograms for TIPI scores, PCG on Child, Waves 2 and 3 side by side

library(gridExtra)
grid.arrange(scatterplot_agreeable, scatterplot_conscientious, scatterplot_emo_stability, 
            scatterplot_extravert, scatterplot_open, nrow = 3, ncol = 2)

# Saving the scatterplots

ggsave("Frequency of Agreeable by Wave, PCG.jpeg", plot = scatterplot_agreeable, width = 6, height = 4, dpi = 300)
ggsave("Frequency of Conscientious by Wave, PCG.jpeg", plot = scatterplot_conscientious, width = 6, height = 4, dpi = 300)
ggsave("Frequency of Emotional Stability by Wave, PCG.jpeg", plot = scatterplot_emo_stability, width = 6, height = 4, dpi = 300)
ggsave("Frequency of Extravert by Wave, PCG.jpeg", plot = scatterplot_extravert, width = 6, height = 4, dpi = 300)
ggsave("Frequency of Openness by Wave, PCG.jpeg", plot = scatterplot_open, width = 6, height = 4, dpi = 300)


# Histograms for TIPI scores, PCG and SCG on Child, Wave 3

# CONSCIENTIOUS TIPI scores, PCG and SCG on Child, Wave 3

# PCG Conscientiousness scores
pcg_conscientiousness <- data.frame(
  Conscientiousness = c(1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(27, 44, 86, 119, 212, 321, 634, 843, 744, 415, 555, 712, 1271),  # Updated frequencies
  Caregiver = "PCG"
)

# SCG Conscientiousness scores
scg_conscientiousness <- data.frame(
  Conscientiousness = c(1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(15, 32, 48, 73, 129, 172, 428, 526, 436, 300, 458, 528, 803),  # Updated frequencies
  Caregiver = "SCG"
)

combined_conscientious <- rbind(pcg_conscientiousness, scg_conscientiousness)

scatterplot_conscientious_PCGSCG <- ggplot(combined_conscientious, aes(x = Conscientiousness, y = Frequency, color = Caregiver)) +
  geom_point(size = 3) +  
  labs(title = "Conscientious scores PCG and SCG on YP, W3",
       x = "Conscientiousness Score", y = "Frequency") +
  scale_x_continuous(breaks = seq(1, 7, by = 0.5)) +
  scale_color_manual(values = nord_colors) + 
  theme_minimal() +
  theme(legend.position = "bottom")

print(scatterplot_conscientious_PCGSCG)

# OPENNESS TIPI scores, PCG and SCG on Child, Wave 3

# Openness scores for Primary Caregiver (PCG)
pcg_openness <- data.frame(
  Openness = c(1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(7, 12, 39, 69, 99, 217, 559, 633, 701, 689, 934, 1002, 1016),
  Caregiver = "PCG"
)

# Openness scores for Secondary Caregiver (SCG)
scg_openness <- data.frame(
  Openness = c(1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(2, 8, 23, 30, 83, 148, 382, 360, 407, 542, 717, 651, 593),
  Caregiver = "SCG"
)

# Combine PCG and SCG data
combined_openness <- rbind(pcg_openness, scg_openness)

scatterplot_openness_PCGSCG <- ggplot(combined_openness, aes(x = Openness, y = Frequency, color = Caregiver)) +
  geom_point(size = 3) +
  labs(title = "Openness scores PCG and SCG on YP, W3",
       x = "Openness Score", y = "Frequency") +
  scale_x_continuous(breaks = seq(1, 7, by = 0.5)) +
  scale_color_manual(values = nord_colors) +
  theme_minimal() +
  theme(legend.position = "bottom")

print(scatterplot_openness_PCGSCG)

# AGREEABLE TIPI scores, PCG and SCG on Child, Wave 3

# Agreeable scores for Primary Caregiver (PCG)
pcg_agreeable <- data.frame(
  Agreeable = c(1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(6, 8, 34, 33, 80, 198, 449, 610, 691, 451, 814, 1091, 1523),
  Caregiver = "PCG"
)

# Agreeable scores for Secondary Caregiver (SCG)
scg_agreeable <- data.frame(
  Agreeable = c(1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(7, 4, 21, 39, 70, 125, 298, 450, 459, 398, 529, 677, 872),
  Caregiver = "SCG"
)

combined_agreeable <- rbind(pcg_agreeable, scg_agreeable)

scatterplot_agreeable_PCGSCG <- ggplot(combined_agreeable, aes(x = Agreeable, y = Frequency, color = Caregiver)) +
  geom_point(size = 3) +
  labs(title = "Agreeable scores PCG and SCG on YP, W3",
       x = "Agreeable Score", y = "Frequency") +
  scale_x_continuous(breaks = seq(1, 7, by = 0.5)) +
  scale_color_manual(values = nord_colors) +
  theme_minimal() +
  theme(legend.position = "bottom")

print(scatterplot_agreeable_PCGSCG)

# EMOTIONAL STABILITY TIPI scores, PCG and SCG on Child, Wave 3

# Emotional Stability scores for Primary Caregiver (PCG)
pcg_emotional_stability <- data.frame(
  Emo_Stability = c(1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(42, 55, 93, 122, 221, 246, 536, 758, 599, 485, 821, 882, 1126),
  Caregiver = "PCG"
)

# Emotional Stability scores for Secondary Caregiver (SCG)
scg_emotional_stability <- data.frame(
  Emo_Stability = c(1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(11, 33, 48, 64, 123, 167, 419, 493, 430, 338, 550, 594, 679),
  Caregiver = "SCG"
)

# Combine PCG and SCG data
combined_emotional_stability <- rbind(pcg_emotional_stability, scg_emotional_stability)

scatterplot_emotional_stability_PCGSCG <- ggplot(combined_emotional_stability, aes(x = Emo_Stability, y = Frequency, color = Caregiver)) +
  geom_point(size = 3) +
  labs(title = "Emot. Stability scores PCG and SCG on YP, W3",
       x = "Emotional Stability Score", y = "Frequency") +
  scale_x_continuous(breaks = seq(1, 7, by = 0.5)) +
  scale_color_manual(values = nord_colors) +
  theme_minimal() +
  theme(legend.position = "bottom")

print(scatterplot_emotional_stability_PCGSCG)

# EXTRAVERT TIPI scores, PCG and SCG on Child, Wave 3

# Extravert scores for Primary Caregiver (PCG)
pcg_extravert <- data.frame(
  Extravert = c(1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(93, 98, 204, 237, 326, 485, 850, 814, 552, 424, 616, 608, 682),
  Caregiver = "PCG"
)

# Extravert scores for Secondary Caregiver (SCG)
scg_extravert <- data.frame(
  Extravert = c(1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(33, 59, 132, 186, 223, 326, 589, 546, 409, 298, 421, 363, 362),
  Caregiver = "SCG"
)

# Combine PCG and SCG data
combined_extravert <- rbind(pcg_extravert, scg_extravert)

scatterplot_extravert_PCGSCG <- ggplot(combined_extravert, aes(x = Extravert, y = Frequency, color = Caregiver)) +
  geom_point(size = 3) +
  labs(title = "Extravert scores PCG and SCG on YP, W3",
       x = "Extravert Score", y = "Frequency") +
  scale_x_continuous(breaks = seq(1, 7, by = 0.5)) +
  scale_color_manual(values = nord_colors) +
  theme_minimal() +
  theme(legend.position = "bottom")

print(scatterplot_extravert_PCGSCG)

# Comparison side by side 

library(gridExtra)
grid.arrange(scatterplot_agreeable_PCGSCG, scatterplot_conscientious_PCGSCG, scatterplot_emotional_stability_PCGSCG, 
             scatterplot_extravert_PCGSCG, scatterplot_openness_PCGSCG, nrow = 3, ncol = 2)

# Saving the scatterplots:

ggsave("Frequency of Agreeable by participant w3.jpeg", plot = scatterplot_agreeable_PCGSCG, width = 7, height = 4, dpi = 300)
ggsave("Frequency of Conscientious by participant w3.jpeg", plot = scatterplot_conscientious_PCGSCG, width = 7, height = 4, dpi = 300)
ggsave("Frequency of Emotional Stability by participant w3.jpeg", plot = scatterplot_emotional_stability_PCGSCG, width = 7, height = 4, dpi = 300)
ggsave("Frequency of Extravert by participant w3.jpeg", plot = scatterplot_extravert_PCGSCG, width = 7, height = 4, dpi = 300)
ggsave("Frequency of Openness by participant w3.jpeg", plot = scatterplot_openness_PCGSCG, width = 7, height = 4, dpi = 300)

# Histograms for TIPI scores, PCG and SCG on Child, Wave 3

# AGREEABLE TIPI scores, YP and PCG on Child, Wave 3

# YP Agreeable scores
yp_agreeable <- data.frame(
  Agreeable = c(1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(11, 32, 51, 107, 262, 511, 1119, 1237, 978, 703, 540, 304, 169),
  Participant = "Young Person"
)

# PCG Agreeable scores
pcg_agreeable_w3 <- data.frame(
  Agreeable = c(1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(6, 8, 34, 33, 80, 198, 449, 610, 691, 451, 814, 1091, 1523),
  Participant = "Primary Caregiver"
)

# Combine YP and PCG data
combined_agreeable_w3 <- rbind(yp_agreeable, pcg_agreeable_w3)

scatterplot_agreeable_YPPCG <- ggplot(combined_agreeable_w3, aes(x = Agreeable, y = Frequency, color = Participant)) +
  geom_point(size = 3) +
  labs(title = "Agreeable scores YP and PCG on YP, W3",
       x = "Agreeable Score", y = "Frequency") +
  scale_x_continuous(breaks = seq(1, 7, by = 0.5)) +
  scale_color_manual(values = nord_colors2) +
  theme_minimal() +
  theme(legend.position = "bottom")

print(scatterplot_agreeable_YPPCG)

# EMOTIONAL STABILITY TIPI scores, YP and PCG on Child, Wave 3

# PCG Emotional Stability scores
pcg_emotional_stability_w3 <- data.frame(
  Emotional_Stability = c(1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(42, 55, 93, 122, 221, 246, 536, 758, 599, 485, 821, 882, 1126),
  Participant = "Primary Caregiver"
)

# YP Emotional Stability scores
yp_emotional_stability <- data.frame(
  Emotional_Stability = c(1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(39, 70, 152, 223, 407, 508, 752, 748, 742, 716, 878, 456, 338),
  Participant = "Young Person"
)

# Combine PCG and YP data
combined_emotional_stability_w3 <- rbind(pcg_emotional_stability_w3, yp_emotional_stability)

scatterplot_emotional_stability_YPPCG <- ggplot(combined_emotional_stability_w3, aes(x = Emotional_Stability, y = Frequency, color = Participant)) +
  geom_point(size = 3) +
  labs(title = "Emot. Stability scores YP and PCG on YP, W3",
       x = "Emotional Stability Score", y = "Frequency") +
  scale_x_continuous(breaks = seq(1, 7, by = 0.5)) +
  scale_color_manual(values = nord_colors2) +
  theme_minimal() +
  theme(legend.position = "bottom")

print(scatterplot_emotional_stability_YPPCG)

# OPENNESS TIPI scores, YP and PCG on Child, Wave 3

# PCG Openness scores
pcg_openness_w3 <- data.frame(
  Openness = c(1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(7, 12, 39, 69, 99, 217, 559, 633, 701, 689, 934, 1002, 1016),
  Participant = "Primary Caregiver"
)

# YP Openness scores
yp_openness <- data.frame(
  Openness = c(1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(1, 2, 22, 33, 90, 147, 416, 619, 885, 1108, 1179, 899, 624),
  Participant = "Young Person"
)

# Combine PCG and YP data
combined_openness_w3 <- rbind(pcg_openness_w3, yp_openness)

scatterplot_openness_YPPCG <- ggplot(combined_openness_w3, aes(x = Openness, y = Frequency, color = Participant)) +
  geom_point(size = 3) +
  labs(title = "Openness scores YP and PCG on YP, W3",
       x = "Openness Score", y = "Frequency") +
  scale_x_continuous(breaks = seq(1, 7, by = 0.5)) +
  scale_color_manual(values = nord_colors2) +
  theme_minimal() +
  theme(legend.position = "bottom")

print(scatterplot_openness_YPPCG)

# EXTRAVERT TIPI scores, YP and PCG on Child, Wave 3

# PCG Extravert scores
pcg_extravert_w3 <- data.frame(
  Extravert = c(1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(93, 98, 204, 237, 326, 485, 850, 814, 552, 424, 616, 608, 682),
  Participant = "Primary Caregiver"
)

# YP Extravert scores
yp_extravert <- data.frame(
  Extravert = c(1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(37, 73, 140, 235, 328, 452, 794, 868, 735, 742, 765, 518, 340),
  Participant = "Young Person"
)

# Combine PCG and YP data
combined_extravert_w3 <- rbind(pcg_extravert_w3, yp_extravert)

scatterplot_extravert_YPPCG <- ggplot(combined_extravert_w3, aes(x = Extravert, y = Frequency, color = Participant)) +
  geom_point(size = 3) +
  labs(title = "Extravert scores YP and PCG on YP, W3",
       x = "Extravert Score", y = "Frequency") +
  scale_x_continuous(breaks = seq(1, 7, by = 0.5)) +
  scale_color_manual(values = nord_colors2) +
  theme_minimal() +
  theme(legend.position = "bottom")

print(scatterplot_extravert_YPPCG)

# CONSCIENTIOUS TIPI scores, YP and PCG on Child, Wave 3

# PCG Conscientious scores
pcg_conscientious_w3 <- data.frame(
  Conscientious = c(1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(27, 44, 86, 119, 212, 321, 634, 843, 744, 415, 555, 712, 1271),
  Participant = "Primary Caregiver"
)

# YP Conscientious scores
yp_conscientious <- data.frame(
  Conscientious = c(1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(5, 17, 60, 91, 186, 318, 595, 811, 798, 923, 1003, 736, 484),
  Participant = "Young Person"
)

# Combine PCG and YP data
combined_conscientious_w3 <- rbind(pcg_conscientious_w3, yp_conscientious)

scatterplot_conscientious_YPPCG <- ggplot(combined_conscientious_w3, aes(x = Conscientious, y = Frequency, color = Participant)) +
  geom_point(size = 3) +
  labs(title = "Conscientious scores YP and PCG on YP, W3",
       x = "Conscientious Score", y = "Frequency") +
  scale_x_continuous(breaks = seq(1, 7, by = 0.5)) +
  scale_color_manual(values = nord_colors2) +
  theme_minimal() +
  theme(legend.position = "bottom")

print(scatterplot_conscientious_YPPCG)

# Plotting side by side:

library(gridExtra)
grid.arrange(scatterplot_agreeable_YPPCG, scatterplot_conscientious_YPPCG, scatterplot_emotional_stability_YPPCG, 
             scatterplot_extravert_YPPCG, scatterplot_openness_YPPCG, nrow = 3, ncol = 2)

# Saving the plots

ggsave("Frequency of Agreeable by participant w3a.jpeg", plot = scatterplot_agreeable_YPPCG, width = 7, height = 4, dpi = 300)
ggsave("Frequency of Conscientious by participant w3a.jpeg", plot = scatterplot_conscientious_YPPCG, width = 7, height = 4, dpi = 300)
ggsave("Frequency of Emotional Stability by participant w3a.jpeg", plot = scatterplot_emotional_stability_YPPCG, width = 7, height = 4, dpi = 300)
ggsave("Frequency of Extravert by participant w3a.jpeg", plot = scatterplot_extravert_YPPCG, width = 7, height = 4, dpi = 300)
ggsave("Frequency of Openness by participant w3a.jpeg", plot = scatterplot_openness_YPPCG, width = 7, height = 4, dpi = 300)


# Correcting for sample inequality on PCG and SCG:

library(dplyr)

# Filter the dataset to retain only observations with non-missing scores for both PCG and SCG
matched_data_AG <- Merged_Child_subset %>%
  filter(!is.na(Agreeable_W3_PCG) & !is.na(Agreeable_W3_SCG))
matched_data_EMO <- Merged_Child_subset %>%
  filter(!is.na(Emo_Stability_W3_PCG) & !is.na(Emo_Stability_W3_SCG))
matched_data_EX <- Merged_Child_subset %>%
  filter(!is.na(Extravert_W3_PCG) & !is.na(Extravert_W3_SCG))
matched_data_CON <- Merged_Child_subset %>%
  filter(!is.na(Conscientious_W3_PCG) & !is.na(Conscientious_W3_SCG))
matched_data_OP <- Merged_Child_subset %>%
  filter(!is.na(Openness_W3_PCG) & !is.na(Openness_W3_SCG))

# CONSCIENTIOUS TIPI scores, PCG and SCG on Child, Wave 3
# Conscientiousness scores for Primary Caregiver (PCG)
matched_pcg_conscientious <- data.frame(
  Conscientiousness = c(1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(13, 28, 54, 77, 137, 206, 410, 532, 508, 253, 371, 486, 869),
  Caregiver = "Matched PCG"
)

# Conscientiousness scores for Secondary Caregiver (SCG)
matched_scg_conscientious <- data.frame(
  Conscientiousness = c(1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(15, 32, 48, 73, 129, 172, 427, 526, 436, 299, 458, 528, 803),
  Caregiver = "Matched SCG"
)

# Combine PCG and SCG data
matched_combined_conscientious <- rbind(matched_pcg_conscientious, matched_scg_conscientious)

matched_scatterplot_conscientious_PCGSCG <- ggplot(matched_combined_conscientious, aes(x = Conscientiousness, y = Frequency, color = Caregiver)) +
  geom_point(size = 3) +
  labs(title = "Conscientiousness scores for PCG and SCG on YP, W3",
       x = "Conscientiousness Score", y = "Frequency") +
  scale_x_continuous(breaks = seq(1, 7, by = 0.5)) +
  scale_color_manual(values = nord_colors3) + 
  theme_minimal() +
  theme(legend.position = "bottom")

print(matched_scatterplot_conscientious_PCGSCG)


# OPENNESS TIPI scores, PCG and SCG on Child, Wave 3
# Openness scores for Primary Caregiver (PCG)
matched_pcg_openness <- data.frame(
  Openness = c(1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(6, 10, 30, 47, 66, 144, 360, 409, 466, 459, 611, 675, 659),
  Caregiver = "Matched PCG"
)

# Openness scores for Secondary Caregiver (SCG)
matched_scg_openness <- data.frame(
  Openness = c(1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(2, 8, 23, 30, 83, 148, 382, 360, 407, 541, 717, 650, 592),
  Caregiver = "Matched SCG"
)

# Combine PCG and SCG data
matched_combined_openness <- rbind(matched_pcg_openness, matched_scg_openness)

matched_scatterplot_openness_PCGSCG <- ggplot(matched_combined_openness, aes(x = Openness, y = Frequency, color = Caregiver)) +
  geom_point(size = 3) +
  labs(title = "Openness scores for PCG and SCG on YP, W3",
       x = "Openness Score", y = "Frequency") +
  scale_x_continuous(breaks = seq(1, 7, by = 0.5)) +
  scale_color_manual(values = nord_colors3) +  
  theme_minimal() +
  theme(legend.position = "bottom")

print(matched_scatterplot_openness_PCGSCG)


# AGREEABLE TIPI scores, PCG and SCG on Child, Wave 3

# Agreeable scores for Primary Caregiver (PCG)
matched_pcg_agreeable <- data.frame(
  Agreeable = c(1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(2, 6, 25, 24, 50, 129, 285, 374, 446, 302, 533, 731, 1040),
  Caregiver = "Matched PCG"
)

# Agreeable scores for Secondary Caregiver (SCG)
matched_scg_agreeable <- data.frame(
  Agreeable = c(1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(7, 4, 21, 39, 70, 124, 298, 449, 459, 398, 529, 677, 872),
  Caregiver = "Matched SCG"
)

# Combine PCG and SCG data
matched_combined_agreeable <- rbind(matched_pcg_agreeable, matched_scg_agreeable)

matched_scatterplot_agreeable_PCGSCG <- ggplot(matched_combined_agreeable, aes(x = Agreeable, y = Frequency, color = Caregiver)) +
  geom_point(size = 3) +
  labs(title = "Matched Agreeable scores for PCG and SCG on YP, W3",
       x = "Agreeable Score", y = "Frequency") +
  scale_x_continuous(breaks = seq(1, 7, by = 0.5)) +
  scale_color_manual(values = nord_colors3) +  
  theme_minimal() +
  theme(legend.position = "bottom")

print(matched_scatterplot_agreeable_PCGSCG)


# EMOTIONAL STABILITY TIPI scores, PCG and SCG on Child, Wave 3

# Emotional Stability scores for Primary Caregiver (PCG)
matched_pcg_emo_stability <- data.frame(
  Emo_Stability = c(1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(26, 34, 61, 69, 148, 140, 315, 487, 382, 326, 544, 613, 800),
  Caregiver = "Matched PCG"
)

# Emotional Stability scores for Secondary Caregiver (SCG)
matched_scg_emo_stability <- data.frame(
  Emo_Stability = c(1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(11, 33, 48, 64, 123, 167, 418, 492, 430, 338, 550, 594, 678),
  Caregiver = "Matched SCG"
)

# Combine PCG and SCG data
matched_combined_emo_stability <- rbind(matched_pcg_emo_stability, matched_scg_emo_stability)

matched_scatterplot_emo_stability_PCGSCG <- ggplot(matched_combined_emo_stability, aes(x = Emo_Stability, y = Frequency, color = Caregiver)) +
  geom_point(size = 3) +
  labs(title = "Emot. Stability scores for PCG and SCG on YP, W3",
       x = "Emotional Stability Score", y = "Frequency") +
  scale_x_continuous(breaks = seq(1, 7, by = 0.5)) +
  scale_color_manual(values = nord_colors3)
  theme_minimal() +
  theme(legend.position = "bottom")

print(matched_scatterplot_emo_stability_PCGSCG)

# EXTRAVERSION STABILITY TIPI scores, PCG and SCG on Child, Wave 3

# Extraversion scores for Primary Caregiver (PCG)
matched_pcg_extravert <- data.frame(
  Extraversion = c(1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(59, 61, 135, 166, 227, 316, 541, 540, 330, 280, 414, 404, 474),
  Caregiver = "Matched PCG"
)

# Extraversion scores for Secondary Caregiver (SCG)
matched_scg_extravert <- data.frame(
  Extraversion = c(1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7),
  Frequency = c(33, 59, 132, 186, 223, 326, 589, 546, 409, 298, 420, 363, 361),
  Caregiver = "Matched SCG"
)

# Combine PCG and SCG data
matched_combined_extravert <- rbind(matched_pcg_extravert, matched_scg_extravert)

matched_scatterplot_extravert_PCGSCG <- ggplot(matched_combined_extravert, aes(x = Extraversion, y = Frequency, color = Caregiver)) +
  geom_point(size = 3) +
  labs(title = "Extraversion scores for PCG and SCG on YP, W3",
       x = "Extraversion Score", y = "Frequency") +
  scale_x_continuous(breaks = seq(1, 7, by = 0.5)) +
  scale_color_manual(values = nord_colors3) + 
  theme_minimal() +
  theme(legend.position = "bottom")

print(matched_scatterplot_extravert_PCGSCG)

# Saving the scatterplots:

ggsave("Matched Agreeable by participant w3.jpeg", plot = matched_scatterplot_agreeable_PCGSCG, width = 7, height = 4, dpi = 300)
ggsave("Matched Conscientious by participant w3.jpeg", plot = matched_scatterplot_conscientious_PCGSCG, width = 7, height = 4, dpi = 300)
ggsave("Matched Emotional Stability by participant w3.jpeg", plot = matched_scatterplot_emo_stability_PCGSCG, width = 7, height = 4, dpi = 300)
ggsave("Matched Extravert by participant w3.jpeg", plot = matched_scatterplot_extravert_PCGSCG, width = 7, height = 4, dpi = 300)
ggsave("Matched Openness by participant w3.jpeg", plot = matched_scatterplot_openness_PCGSCG, width = 7, height = 4, dpi = 300)

# Side by side comparison + saving

library(gridExtra)
matched_comp_AG <- grid.arrange(scatterplot_agreeable_PCGSCG, matched_scatterplot_agreeable_PCGSCG,
                               nrow = 2, ncol = 1)

matched_comp_CON <- grid.arrange(scatterplot_conscientious_PCGSCG,matched_scatterplot_conscientious_PCGSCG,
                               nrow = 2, ncol = 1)

matched_comp_EMO <- grid.arrange(scatterplot_emotional_stability_PCGSCG, matched_scatterplot_emo_stability_PCGSCG,
                               nrow = 2, ncol = 1)

matched_comp_EX <-  grid.arrange(scatterplot_extravert_PCGSCG,matched_scatterplot_extravert_PCGSCG,
                                nrow = 2, ncol = 1)

matched_comp_OP <- grid.arrange(scatterplot_openness_PCGSCG,matched_scatterplot_openness_PCGSCG,
                               nrow=2, ncol=1)

ggsave("Matched comparison AG, w3.jpeg", plot= matched_comp_AG, width = 5.5, height = 5, dpi = 300)
ggsave("Matched comparison CON, w3.jpeg", plot = matched_comp_CON, width = 5.5, height = 5, dpi = 300)
ggsave("Matched comparison EMO, w3.jpeg", plot = matched_comp_EMO, width = 5.5, height = 5, dpi = 300)
ggsave("Matched comparison EX, w3.jpeg", plot= matched_comp_EX, width = 5.5, height = 5, dpi = 300)
ggsave("Matched comparison OP, w3.jpeg", plot= matched_comp_OP, width = 5.5, height = 5, dpi = 300)

# Testing for correlation between YP and PCG scores in wave 3:

COR_AG_YPPCG <- cor.test(Merged_Child_subset$Agreeable_W3_YP, Merged_Child_subset$Agreeable_W3_PCG, method=c("pearson"))
COR_CON_YPPCG <- cor.test(Merged_Child_subset$Conscientious_W3_YP, Merged_Child_subset$Conscientious_W3_PCG, method=c("pearson"))
COR_EMO_YPPCG <- cor.test(Merged_Child_subset$Emo_Stability_W3_YP, Merged_Child_subset$Emo_Stability_W3_PCG, method=c("pearson"))
COR_EX_YPPCG <- cor.test(Merged_Child_subset$Extravert_W3_YP, Merged_Child_subset$Extravert_W3_PCG, method=c("pearson"))
COR_OP_YPPCG <- cor.test(Merged_Child_subset$Openness_W3_YP, Merged_Child_subset$Openness_W3_PCG, method=c("pearson"))

AG_YPPCG <- c(COR_AG_YPPCG$estimate,COR_AG_YPPCG$p.value)
CON_YPPCG <- c(COR_CON_YPPCG$estimate,COR_CON_YPPCG$p.value)
EMO_YPPCG <- c(COR_EMO_YPPCG$estimate,COR_EMO_YPPCG$p.value)
EX_YPPCG <- c(COR_EX_YPPCG$estimate,COR_EX_YPPCG$p.value)
OP_YPPCG <- c(COR_OP_YPPCG$estimate,COR_OP_YPPCG$p.value)

correlation_YP_PCG <- rbind(AG_YPPCG,CON_YPPCG,EMO_YPPCG,EX_YPPCG,OP_YPPCG)
colnames(correlation_YP_PCG) <- c("Estimate", "P-value")
print(correlation_YP_PCG)

# Testing for correlation between PCG and PCG scores in waves 2 and 3:

COR_AG_PCG23 <- cor.test(Merged_Child_subset$Agreeable_W2_PCG, Merged_Child_subset$Agreeable_W3_PCG, method=c("pearson"))
COR_CON_PCG23 <- cor.test(Merged_Child_subset$Conscientious_W2_PCG, Merged_Child_subset$Conscientious_W3_PCG, method=c("pearson"))
COR_EMO_PCG23 <- cor.test(Merged_Child_subset$Emo_Stability_W2_PCG, Merged_Child_subset$Emo_Stability_W3_PCG, method=c("pearson"))
COR_EX_PCG23 <- cor.test(Merged_Child_subset$Extravert_W2_PCG, Merged_Child_subset$Extravert_W3_PCG, method=c("pearson"))
COR_OP_PCG23 <- cor.test(Merged_Child_subset$Openness_W2_PCG, Merged_Child_subset$Openness_W3_PCG, method=c("pearson"))

AG_PCG23 <- c(COR_AG_PCG23$estimate,COR_AG_PCG23$p.value)
CON_PCG23 <- c(COR_CON_PCG23$estimate,COR_CON_PCG23$p.value)
EMO_PCG23 <- c(COR_EMO_PCG23$estimate,COR_EMO_PCG23$p.value)
EX_PCG23 <- c(COR_EX_PCG23$estimate,COR_EX_PCG23$p.value)
OP_PCG23 <- c(COR_OP_PCG23$estimate,COR_OP_PCG23$p.value)

correlation_PCG23 <- rbind(AG_PCG23,CON_PCG23,EMO_PCG23,EX_PCG23,OP_PCG23)
colnames(correlation_PCG23) <- c("Estimate", "P-value")
print(correlation_PCG23)
print(correlation_YP_PCG)


# Testing for correlation between PCG and SCG on YP TIPI in wave 3:

library(stats)
COR_AG_PCGSCG <- cor.test(matched_data_AG$Agreeable_W3_PCG,matched_data_AG$Agreeable_W3_SCG, method=c("pearson"))
COR_CON_PCGSCG <- cor.test(matched_data_CON$Conscientious_W3_PCG,matched_data_CON$Conscientious_W3_SCG, method=c("pearson"))
COR_EMO_PCGSCG <- cor.test(matched_data_EMO$Emo_Stability_W3_PCG,matched_data_EMO$Emo_Stability_W3_SCG, method=c("pearson")) 
COR_EX_PCGSCG <- cor.test(matched_data_EX$Extravert_W3_PCG, matched_data_EX$Extravert_W3_SCG, method=c("pearson"))
COR_OP_PCGSCG <- cor.test(matched_data_OP$Openness_W3_PCG, matched_data_OP$Openness_W3_SCG, method=c("pearson"))

AG_PCGSCG <- c(COR_AG_PCGSCG$estimate,COR_AG_PCGSCG$p.value)
CON_PCGSCG <- c(COR_CON_PCGSCG$estimate,COR_CON_PCGSCG$p.value)
EMO_PCGSCG <- c(COR_EMO_PCGSCG$estimate,COR_EMO_PCGSCG$p.value)
EX_PCGSCG <- c(COR_EX_PCGSCG$estimate,COR_EX_PCGSCG$p.value)
OP_PCGSCG <- c(COR_OP_PCGSCG$estimate,COR_OP_PCGSCG$p.value)

correlation_PCGSCG <- rbind(AG_PCGSCG,CON_PCGSCG,EMO_PCGSCG,EX_PCGSCG,OP_PCGSCG)
colnames(correlation_PCGSCG) <- c("Estimate", "P-value")
print(correlation_PCGSCG)
print(correlation_PCG23)
print(correlation_YP_PCG)


#----------------------------------------------------------------------------------------------------
# Summary statistics for intergenerational education

vars <- c("pc3f1educ", "pc3j15", "pc3j5", "sc3e1educ", "sc3f15", "sc3f5")

edu_perc <- data.frame(Variable = character(), Education_Level = character(), Percentage = numeric(), stringsAsFactors = FALSE)

for (var in vars) {
  Merged_Child_3[[var]] <- as.numeric(as.character(Merged_Child_3[[var]]))
  edu_counts <- dplyr::count(Merged_Child_3, !!rlang::sym(var))
  total <- sum(edu_counts$n)
  edu_counts <- edu_counts[!grepl("Don't Know|Refusal", edu_counts[[var]]), ]
  edu_counts$Percentage <- round(edu_counts$n / total * 100, 2)
  edu_perc <- rbind(edu_perc, data.frame(Variable = rep(var, nrow(edu_counts)), 
                                         Education_Level = edu_counts[[var]], 
                                         Percentage = edu_counts$Percentage))
}

print(edu_perc)

# ---------------------------------------------------------------

# TIPI scores

# YOUNG PERSON WAVE 3

library(stargazer)

subset_data_TIPI <- na.omit(Merged_Child_subset[c("Agreeable_W3_YP", "Conscientious_W3_YP", 
                                                  "Emo_Stability_W3_YP", "Extravert_W3_YP",
                                                  "Openness_W3_YP")])
library(haven)

subset_data_TIPI_numeric <- as.data.frame(lapply(subset_data_TIPI, as.numeric))
stargazer(subset_data_TIPI_numeric, type = "latex")
stargazer(subset_data_TIPI, type="text")
subset_data_df_TIPI <- as.data.frame(subset_data_TIPI)
stargazer(subset_data_df_TIPI, type = "latex", ignore = "all")

# Tables by gender
library(stargazer)

subset_data_TIPI_with_gender <- Merged_Child_subset[c("Gender_MF", "Agreeable_W3_YP", "Conscientious_W3_YP", 
                                                      "Emo_Stability_W3_YP", "Extravert_W3_YP", "Openness_W3_YP")]
subset_data_TIPI_with_gender <- na.omit(subset_data_TIPI_with_gender)
table(subset_data_TIPI_with_gender$Gender_MF)
male_data <- subset_data_TIPI_with_gender[subset_data_TIPI_with_gender$Gender_MF == 1, ]
female_data <- subset_data_TIPI_with_gender[subset_data_TIPI_with_gender$Gender_MF == 2, ]
male_data_df <- as.data.frame(male_data)
female_data_df <- as.data.frame(female_data)
stargazer(male_data_df, type = "latex", title = "Summary statistics - TIPI scores YP, wave 3 (Males)")
stargazer(female_data_df, type = "latex", title = "Summary statistics - TIPI scores YP, wave 3 (Females)")

# CAREGIVERS WAVE 3

library(stargazer)

subset_data_PCG <- as.data.frame(Merged_Child_subset[c("Agreeable_W3_PCG", "Conscientious_W3_PCG", "Emo_Stability_W3_PCG", "Extravert_W3_PCG", "Openness_W3_PCG")])
subset_data_PCG <- na.omit(subset_data_PCG)
stargazer(subset_data_PCG, type = "latex", title = "Summary statistics - Personality scores by primary caregiver, wave 3")
subset_data_SCG <- as.data.frame(Merged_Child_subset[c("Agreeable_W3_SCG", "Conscientious_W3_SCG", "Emo_Stability_W3_SCG", "Extravert_W3_SCG", "Openness_W3_SCG")])
subset_data_SCG <- na.omit(subset_data_SCG)
stargazer(subset_data_SCG, type = "latex", title = "Summary statistics - Personality scores by secondary caregiver, wave 3")


# ---------------------------- 
# Summary for Grades

SUBSET_JCGRADES <- Merged_Child_subset[, c("Gender_MF", "English", "Maths", "Irish", "History", "French", 
                                           "Geography", "Science",
                                           "Spanish", "German", "Arts_Craft_Design", "Music", "Home_Econ", 
                                           "Metalwork", "Mater_Tech", "Technology", "Tech_Graphs", "Business", 
                                           "Religious_Ed", "CSPE")]
SUBSET_JCGRADES <- as.data.frame(SUBSET_JCGRADES)
male_data_grade <- SUBSET_JCGRADES[SUBSET_JCGRADES$Gender_MF == 1, ]
female_data_grade <- SUBSET_JCGRADES[SUBSET_JCGRADES$Gender_MF == 2, ]
stargazer(male_data_grade, type = "latex", title = "Summary statistics - Subject grades (Males)")
stargazer(female_data_grade, type = "latex", title = "Summary statistics - Subject grades (Females)")

#--------------------------------------

# School characteristics

p3q6_counts <- dplyr::count(Merged_Child_3, p3q6)
total_obs <- sum(p3q6_counts$n)
p3q6_counts$Percentage <- round((p3q6_counts$n / total_obs) * 100, 2)
print(p3q6_counts)

p3q7_counts <- dplyr::count(Merged_Child_3, p3q7)
total <- sum(p3q7_counts$n)
p3q7_counts$Percentage <- round(p3q7_counts$n / total * 100, 2)
print(p3q7_counts)

p3q29_counts <- dplyr::count(Merged_Child_3, p3q29)
total <- sum(p3q29_counts$n)
p3q29_counts$Percentage <- round(p3q29_counts$n / total * 100, 2)
print(p3q29_counts)

# ---------------------------------------------

# Parental involvement

stargazer(as.data.frame(Merged_Child_subset[c("Discussed_exams", "Discussed_friends", "Discussed_future", "Discussed_teachers",
                                              "Discussed_workload", "Discussed_subjects", "PCG_future_educ", "SCG_future_educ")]),flip = TRUE)

library(ggplot2)
library(tidyr)
discussed_all <- Merged_Child_subset %>%
  select(Discussed_exams, Discussed_subjects, Discussed_friends,
         Discussed_future, Discussed_teachers, Discussed_workload) %>%
  gather(variable, frequency) %>%
  mutate(variable = factor(variable,
                           levels = c("Discussed_exams", "Discussed_subjects", 
                                      "Discussed_friends", "Discussed_future", 
                                      "Discussed_teachers", "Discussed_workload"))) %>%
  filter(!is.na(frequency), frequency %in% 1:5) 
frequency_labels <- c("Never or hardly ever", "A few times a year", 
                      "About once a month", "Several times a month", 
                      "Several times a week")

discussed_topics_plot <- ggplot(discussed_all, aes(x = reorder(variable, -as.numeric(frequency)), fill = factor(frequency))) +
  geom_bar(width = 0.8, position = position_dodge(width = 0.8, preserve = "single")) + 
  labs(title = "Frequency of Discussion Topics between PGC and YP, wave 3",
       x ="Topics",
       y =  "Observations") +
  scale_fill_brewer(palette = "Pastel1", name = "Frequency",
                    labels = frequency_labels) +
  scale_x_discrete(labels = c(Discussed_exams = "Performance\non exams",
                              Discussed_subjects = "Subjects at\nschool/college",
                              Discussed_friends = "Getting on\nw/ friends",
                              Discussed_future = "Plans for\nthe future",
                              Discussed_teachers = "Getting on\nw/ teachers",
                              Discussed_workload = "Amount of\ncourse-work")) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 0, hjust = 0.5, vjust = 0.5, margin = margin(t = 0.5, r = 0, b = 0, l = 0)),
        legend.position = "bottom")


discussed_all <- Merged_Child_subset %>%
  select(Discussed_exams, Discussed_subjects, Discussed_friends,
         Discussed_future, Discussed_teachers, Discussed_workload) %>%
  gather(variable, frequency) %>%
  mutate(variable = factor(variable,
                           levels = c("Discussed_exams", "Discussed_subjects", 
                                      "Discussed_friends", "Discussed_future", 
                                      "Discussed_teachers", "Discussed_workload"))) %>%
  filter(!is.na(frequency), frequency %in% 1:5)  


frequency_labels <- c("Never or hardly ever", "A few times a year", 
                      "About once a month", "Several times a month", 
                      "Several times a week")

discussed_topics_plot <- ggplot(discussed_all, aes(x = reorder(variable, -as.numeric(frequency)), fill = factor(frequency))) +
  geom_bar(width = 0.8, position = position_dodge(width = 0.8, preserve = "single")) +
  labs(title = "Frequency of Discussion Topics between PGC and YP, wave 3",
       x ="Topics",
       y =  "Observations") +
  scale_fill_brewer(palette = "Pastel1", name = "Frequency",
                    labels = frequency_labels) +
  scale_x_discrete(labels = c(Discussed_exams = "Performance\non exams",
                              Discussed_subjects = "Subjects at\nschool/college",
                              Discussed_friends = "Getting on\nw/ friends",
                              Discussed_future = "Plans for\nthe future",
                              Discussed_teachers = "Getting on\nw/ teachers",
                              Discussed_workload = "Amount of\ncourse-work"),
                   limits = c("Discussed_exams", "Discussed_subjects", 
                              "Discussed_friends", "Discussed_future", 
                              "Discussed_teachers", "Discussed_workload")) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 0, hjust = 0.5, vjust = 0.5, margin = margin(t = 0.5, r = 0, b = 0, l = 0)),
        legend.position = "bottom")

ggsave("discussed_topics_plot.jpeg", plot = last_plot(), width = 10, height = 6, dpi = 300)


#---------------------------------------
# Calculate mean and standard deviation for each variable
library(stargazer)
means <- sapply(variables, function(var) mean(Merged_Child_subset[[var]], na.rm = TRUE))
std_devs <- sapply(variables, function(var) sd(Merged_Child_subset[[var]], na.rm = TRUE))
plot_data <- data.frame(Variables = variables, Mean = means, SD = std_devs)
library(ggplot2)

plot_data$Variables <- factor(plot_data$Variables,
                              levels = c("Discussed_exams", "Discussed_subjects", 
                                         "Discussed_friends", "Discussed_future", 
                                         "Discussed_teachers", "Discussed_workload"))

mean_plot_discussion <- ggplot(plot_data, aes(x = Variables, y = Mean)) +
  geom_point(size = 3, color = "black") +
  geom_errorbar(aes(ymin = Mean - SD, ymax = Mean + SD), width = 0.2, color = "black", size = 0.7) +
  labs(title = "Mean and Standard Deviation for Discussion topics",
       x = "Discussion topics", y = "Mean") +
  scale_x_discrete(labels = c(Discussed_exams = "Performance\non exams",
                              Discussed_subjects = "Subjects at\nschool/college",
                              Discussed_friends = "Getting on\nw/ friends",
                              Discussed_future = "Plans for\nthe future",
                              Discussed_teachers = "Getting on\nw/ teachers",
                              Discussed_workload = "Amount of\ncourse-work")) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 0, hjust = 0.5, vjust = 0.5, margin = margin(t = 0.5, r = 0, b = 0, l = 0)),
        legend.position = "bottom") +
  ylim(0, max(plot_data$Mean + plot_data$SD) * 1.1)

ggsave("mean_plot_discussion.jpeg", plot = last_plot(), width = 10, height = 6, dpi = 300)

library(gridExtra)
discussion_plots <- grid.arrange(discussed_topics_plot,mean_plot_discussion,
                                 nrow = 2, ncol = 1)

# Create a new variable Parental_Invol_school
Merged_Child_subset$Parental_Invol_school <- rowSums(Merged_Child_subset[c("Discussed_exams", "Discussed_subjects", "Discussed_teachers", "Discussed_workload")], na.rm = TRUE)

SUBSET_PARENTAL_df <- as.data.frame(SUBSET_PARENTAL)
stargazer(SUBSET_PARENTAL_df, type = "text")
observations <- c("Junior Certificate/Leaving Certificate or equivalent" = 112,
                  "An apprenticeship or trade" = 189,
                  "Diploma/Certificate" = 386,
                  "Degree" = 2702,
                  "Postgraduate/Higher degree" = 2340)
total_observations <- sum(observations)
total_with_unknowns <- total_observations + 310
percentages <- (observations / total_with_unknowns) * 100
print(percentages)

male_data <- subset(Merged_Child_subset, Gender == 1)
female_data <- subset(Merged_Child_subset, Gender == 0)
summary_male_TIPI <- summary(male_data[, c("Agreeable_W3_YP", "Conscientious_W3_YP", "Emo_Stability_W3_YP", "Extravert_W3_YP", "Openness_W3_YP")])
summary_female_TIPI <- summary(female_data[, c("Agreeable_W3_YP", "Conscientious_W3_YP", "Emo_Stability_W3_YP", "Extravert_W3_YP", "Openness_W3_YP")])

print("Summary statistics for males:")
print(summary_male_TIPI)
print("Summary statistics for females:")
print(summary_female_TIPI)

male_data_PCG <- subset(Merged_Child_subset, Gender == 1)
female_data_PCG <- subset(Merged_Child_subset, Gender == 0)
summary_male_TIPI_PCG <- summary(male_data_PCG[, c("Agreeable_W3_PCG", "Conscientious_W3_PCG", "Emo_Stability_W3_PCG", "Extravert_W3_PCG", "Openness_W3_PCG")])
summary_female_TIPI_PCG <- summary(female_data_PCG[, c("Agreeable_W3_PCG", "Conscientious_W3_PCG", "Emo_Stability_W3_PCG", "Extravert_W3_PCG", "Openness_W3_PCG")])

print("Summary statistics for males:")
print(summary_male_TIPI_PCG)
print("Summary statistics for females:")
print(summary_female_TIPI_PCG)

male_data_SCG <- subset(Merged_Child_subset, Gender == 1)
female_data_SCG <- subset(Merged_Child_subset, Gender == 0)

summary_male_TIPI_SCG <- summary(male_data_SCG[, c("Agreeable_W3_SCG", "Conscientious_W3_SCG", "Emo_Stability_W3_SCG", "Extravert_W3_SCG", "Openness_W3_SCG")])
summary_female_TIPI_SCG <- summary(female_data_SCG[, c("Agreeable_W3_SCG", "Conscientious_W3_SCG", "Emo_Stability_W3_SCG", "Extravert_W3_SCG", "Openness_W3_SCG")])

print("Summary statistics for males:")
print(summary_male_TIPI_SCG)
print("Summary statistics for females:")
print(summary_female_TIPI_SCG)

# ---------------------------------------
# Regressions


# Total subject grade:

JC_subjects <- c("English", "History", "Maths", "Irish", "Science", "Geography")
complete_cases <- complete.cases(Merged_Child_subset[, JC_subjects])
Merged_Child_subset$Total_grade <- NA
Merged_Child_subset$Total_grade[complete_cases] <- rowSums(Merged_Child_subset[complete_cases, JC_subjects], na.rm = TRUE)

# Non-fee/Fee-paying/Community binaries

Merged_Child_subset$Fee_paying <- ifelse(Merged_Child_subset$School_Type == 1, 1, 0)
Merged_Child_subset$Non_Fee_paying <- ifelse(Merged_Child_subset$School_Type == 2, 1, 0)
# -------------------------------
# Regressions: 
#----------------------------------

Reg_History <- lm(History ~ Agreeable_W3_YP + Conscientious_W3_YP + Emo_Stability_W3_YP + 
                    Extravert_W3_YP + Openness_W3_YP, data=Merged_Child_subset)
summary(Reg_History)

Reg_English <- lm(English ~ Agreeable_W3_YP + Conscientious_W3_YP + Emo_Stability_W3_YP + 
                    Extravert_W3_YP + Openness_W3_YP, data=Merged_Child_subset)
summary(Reg_English)

Reg_Maths <- lm(Maths ~ Agreeable_W3_YP + Conscientious_W3_YP + Emo_Stability_W3_YP + 
                    Extravert_W3_YP + Openness_W3_YP, data=Merged_Child_subset)
summary(Reg_Maths)

Reg_Irish <- lm(Irish ~ Agreeable_W3_YP + Conscientious_W3_YP + Emo_Stability_W3_YP + 
                    Extravert_W3_YP + Openness_W3_YP, data=Merged_Child_subset)
summary(Reg_Irish)

Reg_Science <- lm(Science ~ Agreeable_W3_YP + Conscientious_W3_YP + Emo_Stability_W3_YP + 
                    Extravert_W3_YP + Openness_W3_YP, data=Merged_Child_subset)
summary(Reg_Science)

Reg_Geography <- lm(Geography ~ Agreeable_W3_YP + Conscientious_W3_YP + Emo_Stability_W3_YP + 
                    Extravert_W3_YP + Openness_W3_YP, data=Merged_Child_subset)
summary(Reg_Geography)



Reg_History_Male <- lm(History ~ Agreeable_W3_YP + Conscientious_W3_YP + Emo_Stability_W3_YP + 
                    Extravert_W3_YP + Openness_W3_YP + Gender, data=Merged_Child_subset)
summary(Reg_History_Male)

Reg_English_Male <- lm(English ~ Agreeable_W3_YP + Conscientious_W3_YP + Emo_Stability_W3_YP + 
                    Extravert_W3_YP + Openness_W3_YP + Gender, data=Merged_Child_subset)
summary(Reg_English_Male)

Reg_Maths_Male <- lm(Maths ~ Agreeable_W3_YP + Conscientious_W3_YP + Emo_Stability_W3_YP + 
                  Extravert_W3_YP + Openness_W3_YP + Gender, data=Merged_Child_subset)
summary(Reg_Maths_Male)

Reg_Irish_Male <- lm(Irish ~ Agreeable_W3_YP + Conscientious_W3_YP + Emo_Stability_W3_YP + 
                  Extravert_W3_YP + Openness_W3_YP + Gender, data=Merged_Child_subset)
summary(Reg_Irish_Male)

Reg_Science_Male <- lm(Science ~ Agreeable_W3_YP + Conscientious_W3_YP + Emo_Stability_W3_YP + 
                    Extravert_W3_YP + Openness_W3_YP + Gender, data=Merged_Child_subset)
summary(Reg_Science_Male)

Reg_Geography_Male <- lm(Geography ~ Agreeable_W3_YP + Conscientious_W3_YP + Emo_Stability_W3_YP + 
                      Extravert_W3_YP + Openness_W3_YP + Gender, data=Merged_Child_subset)
summary(Reg_Geography_Male)


stargazer(Reg_English,Reg_English_Male,Reg_Irish, Reg_Irish_Male, type = "latex",
          single.row =FALSE,
          no.space = TRUE,
          column.sep.width = "1pt", 
          font.size = "small")

stargazer(Reg_History,Reg_History_Male,Reg_Maths,Reg_Maths_Male, type = "latex",
          single.row =FALSE,
          no.space = TRUE,
          column.sep.width = "1pt", 
          font.size = "small")

stargazer(Reg_Geography,Reg_Geography_Male,Reg_Science,Reg_Science_Male, type = "latex",
          single.row =FALSE,
          no.space = TRUE,
          column.sep.width = "1pt", 
          font.size = "small")

# ---------------------------------------


Reg_TIPIYP_Totalgrade <- lm(Total_grade ~ Agreeable_W3_YP + Conscientious_W3_YP + Emo_Stability_W3_YP+
                          Extravert_W3_YP + Openness_W3_YP, data = Merged_Child_subset)
summary(Reg_TIPIYP_Totalgrade, type="text")

Reg_TIPIYP_Totalgrade_male <- lm(Total_grade ~ Agreeable_W3_YP + Conscientious_W3_YP + Emo_Stability_W3_YP+
                              Extravert_W3_YP + Openness_W3_YP + Gender, data = Merged_Child_subset)
summary(Reg_TIPIYP_Totalgrade_male, type="text")

stargazer(Reg_TIPIYP_Totalgrade,Reg_TIPIYP_Totalgrade_male, type = "latex",
          single.row =FALSE,
          no.space = TRUE,
          column.sep.width = "1pt", 
          font.size = "small")
#------------------------------

Reg_TIPIPCGW3_Totalgrade <- lm(Total_grade ~ Agreeable_W3_PCG + Conscientious_W3_PCG + Emo_Stability_W3_PCG+
                              Extravert_W3_PCG + Openness_W3_PCG, data = Merged_Child_subset)
summary(Reg_TIPIPCG_Totalgrade, type="text")

Reg_TIPIPCGW2_Totalgrade <- lm(Total_grade ~ Agreeable_W2_PCG + Conscientious_W2_PCG + Emo_Stability_W2_PCG+
                                 Extravert_W2_PCG + Openness_W2_PCG, data = Merged_Child_subset)
summary(Reg_TIPIPCGW2_Totalgrade, type="text")

stargazer(Reg_TIPIPCGW2_Totalgrade,Reg_TIPIPCGW3_Totalgrade, type = "latex",
          single.row =FALSE,
          no.space = TRUE,
          column.sep.width = "1pt", 
          font.size = "small")
# -------------------------------

Reg_TIPISCGW3_Totalgrade <- lm(Total_grade ~ Agreeable_W3_SCG + Conscientious_W3_SCG + Emo_Stability_W3_SCG+
                                 Extravert_W3_SCG + Openness_W3_SCG, data = Merged_Child_subset)
summary(Reg_TIPISCGW3_Totalgrade, type="text")

Reg_TIPI_PCGSCGW3_Totalgrade <- lm(Total_grade ~ Agreeable_W3_SCG + Conscientious_W3_SCG + Emo_Stability_W3_SCG+
                                 Extravert_W3_SCG + Openness_W3_SCG +
                                   Agreeable_W3_PCG + Conscientious_W3_PCG + Emo_Stability_W3_PCG+
                                   Extravert_W3_PCG + Openness_W3_PCG, data = Merged_Child_subset)
summary(Reg_TIPI_PCGSCGW3_Totalgrade, type="text")

stargazer(Reg_TIPISCGW3_Totalgrade,Reg_TIPI_PCGSCGW3_Totalgrade, type = "latex",
          single.row =FALSE,
          no.space = TRUE,
          column.sep.width = "1pt", 
          font.size = "small")
stargazer(Reg_TIPI_PCGSCGW3_Totalgrade, type = "latex",
          single.row =FALSE,
          no.space = TRUE,
          column.sep.width = "1pt", 
          font.size = "small")


#----------------------------------

Reg_PCG_edu <- lm(Total_grade ~ PCG_Educ, data = Merged_Child_subset)
summary(Reg_PCG_edu)
Reg_SCG_edu <- lm(Total_grade ~ SCG_Educ, data = Merged_Child_subset)
summary(Reg_SCG_edu)
Reg_PCGSCG_edu <- lm(Total_grade ~ PCG_Educ + SCG_Educ, data = Merged_Child_subset)
summary(Reg_PCGSCG_edu)
Reg_All_educ <- lm(Total_grade ~ PCG_Educ + SCG_Educ + PCG_father_educ+
                     PCG_mother_educ + SCG_father_educ+
                     SCG_mother_educ, data = Merged_Child_subset)
summary(Reg_All_educ)

stargazer(Reg_PCG_edu,Reg_SCG_edu, type = "latex",
          single.row =FALSE,
          no.space = TRUE,
          column.sep.width = "1pt", 
          font.size = "small")

stargazer(Reg_PCGSCG_edu,Reg_All_educ, type = "latex",
single.row =FALSE,
no.space = TRUE,
column.sep.width = "1pt", 
font.size = "small")


#----------------------------------
Reg_Totalgrade_DEIS <- lm(Total_grade ~ DEIS_binary, data = Merged_Child_subset)
summary(Reg_Totalgrade_DEIS)
Reg_PCGSCG_edu_DEIS <- lm(Total_grade ~ DEIS_binary +PCG_Educ + SCG_Educ, data = Merged_Child_subset)
summary(Reg_PCGSCG_edu_DEIS)

stargazer(Reg_Totalgrade_DEIS,Reg_PCGSCG_edu_DEIS, type = "latex",
          single.row =FALSE,
          no.space = TRUE,
          column.sep.width = "1pt", 
          font.size = "small")

#----------------------
Reg_Totalgrade_Fee <- lm(Total_grade ~ Fee_paying, data=Merged_Child_subset)
summary(Reg_Totalgrade_Fee)
Reg_Totalgrade_Fee_PCSCG <- lm(Total_grade ~ Fee_paying + PCG_Educ + SCG_Educ, data=Merged_Child_subset)
summary(Reg_Totalgrade_Fee_PCSCG)

Reg_Totalgrade_Non_Fee <- lm(Total_grade ~ Non_Fee_paying, data=Merged_Child_subset)
summary(Reg_Totalgrade_Non_Fee)
Reg_Totalgrade_Non_Fee_PCSCG <- lm(Total_grade ~ Non_Fee_paying + PCG_Educ + SCG_Educ, data=Merged_Child_subset)
summary(Reg_Totalgrade_Non_Fee_PCSCG)

stargazer(Reg_Totalgrade_Fee,Reg_Totalgrade_Fee_PCSCG, type = "latex",
          single.row =FALSE,
          no.space = TRUE,
          column.sep.width = "1pt", 
          font.size = "small")

stargazer(Reg_Totalgrade_Non_Fee,Reg_Totalgrade_Non_Fee_PCSCG, type = "latex",
          single.row =FALSE,
          no.space = TRUE,
          column.sep.width = "1pt", 
          font.size = "small")

Reg_Totalgrade_Grinds <- lm(Total_grade ~ Grinds, data=Merged_Child_subset)
summary(Reg_Totalgrade_Grinds)

#--------------------------

stargazer(Reg_TIPIPCGW2_Totalgrade, Reg_TIPIPCGW3_Totalgrade, Reg_TIPISCGW3_Totalgrade, type = "latex",
          single.row =FALSE,
          no.space = TRUE,
          column.sep.width = "1pt", 
          font.size = "small") 

stargazer(Reg_PI_Totalgrade, type = "text",
          single.row =FALSE,
          no.space = TRUE,
          column.sep.width = "1pt", 
          font.size = "small")
# --------------------------------------

# Parental involvement

Reg_Totalgrade_PI_YP <- lm(Total_grade ~ Discussed_exams_YP + Discussed_friends_YP + Discussed_future_YP +
                             Discussed_teachers_YP + Discussed_workload_YP + Discussed_subjects_YP, data=Merged_Child_subset)
summary(Reg_Totalgrade_PI_YP)

Reg_Totalgrade_PI_PCG <- lm(Total_grade ~ Discussed_exams_PCG + Discussed_friends_PCG + Discussed_future_PCG +
                              Discussed_teachers_PCG + Discussed_workload_PCG + Discussed_subjects_PCG, data=Merged_Child_subset)
summary(Reg_Totalgrade_PI_YP)  

stargazer(Reg_Totalgrade_PI_YP,Reg_Totalgrade_PI_PCG, type = "latex",
          single.row =FALSE,
          no.space = TRUE,
          column.sep.width = "1pt", 
          font.size = "small") 

# Calculating correlations

COR_PI_PCGYP_subjects <- cor.test(Merged_Child_subset$Discussed_subjects_PCG, Merged_Child_subset$Discussed_subjects_YP, method=c("pearson"))
COR_PI_PCGYP_exams <- cor.test(Merged_Child_subset$Discussed_exams_PCG, Merged_Child_subset$Discussed_exams_YP, method=c("pearson"))
COR_PI_PCGYP_friends <- cor.test(Merged_Child_subset$Discussed_friends_PCG, Merged_Child_subset$Discussed_friends_YP, method=c("pearson"))
COR_PI_PCGYP_future <- cor.test(Merged_Child_subset$Discussed_future_PCG, Merged_Child_subset$Discussed_future_YP, method=c("pearson"))
COR_PI_PCGYP_teachers <- cor.test(Merged_Child_subset$Discussed_teachers_PCG, Merged_Child_subset$Discussed_teachers_YP, method=c("pearson"))
COR_PI_PCGYP_workload <- cor.test(Merged_Child_subset$Discussed_workload_PCG, Merged_Child_subset$Discussed_workload_YP, method=c("pearson"))

Subjects_cor <- c(COR_PI_PCGYP_subjects$estimate,COR_PI_PCGYP_subjects$p.value)
Exams_cor <- c(COR_PI_PCGYP_exams$estimate,COR_PI_PCGYP_exams$p.value)
Friends_cor <- c(COR_PI_PCGYP_friends$estimate,COR_PI_PCGYP_friends$p.value)
Future_cor <- c(COR_PI_PCGYP_future$estimate,COR_PI_PCGYP_future$p.value)
Teachers_cor <- c(COR_PI_PCGYP_teachers$estimate,COR_PI_PCGYP_teachers$p.value)
Workload_cor <- c(COR_PI_PCGYP_workload$estimate,COR_PI_PCGYP_workload$p.value)

correlation_YP_PCG_PI <- rbind(Subjects_cor,Exams_cor,Friends_cor,Future_cor,Teachers_cor,Workload_cor)
colnames(correlation_YP_PCG_PI) <- c("Estimate", "P-value")
print(correlation_YP_PCG_PI)

# Plotting and getting summary stats

selected_columns_PI <- Merged_Child_subset[, c("Discussed_exams_YP", "Discussed_friends_YP", "Discussed_future_YP", "Discussed_teachers_YP", "Discussed_workload_YP", "Discussed_subjects_YP")]
missing_values_PI <- apply(selected_columns_PI, 2, function(x) any(is.na(x)))
print(names(missing_values_PI)[missing_values_PI])
selected_columns_df_PI <- as.data.frame(selected_columns_PI)
stargazer(selected_columns_df_PI)

selected_columns_PI_PCG <- Merged_Child_subset[, c("Discussed_exams_PCG", "Discussed_friends_PCG", "Discussed_future_PCG", "Discussed_teachers_PCG", "Discussed_workload_PCG", "Discussed_subjects_PCG")]
missing_values_PI_PCG <- apply(selected_columns_PI_PCG, 2, function(x) any(is.na(x)))
print(names(missing_values_PI_PCG)[missing_values_PI_PCG])
selected_columns_df_PI_PCG <- as.data.frame(selected_columns_PI_PCG)
stargazer(selected_columns_df_PI_PCG)

YP_means <- c(3.939, 3.502, 3.761, 3.484, 3.856, 4.077)
PCG_means <- c(3.884, 3.564, 3.843, 3.762, 4.110, 4.237)
differences <- YP_means - PCG_means
cat("\\begin{table}[!htbp] \\centering \n")
cat("  \\caption{Differences in Means between YP and PCG} \n")
cat("  \\label{diff_means} \n")
cat("  \\begin{tabular}{@{\\extracolsep{5pt}}lcc} \n")
cat("  \\hline \\hline \n")
cat("  Measure & YP Mean & PCG Mean \\\\ \n")
cat("  \\hline \n")
for (i in 1:length(differences)) {
  cat("  Row ", i, " & ", YP_means[i], " & ", PCG_means[i], " & ", differences[i], " \\\\ \n", sep = "")
}
cat("  \\hline \\hline \n")
cat("  \\end{tabular} \n")
cat("\\end{table}")

library(ggplot2)
library(tidyr)

discussed_all_YP <- Merged_Child_subset %>%
  select(Discussed_exams_YP, Discussed_subjects_YP, Discussed_friends_YP,
         Discussed_future_YP, Discussed_teachers_YP, Discussed_workload_YP) %>%
  gather(variable, frequency) %>%
  mutate(variable = factor(variable,
                           levels = c("Discussed_exams_YP", "Discussed_subjects_YP", 
                                      "Discussed_friends_YP", "Discussed_future_YP",
                                      "Discussed_teachers_YP","Discussed_workload_YP"))) %>%
  filter(!is.na(frequency), frequency %in% 1:5) 
frequency_labels_YP <- c("Never or hardly ever", "A few times a year", 
                         "About once a month", "Several times a month", 
                         "Several times a week")

discussed_topics_plot_YP <- ggplot(discussed_all_YP, aes(x = reorder(variable, -as.numeric(frequency)), fill = factor(frequency))) +
  geom_bar(width = 0.8, position = position_dodge(width = 0.8, preserve = "single")) + 
  labs(title = "Frequency of Discussion Topics between PGC and YP, according to YP, wave 3",
       x ="Topics",
       y =  "Observations") +
  scale_fill_brewer(palette = "Pastel1", name = "Frequency",
                    labels = frequency_labels) +
  scale_x_discrete(labels = c(Discussed_exams_YP = "Performance\non exams",
                              Discussed_subjects_YP = "Subjects at\nschool/college",
                              Discussed_friends_YP = "Getting on\nw/ friends",
                              Discussed_future_YP = "Plans for\nthe future",
                              Discussed_teachers_YP = "Getting on\nw/ teachers",
                              Discussed_workload_YP = "Amount of\ncourse-work"),
                   limits = c("Discussed_exams_YP", "Discussed_subjects_YP", 
                              "Discussed_friends_YP", "Discussed_future_YP", 
                              "Discussed_teachers_YP", "Discussed_workload_YP")) + 
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 0, hjust = 0.5, vjust = 0.5, margin = margin(t = 0.5, r = 0, b = 0, l = 0)),
        legend.position = "bottom")
plot(discussed_topics_plot_YP)
ggsave("discussed_topics_plot_YP.jpeg", plot = discussed_topics_plot_YP,width = 10, height = 6, dpi = 300)

# -------------------------------------


# -----------------------------
# Piers-Harris: waves 1 and 2
# Wave 1/Wave 2

# Behaviour: PH_Behaviour/w2ph_behaviour
# Intellectual and school: PH_Intellectual/w2ph_intellectual 
# Physical Appearance: PH_Physical/w2ph_physical
# Freedom from anxiety: PH_Free_Anxiety/w2ph_free_anxiety
# Popularity: PH_Popularity:w2ph_popularity
# Happiness and satisfaction: PH_Happiness/w2ph_happiness 

# Rosenberg Self-Steem scale: wave 3

# Wave 1, teacher questionnaire
# Questions
# TC10a Academic performance - reading
# TC10b Academic performance - writing
# TC10c Academic performance - comprehension
# TC10d Academic performance - mathematics
# TC10e Academic performance - imagination/creativity
# TC10f Academic performance - oral communications
# TC10g Academic performance - problem solving
# Scores: 1 (below average), 2 (average) and 3 (above average): (some 9 for don't know)

# New dataset 

library(dplyr)
Merged_Child_subset <- left_join(Merged_Child_subset, Merged_Child_3[, c("ID", "TC10a", "TC10b", "TC10c", "TC10d", "TC10e", "TC10f", "TC10g",
                                                                         "PH_Behaviour", "PH_Intellectual", "PH_Physical", "PH_Free_Anxiety", 
                                                                         "PH_Popularity", "PH_Happiness", "w2ph_behaviour", "w2ph_intellectual", 
                                                                         "w2ph_physical", "w2ph_free_anxiety", "w2ph_popularity", "w2ph_happiness")],
                                 by = "ID")

SUBSET_Teacher <- Merged_Child_subset[, c("TC_reading", "TC_writing", "TC_comprehension", "TC_maths",
                                          "TC_imagin_creat", "TC_oral_comm","TC_prob_solving")]











# Further variables to include

# I disliked being at school
dplyr::count(Merged_Child_3,cq3b26a)
# I think most my teachers were friendly 
dplyr::count(Merged_Child_3,cq3b26b)
# I could talk to my teachers if I had a problem
dplyr::count(Merged_Child_3,cq3b26c)

# Teacher involvement (from the perspective of YP)
# How often - you have been told that your work is good by a teacher
dplyr::count(Merged_Child_3,cq3b27a)
# How often - you have asked questions in class
dplyr::count(Merged_Child_3,cq3b27b)
# How often - a teacher has praised you for answering a question
dplyr::count(Merged_Child_3,cq3b27c)
# How often - you have been given out to by a teacher because your work is untidy or not done on time
dplyr::count(Merged_Child_3,cq3b27d)
# How often - you have been asked questions in class by the teacher
dplyr::count(Merged_Child_3,cq3b27e)
# How often - you have been given out to by a teacher for misbehaving in class
dplyr::count(Merged_Child_3,cq3b27f)
# How often - you have been praised by a teacher because your written work is well done
dplyr::count(Merged_Child_3,cq3b27g)

# How well would you say you do at tests or exams compared with other people your age
dplyr::count(Merged_Child_3,cq3b29)
# How well would you say you do at sports compared with other people your age
dplyr::count(Merged_Child_3,cq3b30)
# Agree or not - You consider yourself to be an adult
dplyr::count(Merged_Child_3,cq3g3a)
# Agree or not - You feel respected by others as an adult
dplyr::count(Merged_Child_3,cq3g3b)
# Agree or not - You feel that you have matured fully
dplyr::count(Merged_Child_3,cq3g3c)

# What do you think you are most likely to do when you leave school
dplyr::count(Merged_Child_3,cq3c3)
# Agree or not - I don't need to have a University/Institute of Technology degree to get the kind of job I want to do
dplyr::count(Merged_Child_3,cq3c13a)
# Agree or not - Most of my friends are planning to go to University/Institutes of Technology
dplyr::count(Merged_Child_3,cq3c13b)
# Agree or not - People like me don't go to University/Institutes of Technology
dplyr::count(Merged_Child_3,cq3c13c)
# In the past year took part in - Sports clubs/teams
dplyr::count(Merged_Child_3,cq3j1a)
# In the past year took part in - School/student councils
dplyr::count(Merged_Child_3,cq3j1b)
# In the past year took part in - Breakfast club or after school club
dplyr::count(Merged_Child_3,cq3j1c)
# In the past year took part in - Computer clubs/groups
dplyr::count(Merged_Child_3,cq3j1d)
# In the past year took part in - Art, drama, dance or music clubs/groups/rehearsals
dplyr::count(Merged_Child_3,cq3j1e)
# In the past year took part in - Religious groups or organisations
dplyr::count(Merged_Child_3,cq3j1f)
# In the past year took part in - Youth clubs where you can hang out with other people
dplyr::count(Merged_Child_3,cq3j1g)
# In the past year took part in - Games/hobbies clubs
dplyr::count(Merged_Child_3,cq3j1h)

# Do you belong to any religion
dplyr::count(Merged_Child_3,cq3k5a)
# Which religion do you belong to
dplyr::count(Merged_Child_3,cq3k5b)
# How often attend religious services
dplyr::count(Merged_Child_3,cq3k5c)
# In general, would you describe yourself as a spiritual person (even if you do not belong to a religion)
dplyr::count(Merged_Child_3,cq3k6)


#----------------------------



library(writexl)
write_xlsx(Merged_Child_subset, path = "C:/Users/bgiet/OneDrive/Documents/GitHub/ConflictingForces/ConflictingForces/Merged_Child_subset.xlsx")
write.csv(Merged_Child_subset, file = "C:/Users/bgiet/OneDrive/Documents/GitHub/ConflictingForces/ConflictingForces/Merged_Child_subset.csv", row.names = FALSE)
