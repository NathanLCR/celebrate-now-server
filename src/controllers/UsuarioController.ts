import { FastifyInstance } from 'fastify'
import { Usuario, UsuarioSchema, criarUsuario, obterTodosUsuarios, obterUsuarioPorId } from '../models/Usuario';
import { z } from 'zod';

export async function usuarioController(app: FastifyInstance) {
  app.post('/usuario', async(request, reply) => {
    try {
      const usuario: Usuario = UsuarioSchema.parse(request.body);
      const novoUsuario = await criarUsuario(usuario);
      return novoUsuario;
    } catch (error) {
      console.error('Erro ao criar usuário:', error);
      return reply.status(500).send({ message: 'Erro ao criar usuário' });
    }
  })
  app.get('/usuario/:id', async(request, reply) => {
    try {
      const paramsSchema = z.object({
        id: z.string()
      })
      const { id } = paramsSchema.parse(request.params);
      const usuario = await obterUsuarioPorId(Number(id));
      if (!usuario) {
        return reply.status(404).send({ message: 'Usuário não encontrado' });
      }
      return usuario;
    } catch (error) {
      console.error('Erro ao obter usuário:', error);
      return reply.status(500).send({ message: 'Erro ao obter usuário' });
    }
  })
  app.get('/usuario', async(request, reply) => {
    try {
      const usuarios = await obterTodosUsuarios();
      return usuarios;
    } catch (error) {
      console.error('Erro ao obter usuários:', error);
      return reply.status(500).send({ message: 'Erro ao obter usuários' });
    }
  })
}
