"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.usuarioController = void 0;
const Usuario_1 = require("../models/Usuario");
const zod_1 = require("zod");
async function usuarioController(app) {
    app.post('/usuario', async (request, reply) => {
        try {
            const usuario = Usuario_1.UsuarioSchema.parse(request.body);
            const novoUsuario = await (0, Usuario_1.criarUsuario)(usuario);
            return novoUsuario;
        }
        catch (error) {
            console.error('Erro ao criar usuário:', error);
            return reply.status(500).send({ message: 'Erro ao criar usuário' });
        }
    });
    app.get('/usuario/:id', async (request, reply) => {
        try {
            const paramsSchema = zod_1.z.object({
                id: zod_1.z.string()
            });
            const { id } = paramsSchema.parse(request.params);
            const usuario = await (0, Usuario_1.obterUsuarioPorId)(Number(id));
            if (!usuario) {
                return reply.status(404).send({ message: 'Usuário não encontrado' });
            }
            return usuario;
        }
        catch (error) {
            console.error('Erro ao obter usuário:', error);
            return reply.status(500).send({ message: 'Erro ao obter usuário' });
        }
    });
    app.get('/usuario', async (request, reply) => {
        try {
            const usuarios = await (0, Usuario_1.obterTodosUsuarios)();
            return usuarios;
        }
        catch (error) {
            console.error('Erro ao obter usuários:', error);
            return reply.status(500).send({ message: 'Erro ao obter usuários' });
        }
    });
}
exports.usuarioController = usuarioController;
