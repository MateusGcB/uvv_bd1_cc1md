--
-- Apaga o Banco De Dados Caso Existir
--


DROP DATABASE 	IF EXISTS 	uvv;


--
--  Cria o User e Apaga Caso Existir
--


DROP USER 	IF EXISTS 	mateus;
CREATE USER 			mateus 
				WITH 	CREATEDB 
					CREATEROLE
					ENCRYPTED PASSWORD 'aaa'
				;



--
--  Cria o Banco De Dados
--


CREATE DATABASE 	uvv
			WITH   OWNER = mateus 
				 TEMPLATE = template0 
				 ENCODING = UTF8 
				 LC_COLLATE = 'pt_BR.UTF-8' 
				 LC_CTYPE = 'pt_BR.UTF-8' 
				 ALLOW_CONNECTIONS = true
			;


/* Comenta o database uvv */


COMMENT ON DATABASE 	uvv		IS 'Banco de dados da uvv'; 


--
-- Usa o banco de dados
--

\setenv PGPASSWORD aaa
\c uvv mateus 



--
--  Cria a Esquema 
--


CREATE SCHEMA 		lojas;


/* Comentario do Esquema */


COMMENT ON SCHEMA 	lojas		    IS 'Esquema do banco de dados UVV';


--
--  Adicionar o Dono Do Esquema e muda o esquema atual
--


ALTER SCHEMA 		lojas	            OWNER                      TO 	mateus;

SET SEARCH_PATH 	TO 	lojas, "$user", public;

ALTER ROLE mateus 	SET 	SEARCH_PATH 	TO 	lojas, "$user", public;


--
--  Cria a Tabela Produtos e sua respectiva chave primaria
--


CREATE TABLE produtos (
                produto_id 					NUMERIC(38) 		NOT NULL,
                nome 						VARCHAR(255) 		NOT NULL,
                preco_unitario 					NUMERIC(102) 		NOT NULL,
                detalhes 					BYTEA,
                imagem 						BYTEA,
                imagem_mime_type 				VARCHAR(512),
                imagem_arquivo 					VARCHAR(512),
                imagem_charset 					VARCHAR(512),
                imagem_ultima_atualizacao 			DATE,
                
                CONSTRAINT pk_produto_id 			PRIMARY KEY 		(produto_id)
);


/* Cria os Comentarios da Tabela produtos */


COMMENT ON TABLE 		produtos 				IS 'Conjunto de informaçoes dos produtos registrados.
									Contem: id do produto, nome, preço unitario, detalhes, imagem, tipo de arquivo da imagem, arquivo da imagem, charset 										da imagem e a ultima atualizaçao da tabela .
									Possui como PK o id do produto.';


COMMENT ON COLUMN 		produtos.produto_id 			IS 'Armazenamento do id do produto.
									PK da tabela produtos.
									Preenchimento  obrigatorio.
									Até 38 caracteres.';


COMMENT ON COLUMN 		produtos.nome 				IS 'Armazenamento do nome do produto.
									Preenchimento  obrigatorio.
									Até 255 caracteres.';


COMMENT ON COLUMN 		produtos.preco_unitario 		IS 'Armazenamento do preço unitario do produto.
									Preenchimento  obrigatorio.
									Até 102 caracteres.';


COMMENT ON COLUMN 		produtos.detalhes 			IS 'Armazenamento dos detalhes do produto.';


COMMENT ON COLUMN 		produtos.imagem 			IS 'Armazenamento da imagem do produto.';


COMMENT ON COLUMN 		produtos.imagem_mime_type 		IS 'Armazenamento do tipo de arquivo da imagem do produto. 
									Preenchimento não obrigatorio.
									Até 512 caracteres.';


COMMENT ON COLUMN 		produtos.imagem_arquivo 		IS 'Armazenamento do arquivo da imagem do produto. 
									Preenchimento não obrigatorio.
									Até 512 caracteres.';


COMMENT ON COLUMN 		produtos.imagem_charset 		IS 'Armazenamento do charset da imagem do produto. 
									Preenchimento não obrigatorio.
									Até 512 caracteres.';


COMMENT ON COLUMN 		produtos.imagem_ultima_atualizacao 	IS 'Armazenamento da ultima data de atualização dos prodrutos cadastrados. 
									Preenchimento não obrigatorio.';


