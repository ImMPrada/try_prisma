import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

async function main() {
  // ... you will write your Prisma Client queries here

  // const deleteGoal = await prisma.goals.delete({
  //   where : {
  //     id: 62
  //   }
  // })

  // const updateGoal = await prisma.goals.update({
  //   where: {
  //     id: 62
  //   },
  //   data: {
  //     label: 'Learn Prisma!!!!!!',
  //   },
  // })

  // const newGoal = await prisma.goals.create({
  //   data: {
  //     label: 'Learn Prisma',
  //     description: 'Learn how to use Prisma',
  //     timeframe: 1
  //   },
  // })

  const allGoals = await prisma.goals.findMany()
  console.log(allGoals)
}

main()
  .then(async () => {
    await prisma.$disconnect()
  })
  .catch(async (e) => {
    console.error(e)
    await prisma.$disconnect()
    process.exit(1)
  })
