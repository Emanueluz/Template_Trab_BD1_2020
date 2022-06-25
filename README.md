# TRABALHO 01:  Nikaido - Sistema de Gerenciamento de Mesas e Campanhas de RPG
Trabalho desenvolvido durante a disciplina de BD1

# Sumário

### 1. COMPONENTES<br>
Integrantes do grupo<br>
Emanuel Norjosa Luz: luzemanuel.n@gmail.com<br>
Giovanni Sencioles: giovannisencioles@gmail.com<br>
...<br>

### 2.INTRODUÇÃO E MOTIVAÇÃO<br>
Este documento contém a especificação do projeto do banco de dados "Nikaido".
<br>e motivação da escolha realizada. <br>

> O desenvolvimento do projeto Nikaido tem como objetivo principal auxiliar novos jogadores de RPGs de mesa, provendo um sistema de gerenciamento de mesas, campanhas e fichas de personagem, além de uma funcionalidade de rolagem de dados para a distribuição de atributos dos personagens criados.
 

### 3.MINI-MUNDO<br>
> Pensando no tempo gasto e na dificuldade de iniciantes em jogos de RPG de mesa em criar fichas, que são compostas com informações a respeito do personagem criado como por exemplo a história, classe, subclasse, personalidade e devoção, além dos registros sobre o status dos atributos do personagem como vida, inteligência, destreza, etc. É proposto a criação de um sistema que pessoas podem criar fichas para esses personagens e juntar outras pessoas para jogar. Um usuário pode criar uma campanha, sendo ele o mestre, e convidar outras pessoas para participar, sendo esses os jogadores. O mestre da campanha pode acessar as fichas dos jogadores, atribuir perdas e/ou ganhos a eles, além de adicionar imagens e músicas para melhor ambientação. O sistema também deve ter uma função de rolagem de dados que atualiza a ficha do personagem no decorrer do jogo. Os jogadores podem ver o status do inimigo colocado no jogo pelo mestre.

### 4.PROTOTIPAÇÃO, PERGUNTAS A SEREM RESPONDIDAS E TABELA DE DADOS<br>
#### 4.1 RASCUNHOS BÁSICOS DA INTERFACE (MOCKUPS)<br>

![Alt text](https://github.com/Emanueluz/Template_Trab_BD1_2020/blob/master/images/prototipoJogo.png?raw=true "Projeto Nikaido")
![Arquivo PDF do Protótipo Balsamiq feito para Projeto Nikaido](https://github.com/Emanueluz/Template_Trab_BD1_2020/blob/master/arquivos/Prototipação.pdf?raw=true "Projeto Nikaido")
#### 4.2 QUAIS PERGUNTAS PODEM SER RESPONDIDAS COM O SISTEMA PROPOSTO?
    a) O sistema proposto poderá fornecer quais tipos de relatórios e informações? 
    b) Crie uma lista com os 5 principais relatórios que poderão ser obtidos por meio do sistema proposto!
    
> Nikaido precisa inicialmente dos seguintes relatórios:
* Relatório contendo informações de login dos usuários;
* Relatório que descreva a ficha do personagem e NPC;
* Relatorio listando todos os itens, dano de cada um, descrição, efeitos adicionais e tipo de dano;
* Relatório que contém informações sobre a mesa;
* Relatório contendo informações sobre a campanha inserida na mesa atual;

>> ##### Observações gerais: <br> a) As tabelas de informações adicionais do personagem, itens e de informações sobre a campanha estão relacionadas entre si e atreladas à mesa atual, somente a ficha base poderá ser replicada; <br>  b) As tabelas citadas anteriormente (com exceção da replicável) podem conter valores nulos. <br> c) Os NPC's são um tipo de personagem também, mas em uma mesa de RPG abitual esse tipo de personagem não necessariamente tem itens ou historia.
 
 
#### 4.3 TABELA DE DADOS DO SISTEMA:
    a) Esta tabela deve conter todos os atributos do sistema e um mínimo de 10 linhas/registros de dados.
    b) Esta tabela tem a intenção de simular um relatório com todos os dados que serão armazenados 
    