--
--  Cria a Tabela Lojas e sua respectiva chave primaria
--


CREATE TABLE lojas (
                loja_id 					NUMERIC(38) 		NOT NULL,
                nome 						VARCHAR(255) 		NOT NULL,
                endereco_web 					VARCHAR(100),
                endereco_fisico 				VARCHAR(512),
                latitude 					NUMERIC,
                longitude 					NUMERIC,
                logo 						BYTEA,
                logo_mime_type 					VARCHAR(512),
                logo_arquivo 					VARCHAR(512),
                logo_charset 					VARCHAR(512),
                logo_ultima_atualizacao 			DATE,
                
                CONSTRAINT pk_loja_id 				PRIMARY KEY 		(loja_id)
);


/* Cria os Comentarios da Tabela lojas */


COMMENT ON TABLE 		lojas 					IS 'Conjunto de informaçoes das lojas registradas.
									Contem: id da loja, nome, endereço web, endereço fisico, latitude, longitude, logo, tipo de arquivo da logo, arquivo 										da logo, charset da logo e a ultima atualizaçao da tabela .
									Possui como PK o id da loja.';


COMMENT ON COLUMN 		lojas.loja_id 				IS 'Armazenamento do id da loja cadastrada. 
									PK da tabela lojas.
									Preenchimento obrigatorio.
									Até 38 caracteres.';


COMMENT ON COLUMN 		lojas.nome 				IS 'Armazenamento do nome da loja cadastrada. 
									Preenchimento obrigatorio.
									Até 255 caracteres.';


COMMENT ON COLUMN 		lojas.endereco_web 			IS 'Armazenamento do endereco web da loja cadastrada. 
									Preenchimento não obrigatorio.
									Até 100 caracteres.';


COMMENT ON COLUMN 		lojas.endereco_fisico 			IS 'Armazenamento do endereço fisico da loja cadastrada. 
									Preenchimento não obrigatorio.
									Até 512 caracteres.';


COMMENT ON COLUMN 		lojas.latitude 				IS 'Armazenamento da latitude geografica da loja cadastrada. 
									Preenchimento não obrigatorio.';


COMMENT ON COLUMN 		lojas.longitude 			IS 'Armazenamento da longitude geografica da loja cadastrada. 
									Preenchimento não obrigatorio.';


COMMENT ON COLUMN 		lojas.logo 				IS 'Armazenamento da logo da loja cadastrada. 
									Preenchimento não obrigatorio.';


COMMENT ON COLUMN 		lojas.logo_mime_type 			IS 'Armazenamento do tipo de arquivo da logo da loja cadastrada. 
									Preenchimento não obrigatorio.
									Até 512 caracteres.';


COMMENT ON COLUMN 		lojas.logo_arquivo 			IS 'Armazenamento do arquivo da logo da loja cadastrada. 
									Preenchimento não obrigatorio.
									Até 512 caracteres.';


COMMENT ON COLUMN 		lojas.logo_charset 			IS 'Armazenamento do charset da logo da loja cadastrada. 
									Preenchimento não obrigatorio.
									Até 512 caracteres.';


COMMENT ON COLUMN 		lojas.logo_ultima_atualizacao 		IS 'Armazenamento da ultima data de atualização da loja cadastrada. 
									Preenchimento não obrigatorio.';


--
--  Cria a Tabela Estoques e sua respectiva chave primaria
--


CREATE TABLE estoques (
                estoque_id 				NUMERIC(38) 		NOT NULL,
                loja_id 				NUMERIC(38) 		NOT NULL,
                produto_id 				NUMERIC(38) 		NOT NULL,
                quantidade 				NUMERIC(38) 		NOT NULL,
                
                CONSTRAINT pk_estoque_id 		PRIMARY KEY 		(estoque_id, loja_id)
);


/* Cria os Comentarios da Tabela estoques */


COMMENT ON TABLE 		estoques 				IS 'Conjunto de informaçoes de estoques registrados.
									Contem: id do estoque, id da loja, id do produto e quantidade.
									Possui como PK o id do estoque.
									Possui FK da tabela produtos.
									Possui PFK entre as tabelas lojas e estoques.';


