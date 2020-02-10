Map modules = [:]

pipeline {


agent {

label 'linux'

}


stages {

stage('Checkout Code'){

steps {

dir('mpsreelal/pex-az-project') {

checkout scm

}

}

}


stage('Terraform path') {

steps {

script {

sh 'uname -r'

sh 'sudo yum install -y unzip'

}

}

}


stage('Initialise terraform'){

steps {

dir('mpsreelal/pex-az-project'){

script {

echo "*************** Stage-1: Initialze and setting Up terraform ***********"

sh 'wget https://releases.hashicorp.com/terraform/0.12.18/terraform_0.12.18_linux_amd64.zip'


sh 'unzip -o terraform_0.12.18_linux_amd64.zip'

sh 'sudo mv terraform /usr/local/bin/'

sh 'terraform --version'


}

}

}

}


}

}