![Exemplo de Tabela de dados do Projeto Nikaido](https://github.com/Emanueluz/Template_Trab_BD1_2020/blob/master/arquivos/NikaidoRPG_Dados.xlsx?raw=true "Tabela - Nikaido")
    
    
### 5.MODELO CONCEITUAL<br>
    A) Utilizar a Notação adequada (Preferencialmente utilizar o BR Modelo 3)
    B) O mínimo de entidades do modelo conceitual pare este trabalho será igual a 3 e o Máximo 5.
        * informe quais são as 3 principais entidades do sistema em densenvolvimento<br>(se houverem mais de 3 entidades, pense na importância da entidade para o sistema)       
    C) Principais fluxos de informação/entidades do sistema (mínimo 3). <br>Dica: normalmente estes fluxos estão associados as tabelas que conterão maior quantidade de dados 
    D) Qualidade e Clareza
        Garantir que a semântica dos atributos seja clara no esquema (nomes coerentes com os dados).
        Criar o esquema de forma a garantir a redução de informação redundante, possibilidade de valores null, 
        e tuplas falsas (Aplicar os conceitos de normalização abordados).   
        
![Alt text](https://github.com/Emanueluz/Template_Trab_BD1_2020/blob/master/images/modeloConceitual.jpeg "Modelo Conceitual")
   
#### 5.1 Validação do Modelo Conceitual
    [Grupo01]: [Nomes dos que participaram na avaliação]
    [Grupo02]: [Nomes dos que participaram na avaliação]

#### 5.2 Descrição dos dados<br>
* USUARIO: Tabela que armazena informações referentes ao cadastro de usuários
```
id_user: Associa identificador ao usuário;
email: Campo que armazena o e-mail do usuário;
senha: Campo que armazena a senha do usuário
```
* MESA: Tabela que armazena informações referentes à mesa
```
id_mesa: Associa identificador à mesa;
mestre: Campo relativo ao criador da mesa, por consequência, o mestre da campanha;
link: Campo de link gerado para a mesa
```
* JOGO: Tabela que armazena informações referentes à campanha associada a uma mesa
```
id_jogo: Associa identificador ao jogo/campanha;
jogo_mestre: Campo relativo ao mestre da campanha;
id_mesa: Campo associando a campanha a uma mesa
```
* PERSONAGEM: Tabela que armazena informações de um personagem associado a um usuário e campanha
```
id_perso: Associa identificador ao personagem;
nome: Campo relativo ao nome do personagem;
id_user: Campo associando o personagem a um usuário;
id_jogo: Campo associando o personagem a uma campanha
```
* ITENS: Tabela que armazena informações relativas aos itens a ser carregados e utilizados pelos personagens
```
id_item: Associa identificador ao item;
nome: Campo relativo ao nome do item;
dano: Campo que armazena os pontos de dano do item;
descricao: Campo referente à raridade do item;
efeito: Campo referente ao efeito adicional (buff) do item;
tipo: Campo referente ao tipo de dano do item (Cortante/Impactante/Perfurante)
```
* ATRIBUTO: Tabela que armazena informações referentes a atributos baseados no sistema de RPG sendo utilizado
```
id_atributo: Associa identificador ao atributo;
tipo: Campo relacionado ao nome do atributo (No sistema D&D, por exemplo, há 6 atributos base:  Força, Destreza, Constituição, Inteligência, Sabedoria e Carisma)
```

### 6	MODELO LÓGICO<br>
![Alt text](https://github.com/Emanueluz/Template_Trab_BD1_2020/blob/master/images/modeloLogico.png?raw=true "Modelo Lógico")

### 7	MODELO FÍSICO<br>
* Criação da tabela USUARIO
```
create table if not exists USUARIO(
	id_user integer not null primary key,
	email varchar(80) not null,
	senha varchar(30) not null
);
``` 
* Criação da tabela MESA
```
create table if not exists MESA(
	id_mesa integer not null primary key,
	link varchar(6) not null,
	nome varchar(30) not null,
	mestre integer,
	foreign key(mestre) references USUARIO(id_user)
);<br>       
* Criação da tabela JOGO
> create table if not exists JOGO(
	id_jogo integer not null primary key,
	jogo_mestre integer,
	mesa integer,
	foreign key(mesa) references MESA(id_mesa)
);
```
* Criação da tabela PERSONAGEM
```
create table if not exists PERSONAGEM(
	id_perso integer not null primary key,
	nome varchar(30),
	usuario integer,
	jogo integer,
	foreign key(jogo) references JOGO(id_jogo)
);
```
* Criação da tabela ATRIBUTO
```
create table if not exists ATRIBUTO(
	id_atributo integer not null primary key,
	tipo varchar(30)
);
```
* Criação da tabela ITENS
```
create table if not exists ITENS(
	id_item integer not null primary key,
	nome varchar(30),
	dano integer,
	descricao varchar(50),
	efeito varchar(20),
	tipo varchar(20)
);
```
* Criação da tabela Perso_Atr
```
create table if not exists Perso_Atr(
	id_combi integer not null primary key,
	id_per integer not null,
	id_atr integer not null,
	dice integer,
	multiplier integer,
	foreign key(id_per) references PERSONAGEM(id_perso),
	foreign key(id_atr) references ATRIBUTO(id_atributo)
);
```
* Criação da tabela Itens_Perso
```
create table if not exists Itens_Perso(
	id_equip integer not null primary key,
	item integer,
	perso integer,
	foreign key(item) references ITENS(id_item),
	foreign key(perso) references PERSONAGEM(id_perso)
);
```
### 8	INSERT APLICADO NAS TABELAS DO BANCO DE DADOS<br>
* Inserção de dados na tabela USUARIO
```
insert into USUARIO(id_user,email,senha)
	values
		(1001,'joazinho.monge@hotmail.com','1234'),
		(1002,'bruno.almago@gmail.com','magia'),
		(1003,'ricardinhoplayer123@hotmail.com','ricardinho123'),
		(1004,'joanabr@gmail.com','quadrado');
```
* Inserção de dados na tabela MESA
```
insert into MESA(id_mesa,link,nome,mestre)
	values
		(456,'gfhdfh','Covil dos Lobos',1001),
		(654,'rfaerg','Guardiões de Thanatos',1003),
		(353,'fgjhda','Taverna dos Pecadores',1004),
		(247,'tsarty','Guerreiros de Canaban',1002),
		(846,'sdrotl','Defensores do MST',1001);
```
* Inserção de dados na tabela JOGO
```
insert into JOGO(id_jogo,jogo_mestre,mesa)
	values
		(111,1004,353),
		(222,1001,846),
		(333,1003,654),
		(444,1002,247);
```
* Inserção de dados na tabela ATRIBUTO
```
insert into ATRIBUTO(id_atributo,tipo)
	values
		(10,'Força'),
		(20,'Destreza'),
		(30,'Constituição'),
		(40,'Inteligência'),
		(50,'Carisma'),
		(60,'Sabedoria');
```
* Inserção de dados na tabela PERSONAGEM
```
insert into PERSONAGEM(id_perso,nome,usuario,jogo)
	values
		(1010,'Thanos',1002,111),
		(2010,'Legolas',1003,333),
		(1020,'Valzer',1002,333),
		(3010,'Eldon',1001,111);
```
* Inserção de dados na tabela ITENS
```
insert into ITENS(id_item,nome,dano,descricao,efeito,tipo)
	values
		(1100,'Pedra',1,'Comum',null,'Impactante'),
		(1200,'Faca cega',3,'Comum',null,'Cortante'),
		(3100,'Lança dos deuses',67,'Lendário','Força dos Deuses','Perfurante'),
		(2100,'Espada',5,'Raro','Sangramento','Cortante'),
		(2200,'Machadão',7,'Raro','Força+1','Cortante');
```
* Inserção de dados na tabela Perso_Atr
```
insert into perso_atr(id_combi,id_per,id_atr,dice,multiplier)
	values 
		(101010,1010,10,15,2),
		(202010,2010,20,16,3),
		(301010,1010,30,14,2),
		(403010,3010,40,16,3),
		(501020,1020,50,11,0),
		(601020,1020,60,11,0);
```
* Inserção de dados na tabela Itens_Perso
```
insert into itens_perso(id_equip,item,perso)
	values
		(20102100,2100,2010),
		(30103100,3100,3010),
		(10101100,1100,1010),
		(10102200,2200,1010);
```
### 9	TABELAS E PRINCIPAIS CONSULTAS<br>
    OBS: Incluir para cada tópico as instruções SQL + imagens (print da tela) mostrando os resultados.<br>
[Link para o ambiente do Google Colab do projeto](https://colab.research.google.com/drive/1h9Dek4GUZFEOuALbTIVmSF-0kAyYo9-j?usp=sharing?raw=true "Google Colab Projeto Nikaido")
#### 9.1	CONSULTAS DAS TABELAS COM TODOS OS DADOS INSERIDOS (Todas) <br>
* SELECT da tabela USUARIO
![Alt text](https://github.com/Emanueluz/Template_Trab_BD1_2020/blob/master/images/selectUsuario.png?raw=true "select * from USUARIO")
* SELECT da tabela MESA
![Alt text](https://github.com/Emanueluz/Template_Trab_BD1_2020/blob/master/images/selectMesa.png?raw=true "select * from MESA")
* SELECT da tabela JOGO
![Alt text](https://github.com/Emanueluz/Template_Trab_BD1_2020/blob/master/images/selectJogo.png?raw=true "select * from JOGO")
* SELECT da tabela ATRIBUTO
![Alt text](https://github.com/Emanueluz/Template_Trab_BD1_2020/blob/master/images/selectAtributo.png?raw=true "select * from ATRIBUTO")
* SELECT da tabela PERSONAGEM
![Alt text](https://github.com/Emanueluz/Template_Trab_BD1_2020/blob/master/images/selectPersonagem.png?raw=true "select * from PERSONAGEM")
* SELECT da tabela ITENS
![Alt text](https://github.com/Emanueluz/Template_Trab_BD1_2020/blob/master/images/selectItens.png?raw=true "select * from ITENS")
* SELECT da tabela Perso_Atr
![Alt text](https://github.com/Emanueluz/Template_Trab_BD1_2020/blob/master/images/selectPersoAtr.png?raw=true "select * from Perso_Atr")
* SELECT da tabela Itens_Perso
![Alt text](https://github.com/Emanueluz/Template_Trab_BD1_2020/blob/master/images/selectItensPerso.png?raw=true "select * from Itens_Perso")

># Marco de Entrega 01: Do item 1 até o item 9.1<br>

#### 9.2	CONSULTAS DAS TABELAS COM FILTROS WHERE (Mínimo 4)<br>
#### 9.3	CONSULTAS QUE USAM OPERADORES LÓGICOS, ARITMÉTICOS E TABELAS OU CAMPOS RENOMEADOS (Mínimo 11)
    a) Criar 5 consultas que envolvam os operadores lógicos AND, OR e Not
    b) Criar no mínimo 3 consultas com operadores aritméticos 
    c) Criar no mínimo 3 consultas com operação de renomear nomes de campos ou tabelas

#### 9.4	CONSULTAS QUE USAM OPERADORES LIKE E DATAS (Mínimo 12) <br>
    a) Criar outras 5 consultas que envolvam like ou ilike
    b) Criar uma consulta para cada tipo de função data apresentada.

#### 9.5	INSTRUÇÕES APLICANDO ATUALIZAÇÃO E EXCLUSÃO DE DADOS (Mínimo 6)<br>
    a) Criar minimo 3 de exclusão
    b) Criar minimo 3 de atualização

#### 9.6	CONSULTAS COM INNER JOIN E ORDER BY (Mínimo 6)<br>
    a) Uma junção que envolva todas as tabelas possuindo no mínimo 2 registros no resultado
    b) Outras junções que o grupo considere como sendo as de principal importância para o trabalho

#### 9.7	CONSULTAS COM GROUP BY E FUNÇÕES DE AGRUPAMENTO (Mínimo 6)<br>
    a) Criar minimo 2 envolvendo algum tipo de junção

#### 9.8	CONSULTAS COM LEFT, RIGHT E FULL JOIN (Mínimo 4)<br>
    a) Criar minimo 1 de cada tipo

