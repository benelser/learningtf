# Learning TF the Hard way
This repo is a collection of my learning while ramping on GCP with TF. Most of the code is just learning TF language mechanics. I find the best way to learn any new language is just banging around the cli. This repo is a capture of that exercise. I will also use it as a reference for language specifics. 
If you want to see the output of any code in [main.tf](./hello-gcp/main.tf) just comment out whatever you don't want. Then run: 
```powershell
terraform plan
```

## Tools 
- [Terraform](https://www.terraform.io/downloads.html)
- [gcloud sdk](https://cloud.google.com/sdk/docs/install)

## Useful gcloud commands
```bash
gcloud organizations list # List orgs to get id
gcloud alpha resource-manager folders list --folder=123456789 # List all folders under specific folder id
gcloud alpha billing accounts list # Get billing accounts
gcloud config get-value project # get current project
gcloud config set project elser-test # set/change current project
```

## Set up env
```powershell
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
brew upgrade hashicorp/tap/terraform
terraform --help # verify install
brew cask install google-cloud-sdk
mkdir learningtf
terraform init # Initialize terraform and pull down provider
```

# Authenticate with gcloud
[Auth Using User](https://cloud.google.com/sdk/gcloud/reference/auth/application-default)
```powershell
gcloud auth application-default login
```

# Use SA
[SA By ENV VAR](https://cloud.google.com/docs/authentication/production#passing_variable)
[SA Getting Started](https://cloud.google.com/community/tutorials/getting-started-on-gcp-with-terraform)
[SA Manage](https://cloud.google.com/community/tutorials/managing-gcp-projects-with-terraform)
[How-To ](https://gmusumeci.medium.com/how-to-create-a-service-account-for-terraform-in-gcp-google-cloud-platform-f75a0cf918d1)