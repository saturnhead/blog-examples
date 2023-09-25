resource "random_pet" "pet" {
  length = 3
}

output "pet" {
  value = random_pet.pet.id
}