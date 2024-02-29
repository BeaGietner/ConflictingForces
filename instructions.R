# Loading the Datasets

library(ggplot2)

library(haven)
GUI_Chi_1 <- read_dta("C:/Users/bgiet/OneDrive/Área de Trabalho/Paper 4 - GUI/0020-00 GUI_Child_Waves_1_2_3_4/0020-01 GUI Child Cohort Wave 1/0020-01 GUI Child Cohort Wave 1_Data/9 Year Cohort Data/Stata/GUI Data_9YearCohort.dta")
GUI_Chi_2 <- read_dta("C:/Users/bgiet/OneDrive/Área de Trabalho/Paper 4 - GUI/0020-00 GUI_Child_Waves_1_2_3_4/0020-02 GUI Child Cohort Wave 2/0020-02 GUI Child Cohort Wave 2_Data/13 year cohort data/Stata/GUI Data_ChildCohortWave2.dta")
GUI_Chi_3 <- read_dta("C:/Users/bgiet/OneDrive/Área de Trabalho/Paper 4 - GUI/0020-00 GUI_Child_Waves_1_2_3_4/0020-03 GUI Child Cohort Wave 3 revised/0020-03 GUI Child Cohort Wave 3_Data revised/Stata/0020-03_GUI_Data_ChildCohortWave3_V1.3.dta")
GUI_Chi_4 <- read_dta("C:/Users/bgiet/OneDrive/Área de Trabalho/Paper 4 - GUI/0020-00 GUI_Child_Waves_1_2_3_4/0020-04 GUI Child Cohort Wave 4/0020-04 GUI Child Cohort Wave 4_Data/STATA/0020-04_GUI_Data_ChildCohortWave4.dta") 
GUI_Inf_5 <- read_dta("C:/Users/bgiet/OneDrive/Área de Trabalho/Paper 4 - GUI/0019-05 GUI Infant Cohort Wave 5 revised/0019-05 GUI Infant Cihort Wave 5 revised/0019-05 GUI_Infant_Cohort_Wave 5_Data/STATA/0019-05_GUI_InfantCohort_Wave5_v1.2.dta")
GUI_Inf_6 <- read_dta("C:/Users/bgiet/OneDrive/Área de Trabalho/Paper 4 - GUI/0019-06 GUI Infant Cohort Wave 6/0019-06 GUI Infant Cohort Wave 6/0019-06 GUI Infant Cohort Wave 6_Data/STATA/0019-06_GUI_InfantCohort_Wave6.dta")

# Merging all 4 waves for the Child Cohort:

library(dplyr)
Merged_Child_1 <- inner_join(GUI_Chi_1, GUI_Chi_2, by = "ID")
Merged_Child_2 <- inner_join(GUI_Chi_3, GUI_Chi_4, by = "ID")
Merged_Child <- inner_join(Merged_Child_1, Merged_Child_2, by="ID")

#Merging the first 3 waves:
library(dplyr)
Merged_Child_1 <- inner_join(GUI_Chi_1, GUI_Chi_2, by = "ID")
Merged_Child_3 <- inner_join(Merged_Child_1, GUI_Chi_3, by = "ID")

# Merging 2 waves for the Infant Cohort:

library(dplyr)
Merged_Infant <- inner_join(GUI_Inf_5, GUI_Inf_6, by = "id")

# Creating a new dataset:

Merged_Child_subset <-Merged_Child_3[, c("ID", "TC2", "pc3f14", "sc3e14", "MML51", "MML49",
                                         "w3cq_extravert", "w3cq_agreeable", "w3cq_conscientious", "w3cq_emotstab", "w3cq_openness",
                                         "w2pcd3_extravert", "w2pcd3_agreeable", "w2pcd3_conscientious", "w2pcd3_emotstab", "w2pcd3_openness",
                                         "w3pc_extravert", "w3pc_agreeable", "w3pc_conscientious", "w3pc_emotstab", "w3pc_openness", 
                                         "w3sc_extravert", "w3sc_agreeable", "w3sc_conscientious", "w3sc_emotstab", "w3sc_openness", 
                                         "cq3b31b", "cq3b32b", "cq3b33b", "cq3b34b", "cq3b35b", "cq3b36b", "cq3b37b", "cq3b38b",
                                         "cq3b310b", "cq3b311b", "cq3b312b", "cq3b314b", "cq3b315b", "cq3b316b", "cq3b317b", "cq3b318b",
                                         "cq3b321b", "cq3b325b", "cq3b326b",
                                         "pc3c2a", "pc3c2b", "pc3c2c", "pc3c2d", "pc3c2e", "pc3c2f", "pc3c3", "sc3b1",
                                         "pc3f1educ", "sc3e1educ", "pc3j15", "pc3j5", "sc3f15", "sc3f5",
                                         "p3q6", "p3q7", "p3q29",
                                         "cq3b17a")]