COMMENT ON COLUMN 		estoques.estoque_id 			IS 'Armazenamento do id do estoque cadastrado. 
									PK da tabela estoque.
									Preenchimento obrigatorio.
									Até 38 caracteres.';


COMMENT ON COLUMN 		estoques.loja_id 			IS 'Armazenamento do id da loja cadastrada. 
									PFK entre as tabelas estoques e lojas.
									Preenchimento obrigatorio.
									Até 38 caracteres.';


COMMENT ON COLUMN 		estoques.produto_id 			IS 'Armazenamento do id do produto.
									FK da tabela produtos.
									Preenchimento  obrigatorio.
									Até 38 caracteres.';


COMMENT ON COLUMN 		estoques.quantidade 			IS 'Armazenamento do quantidade no estoque.
									Preenchimento  obrigatorio.
									Até 38 caracteres.';


--
-- Cria a Tabela Clientes e sua respectiva chave primaria
--


CREATE TABLE clientes (
                cliente_id 			NUMERIC(38)		 NOT NULL,
                email 				VARCHAR(255)		 NOT NULL,
                nome 				VARCHAR(255)		 NOT NULL,
                telefone1 			VARCHAR(20),
                telefone2 			VARCHAR(20),
                telefone3 			VARCHAR(20),
                
                CONSTRAINT pk_cliente_id 	PRIMARY KEY 		(cliente_id)
);


/* Cria os Comentarios da Tabela clientes */


COMMENT ON TABLE 		clientes 				IS 'Conjunto de informaçoes de clientes registrados.
									Contem: id do cliente, email, nome, telefone1, telefone2 e telefone3.
									Possui como PK o id do cliente.';


COMMENT ON COLUMN 		clientes.cliente_id 			IS 'Id do cliente cadastrado.
									PK da tabela clientes.
									Até 38 caracteres.
									Preenchimento obrigatorio.';


COMMENT ON COLUMN 		clientes.email 				IS 'Armazenamento do Email do cliente cadastrado. Preenchimento obrigatorio.
									Até 255 caracteres.';


COMMENT ON COLUMN 		clientes.nome 				IS 'Armazenamento do nome do cliente cadastrado. Preenchimento obrigatorio.
									Até 255 caracteres.';


COMMENT ON COLUMN 		clientes.telefone1 			IS 'Armazenamento do primeiro telefone do cliente cadastrado.
									Preenchimento não obrigatorio.
									Até 20 caracteres.';


COMMENT ON COLUMN 		clientes.telefone2 			IS 'Armazenamento do segundo telefone do cliente cadastrado.
									Preenchimento não obrigatorio.
									Até 20 caracteres.';


COMMENT ON COLUMN 		clientes.telefone3 			IS 'Armazenamento do terceiro telefone do cliente cadastrado.
									Preenchimento não obrigatorio.
									Até 20 caracteres.';


--
--  Cria a Tabela Envios e sua respectiva chave primaria
--


CREATE TABLE envios (
                envio_id 			NUMERIC(38) 		NOT NULL,
                loja_id 			NUMERIC(38)		NOT NULL,
                cliente_id 			NUMERIC(38) 		NOT NULL,
                endereco_entrega		VARCHAR(512)		NOT NULL,
                status 				VARCHAR(15)		NOT NULL,
                
                CONSTRAINT pk_envio_id 		PRIMARY KEY 		(envio_id)
);


/* Cria os Comentarios da Tabela envios */


COMMENT ON TABLE 		envios 					IS 'Conjunto de informaçoes de envios registrados.
									Contem: id do envio, id da loja, id do cliente, endereço de entrega e status.
									Possui como PK o id do envio.
									Possui FKs das tabelas: lojas e clientes';


COMMENT ON COLUMN 		envios.envio_id 			IS 'Armazenamento do id do envio.
									PK da tabela envios.
									Preenchimento  obrigatorio.
									Até 38 caracteres.';


COMMENT ON COLUMN 		envios.loja_id 				IS 'Armazenamento do id da loja que realizou o envio.
									FK da tabela lojas.
									Preenchimento  obrigatorio.
									Até 38 caracteres.';


COMMENT ON COLUMN 		envios.cliente_id 			IS 'Armazenamento do id do cliente para o envio.
									FK da tabela clientes.
									Preenchimento  obrigatorio.
									Até 38 caracteres.';


