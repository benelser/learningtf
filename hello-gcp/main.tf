provider "google" {
    
}

# Creates a folders foreach instance in supplied array
resource "google_folder" "environments" {
    for_each     = toset(var.folders)
    # Create dynamic string name using index function to create a counter
    display_name = "StringinterpolationsForEachLoop${index(var.folders, each.value) + 1}"
    parent       = "organizations/${data.google_organization.default.org_id}"
}

# Creates n number of resources using Count can be hard coded or made dynamic using length function
resource "google_folder" "environments-2" {
    count = length(var.folders)
    # Create dynamic string using the index of number of count length
    display_name = "StringinterpolationsForLoop${count.index}"
    parent       = "organizations/${data.google_organization.default.org_id}"
}


# Create map key values from two lists initialize local vars to be used with for loop (count)
locals {
    mapping = zipmap(["one", "two"], [1,2])
    keys = keys(local.mapping)
    values = values(local.mapping)
}

# Creates resources using values from key value map
resource "google_folder" "environments-3" {

    count = length(local.keys)
    # Create dynamic string using key value

    display_name = "Mapping-Key-${local.keys[count.index]}-Value-${local.values[count.index]}"
    parent       = "organizations/${data.google_organization.default.org_id}"
}

# Create resource using custom object json and access "properties"
resource "google_folder" "environments-4" {

    count = length(var.people["list"])
    # Create dynamic string using json object carring property values
    display_name = "FirstName-${var.people["list"][count.index].fn}-LastName-${var.people["list"][count.index].ln}-Age-${var.people["list"][count.index].age}"
    parent       = "organizations/${data.google_organization.default.org_id}"
}


output "people_array" {
    value = var.people["list"]
}

output "access_index" {
    value = var.people["list"][1]
}

output "access_index_property" {
    value = var.people["list"][1].age
}

# Grabs the age property on element at index 1
output "people_element" {
    value = (element(var.people["list"], 1)).age
}


# Give me and unordered list of all the ages on the objects in the array that meet the condition
output "ages" {
    value = [for x in var.people["list"]: x.age if x.age > 0]
}

# Initialize list filtering with some logic "SELECT * WHERE"
locals {
    ages = [for p in var.people["list"]: p.age if p.age > 0]
}

output "max_age" {
    # Expand list using ...
    value = max(local.ages...)
}

output "formatted_string" {
    
    value = format("Hi my name is %s %s. I am %d years old!", (element(var.people["list"], 1)).fn, (element(var.people["list"], 1)).ln, (element(var.people["list"], 1)).age)
}

# Initialize list filtering with some logic "SELECT * WHERE"
# Might be better way to do this
locals {
    names = [for p in var.people["list"]: p.fn if p.fn != ""]
}

output "formatted_list" {
    value = formatlist("Hello there %s!", local.names)
}

output "joined_strings" {
    value = join("|", local.names)
}

locals {
    upper_names = [for p in var.people["list"]: upper(p.fn)]
}

output "to_upper_strings" {
    value = local.upper_names
}

output "to_lower_strings" {
    value = [for n in local.upper_names: lower(n)]
}

output "some_cool_object" {
    value = var.some_object
}

locals {
    several_cool_objects =  [
        {
          nested_object = {
            property_name = "Some Cool Property Name-${local.upper_names[0]}"
            }
        },
        {
          nested_object = {
            property_name = "Some Cool Property Name-${local.upper_names[1]}"
            }
        },
    ]
}

output "several_cool_objects" {
    value = local.several_cool_objects
}

# Let's do better and see if we can do that more dynamic
locals {
    my_objects = [for n in local.upper_names: {nested_object = {property_name = "Some Cool Property Name-${lower(n)}"}}]
}

output dynamic_objects {
    value = local.my_objects
}

# Lets get all the property names of our super cool objects using Foreach like syntax
locals {
  expanded_property_names = [for object in local.my_objects : object.nested_object.property_name]
}

output expanded_property_names {
   value = local.expanded_property_names
}

# lets rip out the values we want by doing a simple regex match
output expanded_property_names_with_condition {
   value = [for name in local.expanded_property_names: name if length((regexall("(?:ben)", name))) > 0]
}