# Some variables present Don't know and refusal, which are coded as 999, 99, 9, 8 and 7 in the dataset.

library(dplyr)
Merged_Child_subset <- Merged_Child_subset %>%
  mutate(across(.cols = everything(), ~na_if(., 9)))

Merged_Child_subset <- Merged_Child_subset %>%
  mutate(across(.cols = everything(), ~na_if(., 99)))

Merged_Child_subset <- Merged_Child_subset %>%
  mutate(across(.cols = everything(), ~na_if(., 999)))

Merged_Child_subset <- Merged_Child_subset %>%
  mutate(across(.cols = everything(), ~na_if(., 998)))

Merged_Child_subset <- Merged_Child_subset %>%
  mutate(across(.cols = everything(), ~na_if(., 8)))

# Now we can only mutate 7 in the specific columns (pc3c3 and sc3b1) otherwise it will mess with the 
# TIPI scores.

Merged_Child_subset <- Merged_Child_subset %>%
  mutate(
    pc3c3 = na_if(pc3c3, 7),
    sc3b1 = na_if(sc3b1, 7)
  )

# Telling R remove the labels, then factor -> numeric:
library(labelled)
remove_labels(Merged_Child_subset, user_na_to_na = TRUE)

# Converting factor vars to numeric:

Merged_Child_subset$TC2 <- as.numeric(Merged_Child_subset$TC2) 
Merged_Child_subset$p3q7 <- as.numeric(Merged_Child_subset$p3q7)
Merged_Child_subset$pc3f14 <- as.numeric(Merged_Child_subset$pc3f14)
Merged_Child_subset$sc3e14 <- as.numeric(Merged_Child_subset$sc3e14)
Merged_Child_subset$MML51 <- as.numeric(Merged_Child_subset$MML51)
Merged_Child_subset$MML49 <- as.numeric(Merged_Child_subset$MML49)
Merged_Child_subset$p3q29 <- as.numeric(Merged_Child_subset$p3q29)
Merged_Child_subset$pc3f1educ <- as.numeric(Merged_Child_subset$pc3f1educ)
Merged_Child_subset$sc3e1educ <- as.numeric(Merged_Child_subset$sc3e1educ)
Merged_Child_subset$pc3c2a <- as.numeric(Merged_Child_subset$pc3c2a)
Merged_Child_subset$pc3c2b <- as.numeric(Merged_Child_subset$pc3c2b)
Merged_Child_subset$pc3c2c <- as.numeric(Merged_Child_subset$pc3c2c)
Merged_Child_subset$pc3c2d <- as.numeric(Merged_Child_subset$pc3c2d)
Merged_Child_subset$pc3c2e <- as.numeric(Merged_Child_subset$pc3c2e)
Merged_Child_subset$pc3c2f <- as.numeric(Merged_Child_subset$pc3c2f)
Merged_Child_subset$pc3c3 <- as.numeric(Merged_Child_subset$pc3c3)
Merged_Child_subset$sc3b1 <- as.numeric(Merged_Child_subset$sc3b1)
Merged_Child_subset$p3q29 <- as.numeric(Merged_Child_subset$p3q29)
Merged_Child_subset$pc3j15 <- as.numeric(Merged_Child_subset$pc3j15)
Merged_Child_subset$pc3j5 <- as.numeric(Merged_Child_subset$pc3j5)
Merged_Child_subset$sc3f15 <- as.numeric(Merged_Child_subset$sc3f15)
Merged_Child_subset$sc3f5 <- as.numeric(Merged_Child_subset$sc3f5)
Merged_Child_subset$cq3b17a <- as.numeric(Merged_Child_subset$cq3b17a)

