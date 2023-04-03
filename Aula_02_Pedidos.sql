CREATE DATABASE Pedidos_Pecas;
USE Pedidos_Pecas;

CREATE TABLE Cliente(
    codCliente INT NOT NULL,
    nomeCliente VARCHAR(100) NOT NULL,

    CONSTRAINT PK_Cliente PRIMARY KEY (codCliente)
);

CREATE TABLE Pedido(
    noPedido INT NOT NULL,
    dataPedido DATETIME NOT NULL,
    codCliente INT NOT NULL,

    CONSTRAINT PK_Pedido PRIMARY KEY (noPedido),
    CONSTRAINT FK_Pedido_Cliente FOREIGN KEY (codCliente) REFERENCES Cliente(codCliente)
);

CREATE TABLE Pedido_Telefone(
    noPedido INT NOT NULL,
    noTelefone VARCHAR(15) NOT NULL,

    CONSTRAINT PK_Pedido_Telefone PRIMARY KEY (noPedido, noTelefone),
    CONSTRAINT FK_Pedido_Telefone_Pedido FOREIGN KEY (noPedido) REFERENCES Pedido(noPedido)
);

CREATE TABLE Item_Pedido(
    noPedido INT NOT NULL,
    codPeca INT NOT NULL,
    qtdPeca INT NOT NULL,

    CONSTRAINT PK_Item_Pedido PRIMARY KEY (noPedido),
    CONSTRAINT UN_Item_Pedido UNIQUE (codPeca),
    CONSTRAINT FK_Item_Pedido_Pedido FOREIGN KEY (noPedido) REFERENCES Pedido(noPedido)
);

CREATE TABLE Peca(
    codPeca INT NOT NULL,
    descPeca CHAR NOT NULL,

    CONSTRAINT PK_Peca PRIMARY KEY (codPeca),
    CONSTRAINT FK_Peca_Item_Pedido FOREIGN KEY (codPeca) REFERENCES Item_Pedido(codPeca)
);