COMMENT ON COLUMN 		envios.endereco_entrega 		IS 'Armazenamento do endereço de entrega do envio.
									Preenchimento  obrigatorio.
									Até 512 caracteres.';


COMMENT ON COLUMN 		envios.status 				IS 'Armazenamento do status do envio.
									Preenchimento  obrigatorio.
									Até 15 caracteres.';


--
--  Cria a Tabela Pedidos e sua respectiva chave primaria
--


CREATE TABLE pedidos (
                pedido_id 		NUMERIC(38) 		NOT NULL,
                data_hora 		TIMESTAMP 		NOT NULL,
                cliente_id 		NUMERIC(38) 		NOT NULL,
                status 			VARCHAR(15)	 	NOT NULL,
                loja_id 		NUMERIC(38) 		NOT NULL,
                
                CONSTRAINT pk_pedido_id PRIMARY KEY 		(pedido_id)
);


/* Cria os Comentarios da Tabela pedidos */


COMMENT ON TABLE 		pedidos 				IS 'Conjunto de informaçoes de pedidos registrados.
									Contem: id do pedido, data e hora do pedido, id do cliente, status e id da loja.
									Possui como PK o id do pedido.
									Possui FKs das tabelas: lojas e clientes';


COMMENT ON COLUMN 		pedidos.pedido_id 			IS 'Armazenamento do id do pedido.
									PK da tabela pedidos.
									Preenchimento  obrigatorio.
									Até 38 caracteres.';


COMMENT ON COLUMN 		pedidos.data_hora 			IS 'Armazenamento da data e hora do pedido.
									Preenchimento  obrigatorio.';


COMMENT ON COLUMN 		pedidos.cliente_id 			IS 'Armazenamento do id do cliente que realizou o pedido.
									FK da tabela clientes.
									Preenchimento  obrigatorio.
									Até 38 caracteres.';


COMMENT ON COLUMN 		pedidos.status 				IS 'Armazenamento do status do pedido.
									Preenchimento  obrigatorio.
									Até 15 caracteres.';


COMMENT ON COLUMN 		pedidos.loja_id 			IS 'Armazenamento do id da loja que realizou o pedido.
									FK da tabela lojas.
									Preenchimento  obrigatorio.
									Até 38 caracteres.';


--
--  Cria a Tabela Pedidos Itens e sua respectiva chave primaria
--


CREATE TABLE pedidos_itens (
                pedido_id 			NUMERIC(38) 		NOT NULL,
                produto_id 			NUMERIC(38) 		NOT NULL,
                numero_da_linha 		NUMERIC(38) 		NOT NULL,
                preco_unitario 			NUMERIC(102) 		NOT NULL,
                quantidade 			NUMERIC(38) 		NOT NULL,
                envio_id 			NUMERIC(38),
                
                CONSTRAINT pk_pedidos_itens 	PRIMARY KEY 		(pedido_id, produto_id)
);


/* Cria os Comentarios da Tabela pedidos_itens */


COMMENT ON TABLE 		pedidos_itens 				IS 'Conjunto de informaçoes de pedido_itens registrados.
									Contem: id do pedido, id do produto, numero da linha, preço unitario, quantidade e id do envio.
									Possui FK da tabela envios.
									Possui PFKs entre as tabelas: 
									produtos e pedido_itens.
									pedido e pedido_itens.';


COMMENT ON COLUMN 		pedidos_itens.pedido_id 		IS 'Armazenamento do id do pedido cadastrado. 
									PFK entre as tabelas pedidos e pedido_itens.
									Preenchimento obrigatorio.
									Até 38 caracteres.';


COMMENT ON COLUMN 		pedidos_itens.produto_id 		IS 'Armazenamento do id do produto cadastrado. 
									PFK entre as tabelas produtos e pedido_itens.
									Preenchimento obrigatorio.
									Até 38 caracteres.';


COMMENT ON COLUMN 		pedidos_itens.numero_da_linha 		IS 'Armazenamento do numero de linha do item pedido.
									Preenchimento  obrigatorio.
									Até 38 caracteres.';


COMMENT ON COLUMN 		pedidos_itens.preco_unitario 		IS 'Armazenamento do preço unitario do item pedido.
									Preenchimento  obrigatorio.
									Até 102 caracteres.';