# Binary for gender, grinds, DEIS status,PCG/SCG/Study-child being born in Ireland (immigrant status), Study-Child Irish citizen:
Merged_Child_subset$TC2_binary <- ifelse(Merged_Child_subset$TC2 == 1, 1, 0) # creates new var for when male (=1, 0 is for female)
Merged_Child_subset$DEIS_binary <- ifelse(Merged_Child_subset$p3q7 == 1, 1, 0) # create new var for when DEIS (=1, 0 is for non-DEIS)
Merged_Child_subset$PCG_IRE <- ifelse(Merged_Child_subset$pc3f14 == 1, 1, 0) # create new war for when PCG born in Ireland (=1, 0 otherwise)
Merged_Child_subset$SCG_IRE <- ifelse(Merged_Child_subset$sc3e14 == 1, 1, 0) # create new war for when SCG born in Ireland (=1, 0 otherwise)
Merged_Child_subset$SCB_IRE <- ifelse(Merged_Child_subset$MML51 == 1, 1, 0) # create new war for when Study Child born in Ireland (=1, 0 otherwise)
Merged_Child_subset$SCC_IRE <- ifelse(Merged_Child_subset$MML49 == 1, 1, 0) # create new war for when Study Child is an Irish citizen (=1, 0 otherwise)
Merged_Child_subset$Grinds <- ifelse(Merged_Child_subset$cq3b17a == 1, 1, 0) # create new war for when Study Child is an Irish citizen (=1, 0 otherwise)

# Reversing the grade scales so that they go from lowest rade (D/E or lower) to highest (A):

# From 1 -> 4 we have
# Art, craft, design: cq3b310b (1->4, 4 = D or lower)
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

# From 1 -> 5 we have:
# Irish: cq3b31b (1->5, 5 = E or lower)
# English: cq3b32b (1->5, 5 = E or lower)
# Maths: cq3b33b (1->5, 5 = E or lower)
# History: cq3b34b (1->5, 5 = E or lower)
# Geography: cq3b35b (1->5, 5 = E or lower)
# Science: cq3b312b (1->5, 5 = E or lower)
# French: cq3b36b (1->5, 5 = E or lower)


library(dplyr)
Merged_Child_subset <- Merged_Child_subset %>% 
  mutate(cq3b31b = 6 - cq3b31b, cq3b32b = 6 - cq3b32b, cq3b33b = 6 - cq3b33b, cq3b34b = 6 - cq3b34b,
         cq3b35b = 6 - cq3b35b, cq3b312b = 6 - cq3b312b, cq3b36b = 6 - cq3b36b)

library(dplyr)
Merged_Child_subset <- Merged_Child_subset %>% 
  mutate(cq3b310b = 5 - cq3b310b, cq3b37b = 5 - cq3b37b, cq3b38b = 5 - cq3b38b, cq3b311b = 5 - cq3b311b,
         cq3b314b = 5 - cq3b314b, cq3b315b = 5 - cq3b315b, cq3b316b = 5 - cq3b316b,
         cq3b317b = 5 - cq3b317b, cq3b318b = 5 - cq3b318b, cq3b321b = 5 - cq3b321b, cq3b325b = 5 - cq3b325b,
         cq3b326b = 5 - cq3b326b)


# Changing the column names after changing vars from factors to numeric:

Merged_Child_subset$Gender_MF <- Merged_Child_subset$TC2
Merged_Child_subset$Gender <- Merged_Child_subset$TC2_binary
Merged_Child_subset$Extravert_W3_YP <- Merged_Child_subset$w3cq_extravert
Merged_Child_subset$Agreeable_W3_YP <- Merged_Child_subset$w3cq_agreeable
Merged_Child_subset$Conscientious_W3_YP <- Merged_Child_subset$w3cq_conscientious
Merged_Child_subset$Emo_Stability_W3_YP <- Merged_Child_subset$w3cq_emotstab
Merged_Child_subset$Openness_W3_YP <- Merged_Child_subset$w3cq_openness
Merged_Child_subset$Extravert_W2_PCG <- Merged_Child_subset$w2pcd3_extravert
Merged_Child_subset$Agreeable_W2_PCG <- Merged_Child_subset$w2pcd3_agreeable
Merged_Child_subset$Conscientious_W2_PCG <- Merged_Child_subset$w2pcd3_conscientious
Merged_Child_subset$Emo_Stability_W2_PCG <- Merged_Child_subset$w2pcd3_emotstab
Merged_Child_subset$Openness_W2_PCG <- Merged_Child_subset$w2pcd3_openness
Merged_Child_subset$Extravert_W3_PCG <- Merged_Child_subset$w3pc_extravert
Merged_Child_subset$Agreeable_W3_PCG <- Merged_Child_subset$w3pc_agreeable
Merged_Child_subset$Conscientious_W3_PCG <- Merged_Child_subset$w3pc_conscientious
Merged_Child_subset$Emo_Stability_W3_PCG <- Merged_Child_subset$w3pc_emotstab
Merged_Child_subset$Openness_W3_PCG <- Merged_Child_subset$w3pc_openness
Merged_Child_subset$Extravert_W3_SCG <- Merged_Child_subset$w3sc_extravert
Merged_Child_subset$Agreeable_W3_SCG <- Merged_Child_subset$w3sc_agreeable
Merged_Child_subset$Conscientious_W3_SCG <- Merged_Child_subset$w3sc_conscientious
Merged_Child_subset$Emo_Stability_W3_SCG <- Merged_Child_subset$w3sc_emotstab
Merged_Child_subset$Openness_W3_SCG <- Merged_Child_subset$w3sc_openness
Merged_Child_subset$PCG_Educ <- Merged_Child_subset$pc3f1educ
Merged_Child_subset$SCG_Educ <- Merged_Child_subset$sc3e1educ
Merged_Child_subset$Arts_Craft_Design <- Merged_Child_subset$cq3b310b
Merged_Child_subset$German <- Merged_Child_subset$cq3b37b
Merged_Child_subset$Spanish <- Merged_Child_subset$cq3b38b
Merged_Child_subset$Music <- Merged_Child_subset$cq3b311b
Merged_Child_subset$Home_Econ <- Merged_Child_subset$cq3b314b
Merged_Child_subset$Mater_Tech<- Merged_Child_subset$cq3b315b
Merged_Child_subset$Metalwork <- Merged_Child_subset$cq3b316b
Merged_Child_subset$Tech_Graphs <- Merged_Child_subset$cq3b317b
Merged_Child_subset$Business <- Merged_Child_subset$cq3b318b 
Merged_Child_subset$Technology<- Merged_Child_subset$cq3b321b
Merged_Child_subset$Religious_Ed <- Merged_Child_subset$cq3b325b
Merged_Child_subset$CSPE <- Merged_Child_subset$cq3b326b
Merged_Child_subset$Irish <- Merged_Child_subset$cq3b31b
Merged_Child_subset$English <- Merged_Child_subset$cq3b32b
Merged_Child_subset$Maths <- Merged_Child_subset$cq3b33b
Merged_Child_subset$History <- Merged_Child_subset$cq3b34b
Merged_Child_subset$Geography <- Merged_Child_subset$cq3b35b 
Merged_Child_subset$Science <- Merged_Child_subset$cq3b312b
Merged_Child_subset$French <- Merged_Child_subset$cq3b36b
Merged_Child_subset$School_Type <- Merged_Child_subset$p3q6
Merged_Child_subset$Progress_to_HEI <- Merged_Child_subset$p3q29
Merged_Child_subset$Discussed_subjects <- Merged_Child_subset$pc3c2a 
Merged_Child_subset$Discussed_workload <- Merged_Child_subset$pc3c2b
Merged_Child_subset$Discussed_teachers <- Merged_Child_subset$pc3c2c
Merged_Child_subset$Discussed_future <- Merged_Child_subset$pc3c2d
Merged_Child_subset$Discussed_friends <- Merged_Child_subset$pc3c2e
Merged_Child_subset$Discussed_exams <- Merged_Child_subset$pc3c2f
Merged_Child_subset$PCG_future_educ <- Merged_Child_subset$pc3c3
Merged_Child_subset$SCG_future_educ <- Merged_Child_subset$sc3b1
Merged_Child_subset$PCG_mother_educ <- Merged_Child_subset$pc3j15
Merged_Child_subset$PCG_father_educ <- Merged_Child_subset$pc3j5
Merged_Child_subset$SCG_mother_educ <- Merged_Child_subset$sc3f15
Merged_Child_subset$SCG_father_educ <- Merged_Child_subset$sc3f5
Merged_Child_subset$Grinds<- Merged_Child_subset$cq3b17a 

# Selecting a final dataset

