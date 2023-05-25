import fastify from 'fastify'
import cors from '@fastify/cors'
import { usuarioController } from './controllers/UsuarioController'

// Cria uma instância do servidor Fastify
const app = fastify()

app.register(cors, {
  origin: true
})

app.register(usuarioController)

app.get('/', async () => {
  return { message: 'Bem-vindo ao backend da aplicação celebrate now123!' }
})

const start = async () => {
  try {
    await app.listen({port: 3000, host: '0.0.0.0'})
  } catch (err) {
    console.error('Erro ao iniciar o servidor:', err)
  }
}

start()
