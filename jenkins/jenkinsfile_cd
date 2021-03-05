node {
    stage('Preparation') {
        git 'https://github.com/faurik/exam-ansible.git'
        sh 'ansible-galaxy install faurik.ansible_install_exam_app faurik.ansible_nginx_balancer'
    }
    stage('Deployment') {
        ansiblePlaybook credentialsId: 'deploy-ssh-key', inventory: 'inventory', playbook: 'distributed.yml', vaultCredentialsId: 'ansible-vault'
    }
    stage('Integration test') {
        def response = httpRequest 'http://10.254.0.20/'
        println("Status: "+response.status)
    }
}
