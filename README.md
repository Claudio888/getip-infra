# getip infraestrutura

Infraestrutura como código da aplicação https://github.com/Claudio888/getip-app

# Recursos criados

#### Packer
- Imagem Ubuntu personalizada pronta para receber uma imagem do ECR

#### Terraform

- EC2
- S3
- Security Group
- Localfile para criação do arquivo hosts a ser usado no deployment

## Blue-Green deployment

Este projeto visa estudar conceito de blue e green deployment em infraestrutura, para manter o conceito de infra imutavel. 

No caso estamos usando os Workspaces do Terraform para fazer a divisão de green-blue deployment. 

Por exemplo, executamos os comandos do terraform abaixo para dev-blue, na proxima execução mudamos o workspace para dev-green, caso não exista será criado, fazendo com que os recursos anteriormente gerados não sejam alterados/excluidos. 

Obs: É de conhecimento outras abordagens para aplicação de blue-green deployment, porém para inciarmos os estudos foi escolhido esta primeira forma. 


### Momento de deployment no projeto - https://github.com/Claudio888/getip-app

Desta forma no momento de fazer o deployment de seu APP, será necessário alterar no arquivo vars da role "get-hosts", qual será o deployment da vez.

```
build-deploy\deploy\roles\get-hosts\vars\main.yml
```
Para documentação de deployment vá até o repositorio do app(https://github.com/Claudio888/getip-app). 

## Dependencias

É necessário que exista previamente os seguintes recursos criados na AWS:

- IAM account com chaves para acesso
- ECR para armazenamento das imagens
- Chave PEM para conexão ssh do Ansible com a instancia final

## Como usar

### Packer 

- Primeiramente exporte as variaveis de acesso a AWS com seus respectivos valores

ECR_AWS_ACCESS_KEY 
ECR_AWS_SECRET_KEY

Exemplo:
```
export ECR_AWS_ACCESS_KEY=DSJAKLÇASDJÇKLADS
export ECR_AWS_SECRET_KEY=23u4r8023302hnaaçaçaç
```

- Em seguida execute o comando para rodar o packer, para que ele crie efetivamente a imagem na AWS

```
packer build image.json 
```
### Terraform

- Iniciamos os módulos terraform 

```
terraform init
```

- Vamos alterar para o workspace desejado no exemplo sera o "dev-blue"

```
terraform workspace new dev-blue
```
- Executamos um plan, para verificarmos ser serão criados todos os recursos desejados

```
terraform plan -out plano
```
- E finalmente um apply caso nosso plan tenha sido feito com sucesso

```
terraform apply plano
```

## Backlog 

- Implementar corretamente uma pipeline no Github Actions
- Deixar genéricos os caminhos no código todo

## Licença
[MIT](https://choosealicense.com/licenses/mit/)