Map modules = [:]
pipeline {

agent {
         label 'linux'
     }

        environment {
        AZURE_CLIENT_ID = "1d9676ad-7b49-4124-bf97-0a20fb25af4f"
        AZURE_CLIENT_SECRET = "01e4d9ea-4b27-4ef3-9e64-49c58a86a995"
        AZURE_TENANT_ID = "838dae52-7c7b-4ebd-ad49-317b7d00bc25"
        PATH="/etc/yum.repos.d/y/:$PATH"
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
             
             
     stage('Initialise azlogin'){
            steps {
			 dir('mpsreelal/pex-az-project'){
                   script {
	echo "*************** Stage-2: Initialze and setting Up Azure login***********"
            sh 'cd /usr'
	    sh 'sudo rm -rf /usr/py'	   
            sh 'sudo mkdir py'
	    sh 'pwd'   
            sh 'cd py/'
            sh 'sudo wget https://www.python.org/ftp/python/3.6.3/Python-3.6.3.tar.xz'
            sh 'sudo tar xJf Python-3.6.3.tar.xz'
	    sh 'pwd'  
            sh 'cd /usr/py/Python-3.6.3'
	    sh 'pwd'  
            sh 'sudo ./configure'
            sh 'sudo make install'
            sh 'sudo python3 -V'
            sh 'sudo curl -L https://aka.ms/InstallAzureCli | bash'
            sh 'sudo /usr/bin/python --version'
            sh 'sudo mv /usr/bin/python /usr/bin/python.old'
            sh 'sudo ln -s /usr/local/bin/python3.6 /usr/bin/python'
            sh 'sudo /usr/bin/python --version'
            sh 'sudo curl -L https://aka.ms/InstallAzureCli | bash'
            sh 'sudo unlink /usr/bin/python2'
            sh 'sudo ln -s /usr/bin/python.old /usr/bin/python2'
            sh "sudo sed -i 's/python/python.2/' /usr/bin/yum"
                       
		      }
                    }
                }
            }

            stage('test access'){
            steps {
                dir('mpsreelal/pex-az-project'){
                   script {
            echo "*************** Stage-2: testing azure access ***************"
            withCredentials([azureServicePrincipal('mycred01')]) {
                    sh 'echo $PATH'
                    sh 'az login  -u midhun.p2002@gmail.com -p midisinmidisin'
                              }
                        }
                    }
                }
            }

 stage('Initiate deplymentcode'){
              steps {
                  dir('mpsreelal/pex-az-project/infrastructure'){
                      script {
                      sh 'terraform init'
                      sh 'pwd'
                      sh 'echo $PATH'
                      sh 'terraform plan -no-color -out terraform.plan'
                      sh 'terraform apply -auto-approve terraform.plan'
                     }
                  }
              }
          }

        }

    }
