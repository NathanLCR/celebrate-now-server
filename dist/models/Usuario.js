"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.obterTodosUsuarios = exports.obterUsuarioPorId = exports.criarUsuario = exports.UsuarioSchema = void 0;
const prisma_1 = require("../lib/prisma");
const zod_1 = require("zod");
exports.UsuarioSchema = zod_1.z.object({
    id: zod_1.z.number().optional(),
    nome: zod_1.z.string(),
    email: zod_1.z.string().email(),
    senha: zod_1.z.string(),
});
const criarUsuario = async (usuario) => {
    return prisma_1.prisma.usuario.create({ data: usuario });
};
exports.criarUsuario = criarUsuario;
const obterUsuarioPorId = async (id) => {
    return prisma_1.prisma.usuario.findUnique({ where: { id } });
};
exports.obterUsuarioPorId = obterUsuarioPorId;
const obterTodosUsuarios = async () => {
    return prisma_1.prisma.usuario.findMany();
};
exports.obterTodosUsuarios = obterTodosUsuarios;