Merged_Child_subset <- Merged_Child_subset[, c("ID", "Gender_MF", "Gender", "PCG_IRE", "SCG_IRE", "SCB_IRE", "SCC_IRE", # Demographics
                                               "PCG_Educ", "SCG_Educ", "PCG_father_educ", "PCG_mother_educ", "SCG_father_educ", "SCG_mother_educ", # Education
                                               "Agreeable_W3_YP", "Extravert_W3_YP", "Openness_W3_YP", "Emo_Stability_W3_YP", "Conscientious_W3_YP", # TIPI YC WAVE 3
                                               "Agreeable_W2_PCG", "Extravert_W2_PCG", "Openness_W2_PCG", "Emo_Stability_W2_PCG", "Conscientious_W2_PCG", # TIPI PCG WAVE 2
                                               "Agreeable_W3_PCG", "Extravert_W3_PCG", "Openness_W3_PCG", "Emo_Stability_W3_PCG", "Conscientious_W3_PCG", # TIPI PCG WAVE 3
                                               "Agreeable_W3_SCG", "Extravert_W3_SCG", "Openness_W3_SCG", "Emo_Stability_W3_SCG", "Conscientious_W3_SCG", # TIPI SCG WAVE 3
                                               "English", "Maths", "Irish", "History", "French", "Spanish", "German", "Arts_Craft_Design", "Music",
                                               "Home_Econ", "Metalwork", "Mater_Tech", "Technology", "Tech_Graphs", "Business", "Religious_Ed",
                                               "CSPE", "Science", "Geography", # JC grades
                                               "Discussed_exams", "Discussed_friends", "Discussed_future", "Discussed_teachers",
                                               "Discussed_workload", "Discussed_subjects", "PCG_future_educ", "SCG_future_educ", # Parental Involvement
                                               "DEIS_binary", "Progress_to_HEI", "School_Type",
                                               "Grinds")]

library(utils)
write.csv(Merged_Child_subset, "Merged_Child_subset.csv")
SUBSET_DEMO <- Merged_Child_subset[, c("Gender_MF", "Gender", "PCG_IRE", "SCG_IRE", "SCB_IRE", "SCC_IRE")]
SUBSET_EDUC <- Merged_Child_subset[, c("PCG_Educ", "SCG_Educ", "PCG_father_educ", "PCG_mother_educ", "SCG_father_educ", "SCG_mother_educ")]
SUBSET_TIPI_YPW3 <- Merged_Child_subset[, c("Agreeable_W3_YP", "Extravert_W3_YP", "Openness_W3_YP", "Emo_Stability_W3_YP", "Conscientious_W3_YP")]
SUBSET_TIPI_PCGW2 <- Merged_Child_subset[, c("Agreeable_W2_PCG", "Extravert_W2_PCG", "Openness_W2_PCG", "Emo_Stability_W2_PCG", "Conscientious_W2_PCG")]
SUBSET_TIPI_PCGW3 <- Merged_Child_subset[, c("Agreeable_W3_PCG", "Extravert_W3_PCG", "Openness_W3_PCG", "Emo_Stability_W3_PCG", "Conscientious_W3_PCG")]
SUBSET_TIPI_SCGW3 <- Merged_Child_subset[, c( "Agreeable_W3_SCG", "Extravert_W3_SCG", "Openness_W3_SCG", "Emo_Stability_W3_SCG", "Conscientious_W3_SCG")]
SUBSET_JCGRADES <- Merged_Child_subset[, c("English", "Maths", "Irish", "History", "French", "Spanish", "German", "Arts_Craft_Design", "Music",
                                           "Home_Econ", "Metalwork", "Mater_Tech", "Technology", "Tech_Graphs", "Business", "Religious_Ed",
                                           "CSPE", "Science", "Geography")]
SUBSET_PARENTAL <- Merged_Child_subset[, c("Discussed_exams", "Discussed_friends", "Discussed_future", "Discussed_teachers",
                                           "Discussed_workload", "Discussed_subjects", "PCG_future_educ", "SCG_future_educ")]
SUBSET_SCHOOL <- Merged_Child_subset[, c("DEIS_binary", "Progress_to_HEI", "School_Type")]

# New dataset

Merged_Child_subset <- left_join(Merged_Child_subset, Merged_Child_3[, c("ID", "TC10a", "TC10b", "TC10c", "TC10d", "TC10e", "TC10f", "TC10g",
                                                                         "PH_Behaviour", "PH_Intellectual", "PH_Physical", "PH_Free_Anxiety", 
                                                                         "PH_Popularity", "PH_Happiness", "w2ph_behaviour", "w2ph_intellectual", 
                                                                         "w2ph_physical", "w2ph_free_anxiety", "w2ph_popularity", "w2ph_happiness")],
                                 by = "ID")
