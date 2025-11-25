# 📘 Documento de Repasse – Deploy via GitHub Actions + ECR + Rancher

## 🧭 Visão Geral

Este documento tem como objetivo orientar o time da **Vitrify** sobre como realizar deploys de aplicações nos clusters Kubernetes de **Production** e **Stage**, utilizando:

- **GitHub Actions** para automação do pipeline
- **Amazon ECR** como registro de imagens
- **Rancher** para gerenciamento e visualização das aplicações nos clusters

A configuração atual permite que qualquer alteração enviada para o repositório possa gerar uma nova imagem, publicada no ECR, e posteriormente aplicada nos clusters.

---

## 🚀 Passo a passo do fluxo de deploy

### 1. Publicação da imagem no ECR via GitHub Actions

O pipeline no GitHub está configurado para:

1. Construir a imagem da aplicação.
2. Autenticar no **Amazon ECR** usando **IAM Role** com IRSA no cluster.
3. Fazer o **push** da nova imagem para o ECR.
4. Aplicar a nova versão nos clusters **Production** e **Stage**.

---

### 2. Visualizando a aplicação no Rancher

Após o deploy, você pode validar o funcionamento da aplicação diretamente no **Rancher**.

🔗 Acesse: [https://rancher.shared.vitrify.tech/](https://rancher.shared.vitrify.tech/)

> É necessário login para acesso. Utilize suas credenciais fornecidas previamente.

No Rancher, navegue até o **namespace** da aplicação para visualizar:

- **Pods** (status de execução)
- **Services** (endpoints internos)
- **Ingress** (URLs de acesso, se configuradas)
- **Logs** em tempo real

---

## ✅ Checklist para adicionar ou atualizar uma aplicação

1. **Código-fonte**

   - Confirme se o `values.yaml` ou manifestos Kubernetes apontam para a imagem correta.

2. **Pipeline**

   - Confirme que o GitHub Actions está configurado para:
     - Autenticar no ECR
     - Fazer o push da imagem
     - Aplicar a atualização no cluster

3. **Testes**
   - Realize testes locais antes do commit.
   - Verifique no Rancher se os pods estão atualizados e rodando.

---

## 🛑 Desativar ou pausar uma aplicação

Se precisar pausar uma aplicação temporariamente, isso pode ser feito via Rancher ou `kubectl`:

```bash
kubectl scale deployment <nome-do-deployment> --replicas=0 -n <namespace>
```
