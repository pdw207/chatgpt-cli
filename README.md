# Natural language Shell

Simple Natural language Command Line interface from OpenAI's Blog https://openai.com/blog/openai-api/

## Quickstart

1. `$ brew tap pdw207/nlshell && brew install nlshell`
2. Create a new secret API key on OpenAI at https://beta.openai.com/account/api-keys
3. Set environment variable, for zsh `$ echo export OPENAI_API_KEY=NEW_KEY >> ~/.zshrc`
4. Get started in a new tab. Try `$ nlshell list files in current directory`

## Example Use Cases

```
$ nlshell git log pretty
>>> Run:  git log --pretty=format:"%h %ad | %s%d [%an]" [y/N]: y
$ git log --pretty=format:"%h %ad | %s%d [%an]"

$  nlshell set kubernetes namespace
>>> Run:  kubectl config set-context default --namespace=kube-system [y/N] y
$ kubectl config set-context default --namespace=kube-system

$  nlshell exec into the docker image called foobar
>>> Run:  docker exec -it foobar bash [y/N]: y
$ docker exec -it foobar bash
```
