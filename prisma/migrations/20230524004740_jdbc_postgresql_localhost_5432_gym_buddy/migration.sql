-- CreateTable
CREATE TABLE "Usuario" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "senha" TEXT NOT NULL,
    "idade" INTEGER,
    "altura" DOUBLE PRECISION,
    "peso" DOUBLE PRECISION,
    "objetivos" TEXT,

    CONSTRAINT "Usuario_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Treino" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "descricao" TEXT,
    "duracao" INTEGER,
    "nivel_dificuldade" TEXT,

    CONSTRAINT "Treino_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Exercicio" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "grupo_muscular" TEXT,
    "instrucoes" TEXT,
    "imagem_url" TEXT,

    CONSTRAINT "Exercicio_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RegistrosTreino" (
    "id" SERIAL NOT NULL,
    "usuario_id" INTEGER NOT NULL,
    "treino_id" INTEGER NOT NULL,
    "peso_utilizado" DOUBLE PRECISION,
    "repeticoes" INTEGER,
    "series" INTEGER,
    "data_treino" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RegistrosTreino_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PlanosTreinoPersonalizado" (
    "id" SERIAL NOT NULL,
    "usuario_id" INTEGER NOT NULL,
    "nome" TEXT NOT NULL,
    "descricao" TEXT,

    CONSTRAINT "PlanosTreinoPersonalizado_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Conquista" (
    "id" SERIAL NOT NULL,
    "usuario_id" INTEGER NOT NULL,
    "nome" TEXT NOT NULL,
    "data_conquista" TIMESTAMP(3) NOT NULL,
    "nivel_dificuldade" TEXT,

    CONSTRAINT "Conquista_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ComentarioAvaliacao" (
    "id" SERIAL NOT NULL,
    "usuario_id" INTEGER NOT NULL,
    "treino_id" INTEGER NOT NULL,
    "comentario" TEXT,
    "avaliacao" INTEGER,

    CONSTRAINT "ComentarioAvaliacao_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_ExercicioToTreino" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Usuario_email_key" ON "Usuario"("email");

-- CreateIndex
CREATE UNIQUE INDEX "_ExercicioToTreino_AB_unique" ON "_ExercicioToTreino"("A", "B");

-- CreateIndex
CREATE INDEX "_ExercicioToTreino_B_index" ON "_ExercicioToTreino"("B");

-- AddForeignKey
ALTER TABLE "RegistrosTreino" ADD CONSTRAINT "RegistrosTreino_usuario_id_fkey" FOREIGN KEY ("usuario_id") REFERENCES "Usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RegistrosTreino" ADD CONSTRAINT "RegistrosTreino_treino_id_fkey" FOREIGN KEY ("treino_id") REFERENCES "Treino"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PlanosTreinoPersonalizado" ADD CONSTRAINT "PlanosTreinoPersonalizado_usuario_id_fkey" FOREIGN KEY ("usuario_id") REFERENCES "Usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Conquista" ADD CONSTRAINT "Conquista_usuario_id_fkey" FOREIGN KEY ("usuario_id") REFERENCES "Usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ComentarioAvaliacao" ADD CONSTRAINT "ComentarioAvaliacao_usuario_id_fkey" FOREIGN KEY ("usuario_id") REFERENCES "Usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ComentarioAvaliacao" ADD CONSTRAINT "ComentarioAvaliacao_treino_id_fkey" FOREIGN KEY ("treino_id") REFERENCES "Treino"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ExercicioToTreino" ADD CONSTRAINT "_ExercicioToTreino_A_fkey" FOREIGN KEY ("A") REFERENCES "Exercicio"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ExercicioToTreino" ADD CONSTRAINT "_ExercicioToTreino_B_fkey" FOREIGN KEY ("B") REFERENCES "Treino"("id") ON DELETE CASCADE ON UPDATE CASCADE;
