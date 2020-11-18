# Learning TF the Hard way
This repo is a collection of my learning while ramping on GCP with TF. Most of the code is just learning TF language mechanics. I find the best way to learn any new language is just banging around the cli. This repo is a capture of that exercise. I will also use it as a reference for language specifics. 
If you want to see the output of any code in [main.tf](./hello-gcp/main.tf) just comment out whatever you don't want. Then run: 
```powershell
terraform plan
```

## Set up env
With TF installed
```powershell
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
[SA Getting Started](https://cloud.google.com/community/tutorials/getting-started-on-gcp-with-terraform)
[SA Manage](https://cloud.google.com/community/tutorials/managing-gcp-projects-with-terraform)
[How-To ](https://gmusumeci.medium.com/how-to-create-a-service-account-for-terraform-in-gcp-google-cloud-platform-f75a0cf918d1)