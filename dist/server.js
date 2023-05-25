"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const fastify_1 = __importDefault(require("fastify"));
const cors_1 = __importDefault(require("@fastify/cors"));
const UsuarioController_1 = require("./controllers/UsuarioController");
// Cria uma instância do servidor Fastify
const app = (0, fastify_1.default)();
app.register(cors_1.default, {
    origin: true
});
app.register(UsuarioController_1.usuarioController);
app.get('/', async () => {
    return { message: 'Bem-vindo ao backend da aplicação celebrate now123!' };
});
const start = async () => {
    try {
        await app.listen({ port: 3000, host: '0.0.0.0' });
    }
    catch (err) {
        console.error('Erro ao iniciar o servidor:', err);
    }
};
start();
