pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                // Clone mã nguồn trực tiếp nếu chưa có hoặc pull nếu đã tồn tại
                sh '''
                if [ ! -d "/home/root/hello_jenkins" ]; then
                    git clone https://github.com/khoidang2110/hello_jenkins.git /home/root/hello_jenkins
                else
                    cd /home/root/hello_jenkins
                    git pull
                fi
                '''
            }
        }

        stage('Stop and Remove Old Container') {
            steps {
                sh '''
                docker stop hello_jenkins || true
                docker rm hello_jenkins || true
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                cd /home/$USER/hello_jenkins
                docker build -t hello_jenkins .
                '''
            }
        }

        stage('Run New Container') {
            steps {
                sh '''
                docker run --restart=always -d --name hello_jenkins --memory="300m" --cpus="1.0" hello_jenkins
                '''
            }
        }

        stage('Clean Up') {
            steps {
                sh '''
                docker image prune -f
                '''
            }
        }
    }
}