#### 9.9	CONSULTAS COM SELF JOIN E VIEW (Mínimo 6)<br>
        a) Uma junção que envolva Self Join (caso não ocorra na base justificar e substituir por uma view)
        b) Outras junções com views que o grupo considere como sendo de relevante importância para o trabalho

#### 9.10	SUBCONSULTAS (Mínimo 4)<br>
     a) Criar minimo 1 envolvendo GROUP BY
     b) Criar minimo 1 envolvendo algum tipo de junção

># Marco de Entrega 02: Do item 9.2 até o ítem 9.10<br>

### 10 RELATÓRIOS E GRÁFICOS

#### a) análises e resultados provenientes do banco de dados desenvolvido (usar modelo disponível)
#### b) link com exemplo de relatórios será disponiblizado pelo professor no AVA
#### OBS: Esta é uma atividade de grande relevância no contexto do trabalho. Mantenha o foco nos 5 principais relatórios/resultados visando obter o melhor resultado possível.

    

### 11	AJUSTES DA DOCUMENTAÇÃO, CRIAÇÃO DOS SLIDES E VÍDEO PARA APRESENTAÇAO FINAL <br>

#### a) Modelo (pecha kucha)<br>
#### b) Tempo de apresentação 6:40 

># Marco de Entrega 03: Itens 10 e 11<br>
<br>
<br>
<br> 



