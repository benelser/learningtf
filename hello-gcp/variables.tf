variable org_domain {
  type        = string
  description = "Organization domain name"
}
variable billing_account {
  type        = string
  description = "The ID of the billing account to associate projects with."
}

variable folders {
  type        = list
  description = "Assuming a single level hierarchy for the organization, the name of the GCP folders that make up each environment"
  default     = ["dev", "qa", "prod", "rnd"]
}



# Variables of custom object definition
variable people {
  type = map
}

variable some_object {
  description = "some cool object"
  type = object({
    nested_object = object({property_name = string})
  })
}
