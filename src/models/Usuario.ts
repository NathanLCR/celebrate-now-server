import { Usuario as UsuarioModel } from '@prisma/client';
import { prisma } from '../lib/prisma'
import { z } from 'zod';

export interface Usuario extends Omit<UsuarioModel, 'id'> {
  id?: number
}

export const UsuarioSchema = z.object({
  id: z.number().optional(),
  nome: z.string(),
  email: z.string().email(),
  senha: z.string(),
})

export const criarUsuario = async (usuario: Usuario): Promise<Usuario> => {
  return prisma.usuario.create({ data: usuario });
};

export const obterUsuarioPorId = async (id: number): Promise<Usuario | null> => {
  return prisma.usuario.findUnique({ where: { id } });
};

export const obterTodosUsuarios = async (): Promise<Usuario[] | null> => {
  return prisma.usuario.findMany();
};