COMMENT ON COLUMN		pedidos_itens.quantidade 		IS 'Armazenamento da quantidade do item pedido.
									Preenchimento  obrigatorio.
									Até 38 caracteres.';


COMMENT ON COLUMN 		pedidos_itens.envio_id 			IS 'Armazenamento do id do envio.
									FK da tabela envios.
									Preenchimento  obrigatorio.
									Até 38 caracteres.';




--
--  Cria as Chaves Primarias E Estrangeiras
--






ALTER TABLE pedidos_itens 	ADD CONSTRAINT 	produtos_pedidos_itens_fk
								FOREIGN KEY 			(produto_id)
								REFERENCES 			produtos (produto_id)
								ON DELETE NO ACTION
								ON UPDATE NO ACTION
								NOT DEFERRABLE;


ALTER TABLE estoques 		ADD CONSTRAINT 	produtos_estoques_fk
								FOREIGN KEY 			(produto_id)
								REFERENCES 			produtos (produto_id)
								ON DELETE NO ACTION
								ON UPDATE NO ACTION
								NOT DEFERRABLE;


ALTER TABLE envios 		ADD CONSTRAINT 	lojas_envios_fk
								FOREIGN KEY 			(loja_id)
								REFERENCES 			lojas (loja_id)
								ON DELETE NO ACTION
								ON UPDATE NO ACTION
								NOT DEFERRABLE;


ALTER TABLE estoques 		ADD CONSTRAINT 	lojas_estoques_fk
								FOREIGN KEY 			(loja_id)
								REFERENCES 			lojas (loja_id)
								ON DELETE NO ACTION
								ON UPDATE NO ACTION
								NOT DEFERRABLE;


ALTER TABLE pedidos 		ADD CONSTRAINT 	lojas_pedidos_fk
								FOREIGN KEY 			(loja_id)
								REFERENCES 			lojas (loja_id)
								ON DELETE NO ACTION
								ON UPDATE NO ACTION
								NOT DEFERRABLE;


ALTER TABLE pedidos 		ADD CONSTRAINT 	clientes_pedidos_fk
								FOREIGN KEY 			(cliente_id)
								REFERENCES 			clientes (cliente_id)
								ON DELETE NO ACTION
								ON UPDATE NO ACTION
								NOT DEFERRABLE;


ALTER TABLE envios 		ADD CONSTRAINT 	clientes_envios_fk
								FOREIGN KEY			(cliente_id)
								REFERENCES 			clientes (cliente_id)
								ON DELETE NO ACTION
								ON UPDATE NO ACTION
								NOT DEFERRABLE;


ALTER TABLE pedidos_itens 	ADD CONSTRAINT 	envios_pedidos_itens_fk
								FOREIGN KEY 			(envio_id)
								REFERENCES 			envios (envio_id)
								ON DELETE NO ACTION
								ON UPDATE NO ACTION
								NOT DEFERRABLE;


ALTER TABLE pedidos_itens 	ADD CONSTRAINT 	pedidos_pedidos_itens_fk
								FOREIGN KEY 			(pedido_id)
								REFERENCES 			pedidos (pedido_id)
								ON DELETE NO ACTION
								ON UPDATE NO ACTION
								NOT DEFERRABLE;




--
--  Checagem da inserção de dados
--


ALTER TABLE estoques    	ADD CONSTRAINT quantidade_check 		CHECK  ( quantidade > 0 );


ALTER TABLE produtos    	ADD CONSTRAINT preco_unitario_check 		CHECK  ( preco_unitario > 0  );


ALTER TABLE pedidos_itens 	ADD CONSTRAINT preco_unitario_check		CHECK  ( preco_unitario > 0  );


ALTER TABLE pedidos  		ADD CONSTRAINT status_check  			CHECK  (status IN ( 'CANCELADO', 'COMPLETO', 'ABERTO', 'PAGO', 'REEMBOLSADO', 'ENVIADO' ));


ALTER TABLE envios 		ADD CONSTRAINT status_check 			CHECK  ( status IN ('CRIADO', 'ENVIADO', 'TRANSITO', 'ENTREGUE' ));


ALTER TABLE lojas 		ADD CONSTRAINT endereço_necessario 		CHECK  (COALESCE(endereco_web, endereco_fisico) IS NOT NULL); 



--
--  Inserções De Dados
--











