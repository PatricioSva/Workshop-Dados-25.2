Create table cliente(
	id_cliente int primary key
    auto_increment,
	nome varchar(100) not null,
    cpf char(11) not null unique,
    endereco varchar(150),
    telefone varchar(100),
    data_cadastro date not null
    )engine=InnoDB;
    
    create table funcionario(
		id_funcionario int primary key
        auto_increment,
        nome varchar(100) not null,
        cpf char(11) not null unique,
        cargo varchar(50) not null,
        telefone varchar(15),
        email varchar(100),
        data_admissao date not null
        )engine=InnoDB;
        
        create table veiculo(
			id_veiculo int primary key
            auto_increment,
            placa varchar(10) not null unique,
            modelo varchar(50) not null,
            cor varchar(30),
            ano_fabricacao int,
            valor_diaria decimal(10,2) not null,
				status
			enum('disponível','alugado','manutencao') default 'disponível'
		)engine=InnoDB;
        
        create table aluguel(
			id_aluguel int auto_increment
            primary key,
            id_cliente int not null,
            id_funcionario int not null,
            id_veiculo int not null,
            data_inicio date not null,
            data_fim date not null,
            valor_total decimal(10,2) not null,
				status
			enum('ativo','finalizado','atrasado')
            default 'ativo',
				constraint fk_aluguel_cliente
			foreign key (id_cliente)
				references cliente(id_cliente)
                on update cascade
                on delete restrict,
			constraint fk_aluguel_funcionario
		foreign key(id_funcionario)
			references veiculo(id_veiculo)
            on update cascade
            on delete restrict
            )engine=innodb;
            
            create table pagamento(
				id_pagamento int auto_increment
                primary key,
                id_aluguel int not null unique,
                valor decimal(10,2) not null,
                date_pagamento date not null,
                metodo
			enum('cartao','pix','boleto') not null,
				status
			enum('pendente','concluido','cancelado')default 'pendente',
				constraint fk_pagamento_aluguel
			foreign key(id_aluguel)
				references aluguel(id_aluguel)
                on update cascade
                on delete cascade
			) engine=InnoDB;
            
            create table manutencao (
				id_manutencao int auto_increment
                primary key,
					id_veiculo int not null,
                    descricao varchar(260) not null,
                    custo decimal(10,2),
                    data_manutencao date not null,
                    responsavel varchar(100),
                    constraint fk_manutencao_veiculo
				foreign key(id_veiculo)
					references veiculo(id_veiculo)
                    on update cascade
                    on delete cascade
				)engine=InnoDB
				