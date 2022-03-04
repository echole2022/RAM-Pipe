library(shiny)
library(shinysurveys)
library(readxl)

q1 <- data.frame(question = "Vorname",
                 option = "First Name",
                 input_type = "text",
                 input_id = "first_name",
                 dependence = NA,
                 dependence_value = NA,
                 required = T)
q2 <- data.frame(question = "Nachname",
                 option = "Last Name",
                 input_type = "text",
                 input_id = "last_name",
                 dependence = NA,
                 dependence_value = NA,
                 required = T)
q3 <- data.frame(question = "Studium/Typ der Arbeit",
                 option = "Study/Job Type",
                 input_type = "text",
                 input_id = "study_job",
                 dependence = NA,
                 dependence_value = NA,
                 required = T)
q4 <- data.frame(question = "Fachbereich",
                 option = "Subject",
                 input_type = "text",
                 input_id = "subject",
                 dependence = NA,
                 dependence_value = NA,
                 required = T)
q5 <- data.frame(question = "Erst Betreuer/in",
                 option = "Main Supervisor",
                 input_type = "text",
                 input_id = "main_supervisor",
                 dependence = NA,
                 dependence_value = NA,
                 required = T)
q6 <- data.frame(question = "Sind Sie RAM-Mitglieder?",
                 option = c("Ja","Nein"),
                 input_type = "y/n",
                 input_id = "membeship",
                 dependence = NA,
                 dependence_value = NA,
                 required = T)
q7 <- data.frame(question = "Was ist der Preis bzw. Fördungersart, den Sie beantragen möchten?",
                 option = c("Teilförderung","Otto-Selz Preis","Förderung","RAT-Preis","RAM-Preis"),
                 input_type = "mc",
                 input_id = "prize_subsidary_type",
                 dependence = NA,
                 dependence_value = NA,
                 required = T)
q8 <- data.frame(question = "Bitte beschreiben Sie den Zweck der Förderung:",
                 option = "Please describe the purpose of this prize or subsidary",
                 input_type = "text",
                 input_id = "purpose",
                 dependence = NA,
                 dependence_value = NA,
                 required = T)
q9 <- data.frame(question = "Preisgeld bzw. Förderungsbetrag (€):",
                 option = "Amount of prize or subsidary (€)",
                 input_type = "text",
                 input_id = "amount",
                 dependence = NA,
                 dependence_value = NA,
                 required = T)
df <- rbind(q1, q2, q3, q4, q5, q6, q7, q8, q9)

ui <- fluidPage(
    surveyOutput(df = df,
                 survey_title = "RAM Application",
                 survey_description = "Welcome! demo")
)

server <- function(input, output, session) {
    renderSurvey()
    
    observeEvent(input$submit, {
        showModal(modalDialog(
            title = "Congrats, you completed your first shinysurvey!",
            "You can customize what actions happen when a user finishes a survey using input$submit."
        ))
    })
}

shinyApp(ui, server)