# Terraform "Hello, World" example

This folder contains a "Hello, World" example of a [Terraform](https://www.terraform.io/) file on Google Cloud Platform (GCP).

This Terraform file deploys a single server on Google Cloud Platform (GCP).

## Requirements

* You must have [Terraform](https://www.terraform.io/) installed on your computer.
* You must have a [Google Cloud Platform (GCP)](https://cloud.google.com/) account.
* You must have downloaded a Google Cloud Platform credentials file.
* You must have enabled the Google Compute Engine API.
* This code was written for Terraform 0.10.x.

## Using the code

* Configure your Google Cloud access keys.

  Two ways in order to configure credentials:

  * Configure `GOOGLE_APPLICATION_CREDENTIALS` environment variable. The variable must contain the path to the credentials file.

    ```bash
    export GOOGLE_APPLICATION_CREDENTIALS="~/.gcloud/terraform-examples-code.json"
    ```

  * Configure `GOOGLE_CREDENTIALS` environment variable. The variable must contain the content of the credentials file and not the path to it.

    ```bash
    export GOOGLE_CREDENTIALS="$(cat ~/.gcloud/terraform-examples-code.json)"
    ```

* Validate the changes:

  ```bash
  terraform plan
  ```

* Deploy the changes:

  ```bash
  terraform apply
  ```

* Clean up the resources created when you have finished:

  ```bash
  terraform destroy
  ```