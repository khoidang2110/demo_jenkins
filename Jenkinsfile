pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                // Clone mã nguồn trực tiếp nếu chưa có hoặc pull nếu đã tồn tại
                sh '''
                if [ ! -d "/home/$USER/rum_site_check" ]; then
                    git clone git@github.com:khoidang2110/rum_site_check.git rum_site_check 
                else
                    cd /home/$USER/rum_site_check
                    git pull
                fi
                '''
            }
        }

        stage('Stop and Remove Old Container') {
            steps {
                sh '''
                docker stop rum_site_check || true
                docker rm rum_site_check || true
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                cd /home/$USER/rum_site_check
                docker build -t rum_site_check .
                '''
            }
        }

        stage('Run New Container') {
            steps {
                sh '''
                docker run --restart=always -d --name rum_site_check --memory="300m" --cpus="1.0" rum_site_check
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