Merged_Child_subset <- Merged_Child_subset %>%
  mutate(
    PH_beha_W1 = PH_Behaviour,
    PH_intell_W1 = PH_Intellectual,
    PH_phys_W1 = PH_Physical,
    PH_free_anx_W1 = PH_Free_Anxiety,
    PH_pop_W1 = PH_Popularity,
    PH_happi_W1 = PH_Happiness,
    PH_beha_W2 = w2ph_behaviour,
    PH_intell_W2 = w2ph_intellectual,
    PH_phys_W2 = w2ph_physical,
    PH_free_anx_W2 = w2ph_free_anxiety,
    PH_pop_W2 = w2ph_popularity,
    PH_happi_W2 = w2ph_happiness,
    TC_reading = TC10a,
    TC_writing = TC10b,
    TC_comprehension = TC10c,
    TC_maths = TC10d,
    TC_imagin_creat = TC10e,
    TC_oral_comm = TC10f,
    TC_prob_solving = TC10g
  ) %>%
  select(-PH_Behaviour, -PH_Intellectual, -PH_Physical, 
         -PH_Free_Anxiety, -PH_Popularity, -PH_Happiness, 
         -w2ph_behaviour, -w2ph_intellectual, -w2ph_physical, 
         -w2ph_free_anxiety, -w2ph_popularity, -w2ph_happiness,
         -TC10a, -TC10b, -TC10c, -TC10d, -TC10e, -TC10f, -TC10g)

Merged_Child_subset <- Merged_Child_subset %>%
  mutate_at(vars(TC_reading, TC_writing, TC_comprehension, 
                 TC_maths, TC_imagin_creat, TC_oral_comm, TC_prob_solving),
            ~ na_if(., 9))


Merged_Child_subset <- left_join(Merged_Child_subset, Merged_Child_3[, c("ID","cq3e1a","cq3e1b","cq3e1c","cq3e1d","cq3e1e","cq3e1f",
                                                                         "pc3c2a","pc3c2b","pc3c2c","pc3c2d","pc3c2e","pc3c2f")],
                                 by = "ID")

Merged_Child_subset$Discussed_subjects_PCG <- Merged_Child_subset$pc3c2a 
Merged_Child_subset$Discussed_workload_PCG <- Merged_Child_subset$pc3c2b
Merged_Child_subset$Discussed_teachers_PCG <- Merged_Child_subset$pc3c2c
Merged_Child_subset$Discussed_future_PCG <- Merged_Child_subset$pc3c2d
Merged_Child_subset$Discussed_friends_PCG <- Merged_Child_subset$pc3c2e
Merged_Child_subset$Discussed_exams_PCG <- Merged_Child_subset$pc3c2f

Merged_Child_subset$Discussed_subjects_YP <- Merged_Child_subset$cq3e1a
Merged_Child_subset$Discussed_workload_YP <- Merged_Child_subset$cq3e1b
Merged_Child_subset$Discussed_teachers_YP <- Merged_Child_subset$cq3e1c
Merged_Child_subset$Discussed_future_YP <- Merged_Child_subset$cq3e1d
Merged_Child_subset$Discussed_friends_YP <- Merged_Child_subset$cq3e1e
Merged_Child_subset$Discussed_exams_YP <- Merged_Child_subset$cq3e1f


Merged_Child_subset <- Merged_Child_subset %>%
  select(-pc3c2a, -pc3c2b, -pc3c2c, -pc3c2d, -pc3c2e, -pc3c2f, -cq3e1a, -cq3e1b, -cq3e1c, -cq3e1d, -cq3e1e, -cq3e1f
  )

variables_to_exclude <- c(
  "Discussed_subjects_PCG", "Discussed_workload_PCG", "Discussed_teachers_PCG",
  "Discussed_future_PCG", "Discussed_friends_PCG", "Discussed_exams_PCG",
  "Discussed_subjects_YP", "Discussed_workload_YP", "Discussed_teachers_YP",
  "Discussed_future_YP", "Discussed_friends_YP", "Discussed_exams_YP"
)

for (variable in variables_to_exclude) {
  Merged_Child_subset <- Merged_Child_subset[!(Merged_Child_subset[[variable]] %in% c(8, 9)), ]
}

# New dataset 

library(dplyr)
Merged_Child_subset <- left_join(Merged_Child_subset, Merged_Child_3[, c("ID", "TC10a", "TC10b", "TC10c", "TC10d", "TC10e", "TC10f", "TC10g",
                                                                         "PH_Behaviour", "PH_Intellectual", "PH_Physical", "PH_Free_Anxiety", 
                                                                         "PH_Popularity", "PH_Happiness", "w2ph_behaviour", "w2ph_intellectual", 
                                                                         "w2ph_physical", "w2ph_free_anxiety", "w2ph_popularity", "w2ph_happiness")],
                                 by = "ID")


