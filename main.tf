provider "google" {
  project = "acorp-devops-iac"
  region  = "us-central1"
  zone    = "us-central1-c"
  credentials = "${file("serviceaccount.yaml")}"
}

#Folder ACOPR/Commercial
resource "google_folder" "Commercial" {
  display_name = "Commercial"
  parent       = "organizations/organization-ID"
}

#Folder ACORP/Commercial/ERP
resource "google_folder" "ERP" {
  display_name = "ERP"
  parent       = google_folder.Commercial.name
}

#Folder ACORP/Commercial/ERP/Production
resource "google_folder" "Production" {
  display_name = "Production"
  parent       = google_folder.ERP.name
}

#Folder ACORP/Commercial/ERP/Development
resource "google_folder" "Development" {
  display_name = "Development"
  parent       = google_folder.ERP.name
}

#Folder ACORP/Commercial/Mobile
resource "google_folder" "Mobile" {
  display_name = "Mobile"
  parent       = google_folder.Commercial.name
}

#Folder ACORP/Commercial/Mobile/Production
resource "google_folder" "Production" {
  display_name = "Production"
  parent       = google_folder.Mobile.name
}

#Folder ACORP/Commercial/Mobile/Development
resource "google_folder" "Development" {
  display_name = "Development"
  parent       = google_folder.Mobile.name
}

#Folder ACOPR/Financial
resource "google_folder" "Commercial" {
  display_name = "Commercial"
  parent       = "organizations/organization-ID"
}

#Folder ACOPR/Financial/ERP
resource "google_folder" "ERP" {
  display_name = "ERP"
  parent       = google_folder.Commercial.name
}

#Folder ACOPR/Financial/ERP/Production
resource "google_folder" "Production" {
  display_name = "Production"
  parent       = google_folder.ERP.name
}

#Folder ACOPR/Financial/ERP/Development
resource "google_folder" "Development" {
  display_name = "Development"
  parent       = google_folder.ERP.name
}

#Folder ACOPR/Financial/Mobile
resource "google_folder" "Mobile" {
  display_name = "Mobile"
  parent       = google_folder.Commercial.name
}

#Folder ACOPR/Financial/Mobile/Production
resource "google_folder" "Production" {
  display_name = "Production"
  parent       = google_folder.Mobile.name
}

#Folder ACOPR/Financial/Mobile/Development
resource "google_folder" "Development" {
  display_name = "Development"
  parent       = google_folder.Mobile.name
}

#Project creation- Commercial - Production
resource "google_project" "acorp-com-prod" {
  name       = "com-prod"
  project_id = "acorp-com-prod"
  folder_id  = google_folder.Production.name
  auto_create_network=false
  billing_account = "ID-Billing-Account"

}

#Project creation- Commercial - Development
resource "google_project" "acorp-com-dev" {
  name       = "com-dev"
  project_id = "acorp-com-dev"
  folder_id  = google_folder.Development.name
  auto_create_network=false
  billing_account = "ID-Billing-Account"

}

#Project creation- Financial - Production
resource "google_project" "acorp-fin-prod" {
  name       = "fin-prod"
  project_id = "acorp-fin-prod"
  folder_id  = google_folder.Production.name
  auto_create_network=false
  billing_account = "ID-Billing-Account"

}

#Project creation- Financial - Development
resource "google_project" "acorp-fin-dev" {
  name       = "fin-dev"
  project_id = "acorp-fin-dev"
  folder_id  = google_folder.Development.name
  auto_create_network=false
  billing_account = "ID-Billing-Account"

}