### 12 FORMATACAO NO GIT:<br> 
https://help.github.com/articles/basic-writing-and-formatting-syntax/
<comentario no git>
    
##### About Formatting
    https://help.github.com/articles/about-writing-and-formatting-on-github/
    
##### Basic Formatting in Git
    
    https://help.github.com/articles/basic-writing-and-formatting-syntax/#referencing-issues-and-pull-requests
    
    
##### Working with advanced formatting
    https://help.github.com/articles/working-with-advanced-formatting/
#### Mastering Markdown
    https://guides.github.com/features/mastering-markdown/

    
### OBSERVAÇÕES IMPORTANTES

#### Todos os arquivos que fazem parte do projeto (Imagens, pdfs, arquivos fonte, etc..), devem estar presentes no GIT. Os arquivos do projeto vigente não devem ser armazenados em quaisquer outras plataformas.
1. <strong>Caso existam arquivos com conteúdos sigilosos<strong>, comunicar o professor que definirá em conjunto com o grupo a melhor forma de armazenamento do arquivo.

#### Todos os grupos deverão fazer Fork deste repositório e dar permissões administrativas ao usuário do git "profmoisesomena", para acompanhamento do trabalho.

#### Os usuários criados no GIT devem possuir o nome de identificação do aluno (não serão aceitos nomes como Eu123, meuprojeto, pro456, etc). Em caso de dúvida comunicar o professor.


Link para BrModelo:<br>
http://www.sis4.com/brModelo/download.html
<br>


Link para curso de GIT<br>
![https://www.youtube.com/curso_git](https://www.youtube.com/playlist?list=PLo7sFyCeiGUdIyEmHdfbuD2eR4XPDqnN2?raw=true "Title")


