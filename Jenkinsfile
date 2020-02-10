Map modules = [:]

pipeline {


agent {

label 'linux'

}

environment {
        KEY = credentials('mycred01')
        AZURE_CLIENT_ID  = "1d9676ad-7b49-4124-bf97-0a20fb25af4f"
        AZURE_CLIENT_SECRET  = "01e4d9ea-4b27-4ef3-9e64-49c58a86a995"
        AZURE_TENANT_ID  = "838dae52-7c7b-4ebd-ad49-317b7d00bc25"
        PATH =   "/etc/yum.repos.d/y/az:$PATH"
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

stage('test access'){
            steps {
                   script {
            sh 'echo "*************** Stage-2: testing azure access ***************"'
            withCredentials([azureServicePrincipal('mycred01')]) {
		    sh '/etc/yum.repos.d/y/az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID'
                              }
                        }
                    }
                }

}
}
