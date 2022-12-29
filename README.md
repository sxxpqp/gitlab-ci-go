添加runner
helm repo add gitlab https://charts.gitlab.io

helm repo update gitlab


helm search repo -l gitlab/gitlab-runner

helm install --namespace <NAMESPACE> gitlab-runner -f <CONFIG_VALUES_FILE> gitlab/gitlab-runner

helm upgrade gitlab-runner \
        --set gitlabUrl=http://gitlab.your-domain.com,runnerRegistrationToken=your-registration-token \
        gitlab/gitlab-runner# gitlab-ci-go
