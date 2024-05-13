-- CreateEnum
CREATE TYPE "Priority" AS ENUM ('HELLYEAH', 'YEAH', 'MEH', 'NUH', 'BRUH');

-- CreateEnum
CREATE TYPE "Day" AS ENUM ('MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN');

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "nickname" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Session" (
    "id" TEXT NOT NULL,
    "expiration" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" TEXT NOT NULL,

    CONSTRAINT "Session_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BoardGame" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "image" TEXT NOT NULL,
    "duration" INTEGER NOT NULL,
    "min" INTEGER NOT NULL,
    "max" INTEGER NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "BoardGame_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GameVote" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "gamePollId" TEXT NOT NULL,

    CONSTRAINT "GameVote_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GameOnVote" (
    "id" TEXT NOT NULL,
    "priority" "Priority" NOT NULL,
    "boardGameId" TEXT NOT NULL,
    "gameVoteId" TEXT NOT NULL,

    CONSTRAINT "GameOnVote_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GamePoll" (
    "id" TEXT NOT NULL,
    "day" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "GamePoll_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TimeVote" (
    "id" TEXT NOT NULL,
    "start" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "end" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" TEXT NOT NULL,
    "timePollId" TEXT NOT NULL,

    CONSTRAINT "TimeVote_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TimePoll" (
    "id" TEXT NOT NULL,
    "day" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "TimePoll_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DayVote" (
    "id" TEXT NOT NULL,
    "days" "Day"[],
    "userId" TEXT NOT NULL,
    "dayPollId" TEXT NOT NULL,

    CONSTRAINT "DayVote_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DayPoll" (
    "id" TEXT NOT NULL,
    "start" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DayPoll_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Session_userId_key" ON "Session"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "BoardGame_userId_key" ON "BoardGame"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "GameVote_userId_key" ON "GameVote"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "GameVote_gamePollId_key" ON "GameVote"("gamePollId");

-- CreateIndex
CREATE UNIQUE INDEX "TimeVote_userId_key" ON "TimeVote"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "TimeVote_timePollId_key" ON "TimeVote"("timePollId");

-- CreateIndex
CREATE UNIQUE INDEX "DayVote_userId_key" ON "DayVote"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "DayVote_dayPollId_key" ON "DayVote"("dayPollId");

-- AddForeignKey
ALTER TABLE "Session" ADD CONSTRAINT "Session_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BoardGame" ADD CONSTRAINT "BoardGame_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GameVote" ADD CONSTRAINT "GameVote_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GameVote" ADD CONSTRAINT "GameVote_gamePollId_fkey" FOREIGN KEY ("gamePollId") REFERENCES "GamePoll"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GameOnVote" ADD CONSTRAINT "GameOnVote_boardGameId_fkey" FOREIGN KEY ("boardGameId") REFERENCES "BoardGame"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GameOnVote" ADD CONSTRAINT "GameOnVote_gameVoteId_fkey" FOREIGN KEY ("gameVoteId") REFERENCES "GameVote"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TimeVote" ADD CONSTRAINT "TimeVote_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TimeVote" ADD CONSTRAINT "TimeVote_timePollId_fkey" FOREIGN KEY ("timePollId") REFERENCES "TimePoll"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DayVote" ADD CONSTRAINT "DayVote_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DayVote" ADD CONSTRAINT "DayVote_dayPollId_fkey" FOREIGN KEY ("dayPollId") REFERENCES "DayPoll"("id") ON DELETE CASCADE ON UPDATE CASCADE;
