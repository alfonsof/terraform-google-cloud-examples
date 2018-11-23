# Terraform Create Cloud Storage example

This folder contains the create Cloud Storage example of a [Terraform](https://www.terraform.io/) file on Google Cloud Platform (GCP).

This Terraform file deploys the creation of a Google Cloud Storage bucket on Google Cloud Platform (GCP).

## Requirements

* You must have [Terraform](https://www.terraform.io/) installed on your computer.
* You must have a [Google Cloud Platform (GCP)](https://cloud.google.com/) account.
* You must have downloaded a Google Cloud Platform credentials file.
* You must have enabled the Google Compute Engine API.
* It uses the Terraform Google Cloud Provider that interacts with the many resources supported by Google Cloud Platform (GCP) through its APIs.
* This code was written for Terraform 0.10.x.

## Using the code

* Configure your Google Cloud access keys.

  Two ways in order to configure credentials:

  * Configure `GOOGLE_APPLICATION_CREDENTIALS` environment variable. The variable must contain the path to the credentials file.

    To set these variable on Linux, macOS, or Unix, use `export`:

    ```bash
    export GOOGLE_APPLICATION_CREDENTIALS="~/.gcloud/terraform-examples-code.json"
    ```

    To set these variable on Windows, use `set`:

    ```bash
    set GOOGLE_APPLICATION_CREDENTIALS="C:\Users\USERNAME\.gcloud\terraform-examples-code.json"
    ```

  * Configure `GOOGLE_CREDENTIALS` environment variable. The variable must contain the content of the credentials file and not the path to it.

    To set these variable on Linux, macOS, or Unix, use `export`:

    ```bash
    export GOOGLE_CREDENTIALS="$(cat ~/.gcloud/terraform-examples-code.json)"
    ```

* Initialize working directory.

  The first command that should be run after writing a new Terraform configuration is the `terraform init` command in order to initialize a working directory containing Terraform configuration files. It is safe to run this command multiple times.

  ```bash
  terraform init
  ```

* Modify configuration.

  You must modify the Google Cloud Storage bucket name, which is defined as an input variable `bucket_name` in `vars.tf` file.

  You can modify the Google Cloud Storage bucket name in several ways:

  * Loading variables from command line flags.

    Run Terraform commands in this way:

    ```bash
    terraform plan -var 'bucket_name=<YOUR_BUCKET_NAME>'
    ```

    ```bash
    terraform apply -var 'bucket_name=<YOUR_BUCKET_NAME>'
    ```

  * Loading variables from a file.

    When Terraform runs it will look for a file called `terraform.tfvars`. You can populate this file with variable values that will be loaded when Terraform runs. An example for the content of the `terraform.tfvars` file:

    ```bash
    bucket_name = "<YOUR_BUCKET_NAME>"
    ```

  * Loading variables from environment variables.

    Terraform will also parse any environment variables that are prefixed with `TF_VAR`. You can create an environment variable `TF_VAR_bucket_name`:

    ```bash
    TF_VAR_bucket_name=<YOUR_BUCKET_NAME>
    ```

  * Variable defaults.

    Change the value of the `default` attribute of `bucket_name` input variable in `vars.tf` file.

    ```hcl
    variable "bucket_name" {
      description = "The name of the Google Cloud Storage bucket. Must be globally unique."
      default = "<YOUR_BUCKET_NAME>"
    }
    ```

* Validate the changes.

  Run command:

  ```bash
  terraform plan
  ```

* Deploy the changes.

  Run command:

  ```bash
  terraform apply
  ```

* Test the deploy.

  When the `terraform apply` command completes, use the Google Cloud console, you should see the new Google Storage bucket created in the Google Cloud Project.

* Clean up the resources created.

  When you have finished, run command:

  ```bash
  terraform destroy
  ```