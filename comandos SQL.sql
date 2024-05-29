CREATE DATABASE LojaDeProdutos;

USE LojaDeProdutos;

CREATE TABLE Categoria (
    CategoriaID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Descrição VARCHAR(255)
);

CREATE TABLE Fornecedor (
    FornecedorID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Endereço VARCHAR(255),
    Telefone VARCHAR(20)
);

CREATE TABLE Produto (
    ProdutoID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Descrição TEXT,
    Preço DECIMAL(10, 2),
    Estoque INT,
    CategoriaID INT,
    FornecedorID INT,
    FOREIGN KEY (CategoriaID) REFERENCES Categoria(CategoriaID),
    FOREIGN KEY (FornecedorID) REFERENCES Fornecedor(FornecedorID)
);


INSERT INTO Categoria (Nome, Descrição) VALUES ('Eletrônicos', 'Dispositivos eletrônicos');
INSERT INTO Fornecedor (Nome, Email, Endereço, Telefone) VALUES ('Fornecedor A', 'contato@fornecedorA.com', 'Rua A, 123', '123456789');
INSERT INTO Produto (Nome, Descrição, Preço, Estoque, CategoriaID, FornecedorID) VALUES ('Smartphone XYZ', 'Smartphone com tela de 6.5 polegadas', 1500.00, 100, 1, 1);

LOAD DATA INFILE 'caminho/para/seu/produto.csv'INTO TABLE Produto
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;
(Nome, Descrição, Preço, Estoque, CategoriaID, FornecedorID);


