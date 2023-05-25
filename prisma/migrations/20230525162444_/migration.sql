/*
  Warnings:

  - You are about to drop the column `altura` on the `Usuario` table. All the data in the column will be lost.
  - You are about to drop the column `idade` on the `Usuario` table. All the data in the column will be lost.
  - You are about to drop the column `objetivos` on the `Usuario` table. All the data in the column will be lost.
  - You are about to drop the column `peso` on the `Usuario` table. All the data in the column will be lost.
  - You are about to drop the `ComentarioAvaliacao` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Conquista` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Exercicio` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `PlanosTreinoPersonalizado` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RegistrosTreino` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Treino` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_ExercicioToTreino` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "ComentarioAvaliacao" DROP CONSTRAINT "ComentarioAvaliacao_treino_id_fkey";

-- DropForeignKey
ALTER TABLE "ComentarioAvaliacao" DROP CONSTRAINT "ComentarioAvaliacao_usuario_id_fkey";

-- DropForeignKey
ALTER TABLE "Conquista" DROP CONSTRAINT "Conquista_usuario_id_fkey";

-- DropForeignKey
ALTER TABLE "PlanosTreinoPersonalizado" DROP CONSTRAINT "PlanosTreinoPersonalizado_usuario_id_fkey";

-- DropForeignKey
ALTER TABLE "RegistrosTreino" DROP CONSTRAINT "RegistrosTreino_treino_id_fkey";

-- DropForeignKey
ALTER TABLE "RegistrosTreino" DROP CONSTRAINT "RegistrosTreino_usuario_id_fkey";

-- DropForeignKey
ALTER TABLE "_ExercicioToTreino" DROP CONSTRAINT "_ExercicioToTreino_A_fkey";

-- DropForeignKey
ALTER TABLE "_ExercicioToTreino" DROP CONSTRAINT "_ExercicioToTreino_B_fkey";

-- AlterTable
ALTER TABLE "Usuario" DROP COLUMN "altura",
DROP COLUMN "idade",
DROP COLUMN "objetivos",
DROP COLUMN "peso";

-- DropTable
DROP TABLE "ComentarioAvaliacao";

-- DropTable
DROP TABLE "Conquista";

-- DropTable
DROP TABLE "Exercicio";

-- DropTable
DROP TABLE "PlanosTreinoPersonalizado";

-- DropTable
DROP TABLE "RegistrosTreino";

-- DropTable
DROP TABLE "Treino";

-- DropTable
DROP TABLE "_ExercicioToTreino";

-- CreateTable
CREATE TABLE "Evento" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "dataHora" TIMESTAMP(3) NOT NULL,
    "local" TEXT NOT NULL,
    "usuarioId" INTEGER NOT NULL,

    CONSTRAINT "Evento_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Convidado" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "eventoId" INTEGER NOT NULL,

    CONSTRAINT "Convidado_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Tarefa" (
    "id" SERIAL NOT NULL,
    "descricao" TEXT NOT NULL,
    "dataVencimento" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL,
    "eventoId" INTEGER NOT NULL,

    CONSTRAINT "Tarefa_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Despesa" (
    "id" SERIAL NOT NULL,
    "descricao" TEXT NOT NULL,
    "valor" DOUBLE PRECISION NOT NULL,
    "categoria" TEXT NOT NULL,
    "eventoId" INTEGER NOT NULL,

    CONSTRAINT "Despesa_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Presente" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "eventoId" INTEGER NOT NULL,

    CONSTRAINT "Presente_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Evento" ADD CONSTRAINT "Evento_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "Usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Convidado" ADD CONSTRAINT "Convidado_eventoId_fkey" FOREIGN KEY ("eventoId") REFERENCES "Evento"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tarefa" ADD CONSTRAINT "Tarefa_eventoId_fkey" FOREIGN KEY ("eventoId") REFERENCES "Evento"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Despesa" ADD CONSTRAINT "Despesa_eventoId_fkey" FOREIGN KEY ("eventoId") REFERENCES "Evento"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Presente" ADD CONSTRAINT "Presente_eventoId_fkey" FOREIGN KEY ("eventoId") REFERENCES "Evento"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
