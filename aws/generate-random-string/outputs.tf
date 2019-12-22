output "string-result" {
    description = "Generates random strings for naming conventions."
    value = "${random_string.random-string.result}"
}
