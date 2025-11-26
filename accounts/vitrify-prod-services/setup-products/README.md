# Documentação Técnica dos Produtos

Este documento fornece uma análise detalhada do código Terraform para os principais serviços hospedados na conta de produção.

## 1. Cluster EKS (`setup-eks-vitrify`)

O cluster Kubernetes é provisionado usando o módulo `terraform-aws-modules/eks/aws`. A configuração é modular, com cada arquivo `.tf` gerenciando um aspecto específico do cluster.

### `eks_cluster.tf`

Este é o arquivo principal para a definição do cluster.

-   **Cluster:**
    -   Define a versão do Kubernetes, a VPC e as sub-redes.
    -   Habilita o IRSA (`enable_irsa = true`) para permitir que os pods do Kubernetes assumam roles do IAM, seguindo as melhores práticas de segurança.
    -   Configura o acesso ao endpoint do cluster como privado e público.

-   **Grupos de Nós Gerenciados (`eks_managed_node_groups`):**
    -   Provisiona um grupo de nós chamado `green` com instâncias `c7i-flex.large` sob demanda.
    -   O grupo de nós é configurado para escalonar de 2 a 5 instâncias, com volumes EBS `gp3` de 64GB.

-   **Perfil Fargate (`fargate_profiles`):**
    -   Cria um perfil Fargate para o namespace `karpenter`, permitindo a execução de pods sem a necessidade de gerenciar instâncias EC2.

-   **Logging e Criptografia:**
    -   Os logs do control plane (api, audit, etc.) são exportados para o CloudWatch para monitoramento e auditoria.
    -   Os segredos do Kubernetes são criptografados em repouso usando uma chave KMS, adicionando uma camada extra de segurança.

---

## 2. Banco de Dados RDS (`setup-rds-postgres`)

Os bancos de dados PostgreSQL são provisionados usando o módulo `terraform-aws-modules/rds/aws`.

### `aws_rds.tf`

Este arquivo define três instâncias de banco de dados PostgreSQL, cada uma para uma finalidade específica:

-   `db_postgres_services` (`db.m5.large`): Para os serviços principais da aplicação.
-   `db_postgres_data` (`db.t3.medium`): Para dados gerais.
-   `db_postgres_keycloak` (`db.m5.large`): Para o serviço de autenticação Keycloak.

**Configuração Comum:**

-   **Motor:** Todas as instâncias usam o PostgreSQL 14.
-   **Armazenamento:** Utilizam armazenamento `gp3` com auto-scaling (de 20GB a 100GB).
-   **Segurança:**
    -   A senha do usuário mestre (`postgres_admin`) é gerenciada de forma segura pelo AWS Secrets Manager (`manage_master_user_password = true`).
    -   As instâncias são implantadas em uma sub-rede de banco de dados dedicada e protegidas por um grupo de segurança (`aws_sg.tf`).
-   **Monitoramento:** O Performance Insights e o monitoramento aprimorado estão habilitados para fornecer métricas detalhadas de desempenho do banco de dados.
-   **Backup:** A retenção de backup é configurada para 7 dias, com uma janela de backup diária.
