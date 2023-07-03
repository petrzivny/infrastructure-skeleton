<a name="readme-top"></a>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#what-is-included-out-of-the-box">What is included out-of-the-box</a></li>
    <li><a href="#pictures">Pictures</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#frequently-asked-questions">Frequently Asked Questions</a></li>
    <li><a href="#license">License</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project
A template to jumpstart your new greenfield project. If you are a startup or an entrepreneur thinking to start a new project hosted on GCP infrastructure, consider to use Infrastructure Skeleton and save days of development.

This project uses IaC approach and via terraform create application stack in GCP to host your application.

Don't forget to give the project a star!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

### Prerequisites
* [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
* [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)
* [helm](https://helm.sh/docs/intro/install/) for deploying to kubernetes cluster
* [Docker (and docker compose) installed.](https://docs.docker.com/engine/install/) You don't need Docker Desktop for this project. 
<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Installation
1. Clone the repo. Replace {myproject} with a name of your new project/app.
   ```sh
   git clone git@github.com:petrzivny/infrastructure-skeleton.git {myproject}
   cd {myproject}
   ```
2. Initialize terraform in this directory
   ```sh
   cd app-stack
   terraform init
   ```
3. Check and alter variables and secrets
4. Provision complete application stack
   ```sh
   terraform apply
   ```
<p align="right">(<a href="#readme-top">back to top</a>)</p>

## What is included out-of-the-box

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Pictures
![ci-pipeline.png](documentation%2Fimages%2Fci-pipeline.png)
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->
## Contributing
I **greatly appreciate** all suggestions and contributions. Contributions are what make the open source community such an amazing place to learn, inspire, and create.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
2. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
3. Push to the Branch (`git push origin feature/AmazingFeature`)
4. Open a Pull Request
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ROADMAP -->
## Roadmap
- [ ] CI: Add GCP cost estimation

See the [open issues](https://github.com/petrzivny/infrastructure-skeleton/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Frequently Asked Questions

<!-- LICENSE -->
## License
Distributed under the MIT License. Use it however you want. And if you like it, don't forget to give the project a star at GutHub. 

<p align="right">(<a href="#readme-top">back to top</a>)</p>
