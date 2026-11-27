mock_provider "random" {}

run "generates_a_secret" {
  command = plan

  assert {
    condition     = random_password.secret.length == 48 && random_password.secret.special == false
    error_message = "The secret should be 48 alphanumeric characters."
  }
}

run "rotation_is_a_keeper" {
  command = plan

  variables {
    rotation = "2"
  }

  assert {
    condition     = random_password.secret.keepers.rotation == "2"
    error_message = "rotation should feed the keepers so changing it generates a new secret."
  }
}
