CREATE TABLE usuarios (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  senha VARCHAR(100) NOT NULL,
  idade INT,
  altura FLOAT,
  peso FLOAT,
  objetivos VARCHAR(255)
);
CREATE TABLE treinos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  descricao VARCHAR(255),
  duracao INT,
  nivel_dificuldade VARCHAR(50)
);
CREATE TABLE exercicios (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  grupo_muscular VARCHAR(100),
  instrucoes VARCHAR(255),
  imagem_url VARCHAR(255)
);
CREATE TABLE registros_treino (
  id INT PRIMARY KEY AUTO_INCREMENT,
  usuario_id INT NOT NULL,
  treino_id INT NOT NULL,
  peso_utilizado FLOAT,
  repeticoes INT,
  series INT,
  data_treino DATE,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
  FOREIGN KEY (treino_id) REFERENCES treinos(id)
);
CREATE TABLE planos_treino_personalizados (
  id INT PRIMARY KEY AUTO_INCREMENT,
  usuario_id INT NOT NULL,
  nome VARCHAR(100) NOT NULL,
  descricao VARCHAR(255),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);
CREATE TABLE conquistas (
  id INT PRIMARY KEY AUTO_INCREMENT,
  usuario_id INT NOT NULL,
  nome VARCHAR(100) NOT NULL,
  data_conquista DATE,
  nivel_dificuldade VARCHAR(50),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);
CREATE TABLE comentarios_avaliacoes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  usuario_id INT NOT NULL,
  treino_id INT NOT NULL,
  comentario TEXT,
  avaliacao INT,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
  FOREIGN KEY (treino_id) REFERENCES treinos(id)
);
CREATE TABLE comentarios_avaliacoes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  usuario_id INT NOT NULL,
  treino_id INT NOT NULL,
  comentario TEXT,
  avaliacao INT,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
  FOREIGN KEY (treino_id) REFERENCES treinos(id)
);

INSERT INTO exercicios (nome, grupo_muscular, instrucoes, imagem_url) VALUES
('Agachamento', 'Pernas', 'Instruções de Agachamento', 'URL da Imagem'),
('Levantamento Terra', 'Costas e Pernas', 'Instruções de Levantamento Terra', 'URL da Imagem'),
('Supino', 'Peito', 'Instruções de Supino', 'URL da Imagem'),
('Barra Fixa', 'Costas', 'Instruções de Barra Fixa', 'URL da Imagem'),
('Flexão de Braço', 'Peito, Tríceps e Ombros', 'Instruções de Flexão de Braço', 'URL da Imagem'),
('Desenvolvimento de Ombros', 'Ombros', 'Instruções de Desenvolvimento de Ombros', 'URL da Imagem'),
('Remada', 'Costas', 'Instruções de Remada', 'URL da Imagem'),
('Avanço', 'Pernas', 'Instruções de Avanço', 'URL da Imagem'),
('Rosca Direta', 'Braços', 'Instruções de Rosca Direta', 'URL da Imagem'),
('Tríceps Testa', 'Tríceps', 'Instruções de Tríceps Testa', 'URL da Imagem'),
('Abdominal Crunch', 'Abdômen', 'Instruções de Abdominal Crunch', 'URL da Imagem'),
('Prancha', 'Abdômen', 'Instruções de Prancha', 'URL da Imagem'),
('Agachamento Búlgaro', 'Pernas', 'Instruções de Agachamento Búlgaro', 'URL da Imagem'),
('Elevação de Panturrilhas', 'Panturrilhas', 'Instruções de Elevação de Panturrilhas', 'URL da Imagem'),
('Extensão de Quadril', 'Pernas e Glúteos', 'Instruções de Extensão de Quadril', 'URL da Imagem');

INSERT INTO exercicios (nome, grupo_muscular, instrucoes, imagem_url) VALUES
('Agachamento Sumô', 'Pernas', 'Instruções de Agachamento Sumô', 'URL da Imagem'),
('Afundo', 'Pernas', 'Instruções de Afundo', 'URL da Imagem'),
('Crucifixo', 'Peito', 'Instruções de Crucifixo', 'URL da Imagem'),
('Rosca Concentrada', 'Braços', 'Instruções de Rosca Concentrada', 'URL da Imagem'),
('Desenvolvimento Arnold', 'Ombros', 'Instruções de Desenvolvimento Arnold', 'URL da Imagem'),
('Remada Cavalinho', 'Costas', 'Instruções de Remada Cavalinho', 'URL da Imagem'),
('Flexão de Braço Diamond', 'Peito e Tríceps', 'Instruções de Flexão de Braço Diamond', 'URL da Imagem'),
('Prancha Lateral', 'Abdômen e Core', 'Instruções de Prancha Lateral', 'URL da Imagem'),
('Agachamento Frontal', 'Pernas', 'Instruções de Agachamento Frontal', 'URL da Imagem'),
('Panturrilha em Pé', 'Panturrilhas', 'Instruções de Panturrilha em Pé', 'URL da Imagem'),
('Remada Alta', 'Ombros', 'Instruções de Remada Alta', 'URL da Imagem'),
('Abdominal Infra', 'Abdômen', 'Instruções de Abdominal Infra', 'URL da Imagem'),
('Elevação Lateral', 'Ombros', 'Instruções de Elevação Lateral', 'URL da Imagem'),
('Tríceps Corda', 'Tríceps', 'Instruções de Tríceps Corda', 'URL da Imagem'),
('Extensão de Pernas', 'Pernas', 'Instruções de Extensão de Pernas', 'URL da Imagem');
