# Documentação da Infraestrutura Terraform

Este documento detalha a estrutura e o propósito de cada componente da nossa infraestrutura como código, gerenciada com Terraform e Terragrunt.

## Visão Geral

A nossa infraestrutura na AWS é organizada em várias contas, cada uma com uma responsabilidade específica. O diretório `accounts` é a raiz onde todas as configurações de infraestrutura do Terraform residem.

### Estrutura Padrão

Cada diretório de conta (ex: `vitrify-audit-services`) segue uma estrutura padrão:

- **`setup-terraform-backend/`**: Contém a configuração do *backend* remoto do Terraform.
  - `main.tf`: Define o bucket S3 para armazenar o arquivo de estado (`.tfstate`) e a tabela DynamoDB para o bloqueio de estado, garantindo que apenas uma pessoa possa aplicar alterações por vez.
  - `terragrunt.hcl`: Orquestra a criação do backend antes da execução de qualquer outro recurso.

- **`setup-account/`**: Contém a definição dos recursos da AWS para a conta específica.
  - **Arquivos `_*.tf`**: Arquivos de configuração base, como `_providers.tf` (provedores da AWS), `_backend.tf` (configuração do estado remoto) e `_locals.tf` (variáveis locais).
  - **Arquivos de recursos (`aws_*.tf`)**: Cada arquivo define um recurso específico da AWS (ex: `aws_iam_account.tf` para políticas de senha, `aws_s3_account_access.tf` para bloqueio de acesso público a buckets S3).
  - `terragrunt.hcl`: Orquestra a aplicação dos recursos, define as dependências e passa as variáveis necessárias.

---

## Detalhes das Contas

### 1. `vitrify-audit-services`

**Propósito:** Esta conta é responsável por centralizar os serviços de segurança, monitoramento e auditoria da AWS.

**Recursos Gerenciados:**
- **IAM Access Analyzer (`aws_accessanalyzer_analyzer.tf`):** Monitora o acesso a recursos para garantir que as políticas forneçam apenas o acesso pretendido.
- **Contatos Alternativos (`aws_alternate_contacts.tf`):** Configura contatos de faturamento, operações e segurança para a conta da AWS.
- **Criptografia EBS (`aws_ebs_encryption.tf`):** Habilita a criptografia por padrão para todos os novos volumes EBS, protegendo os dados em repouso.
- **Políticas de Senha do IAM (`aws_iam_account.tf`):** Define requisitos de complexidade e rotação de senhas para os usuários IAM.
- **Acesso para o AWS Support e SSM (`aws_iam_role_support.tf`, `aws_iam_role_ssm.tf`):** Cria roles que permitem que o suporte da AWS e o Systems Manager acessem a conta de forma segura.
- **Bloqueio de Acesso Público a Buckets S3 (`aws_s3_account_access.tf`):** Impede que buckets S3 sejam expostos publicamente acidentalmente.
- **Service Quotas (`aws_service_quotas.tf`):** Gerencia as cotas de serviço da AWS para evitar limitações inesperadas.

### 2. `vitrify-log-services`

**Propósito:** Esta conta centraliza o armazenamento e o gerenciamento de logs de todas as outras contas da AWS, servindo como um ponto único para análise e auditoria.

**Recursos Gerenciados:**
- **Configuração de Base:** Assim como a conta de auditoria, esta conta implementa uma configuração de segurança fundamental.
- **IAM Access Analyzer, Contatos Alternativos, Criptografia EBS, Políticas de Senha, Acesso para Suporte/SSM, Bloqueio de S3 e Service Quotas:** Estes recursos são configurados de forma idêntica à conta `vitrify-audit-services` para garantir um ambiente seguro e bem gerenciado.

### 3. `vitrify-network-services`

**Propósito:** Esta conta é dedicada ao gerenciamento centralizado dos recursos de rede, conectividade e resolução de nomes. Ela é dividida em três componentes principais:

- **`setup-network/`**: Gerencia a infraestrutura de rede principal.
  - **Recursos:** Cria as VPCs, sub-redes, tabelas de rotas e o Transit Gateway (TGW) para a comunicação entre as VPCs. O código comentado em `tgw_connections.tf` indica a intenção de criar um peering de TGW entre regiões para conectividade cross-region.

- **`setup-dns/`**: Gerencia o serviço de DNS.
  - **Recursos:** Configura as zonas hospedadas públicas e privadas no AWS Route 53. As zonas privadas são associadas à VPC principal para resolução de nomes interna, enquanto as zonas públicas gerenciam o DNS público.

- **`setup-client-vpn/`**: Gerencia o acesso remoto seguro.
  - **Recursos:** Configura o AWS Client VPN, incluindo o endpoint, grupos de segurança, rotas e regras de autorização. Isso permite que os usuários se conectem de forma segura à VPC a partir de locais remotos.

### 4. `vitrify-prod-services`

**Propósito:** Esta conta hospeda os serviços e aplicações em produção, atendendo aos usuários finais.

**Recursos Gerenciados:**
- **Configuração de Base:** Implementa a mesma configuração de segurança robusta das contas de auditoria e log para garantir a máxima proteção do ambiente produtivo.
- **IAM Access Analyzer, Contatos Alternativos, Criptografia EBS, Políticas de Senha, Acesso para Suporte/SSM, Bloqueio de S3 e Service Quotas:** Estes recursos são configurados para manter o ambiente de produção seguro, resiliente e em conformidade.

### 5. `vitrify-security-services`

**Propósito:** Esta conta centraliza os serviços de segurança que se aplicam a toda a organização, como gerenciamento de identidades e detecção de ameaças.

**Recursos Gerenciados:**
- **Configuração de Base:** Aplica a mesma configuração de segurança essencial da conta de rede.
- **Access Analyzer, Contatos Alternativos, Políticas de Senha do IAM e Acesso para SSM:** Estes recursos garantem que a conta de segurança seja bem gerenciada e protegida.

### 6. `vitrify-shared-services`

**Propósito:** Esta conta hospeda serviços compartilhados que são utilizados por várias outras contas e aplicações, como ferramentas de CI/CD, repositórios de artefatos e DNS.

**Recursos Gerenciados:**
- **Configuração de Base:** Aplica a mesma configuração de segurança robusta das contas de produção para garantir a proteção dos serviços compartilhados.
- **IAM Access Analyzer, Contatos Alternativos, Criptografia EBS, Políticas de Senha, Acesso para Suporte/SSM, Bloqueio de S3 e Service Quotas:** Estes recursos são configurados para manter os serviços compartilhados seguros e disponíveis.

### 7. `vitrify-stage-services`

**Propósito:** Esta conta serve como um ambiente de pré-produção (staging) para testar as aplicações antes de implantá-las em produção.

**Recursos Gerenciados:**
- **Configuração de Base:** Espelha a configuração de segurança da conta de produção para garantir que os testes sejam realizados em um ambiente o mais próximo possível do real.
- **IAM Access Analyzer, Contatos Alternativos, Criptografia EBS, Políticas de Senha, Acesso para Suporte/SSM, Bloqueio de S3 e Service Quotas:** Estes recursos são configurados para manter o ambiente de stage seguro e consistente com o de produção.
