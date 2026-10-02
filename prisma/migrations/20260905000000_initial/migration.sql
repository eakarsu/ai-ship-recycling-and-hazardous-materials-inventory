-- CreateEnum
CREATE TYPE "Role" AS ENUM ('ADMIN', 'MANAGER', 'ANALYST');

-- CreateTable
CREATE TABLE "User" (
    "active" BOOLEAN NOT NULL DEFAULT true,
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "passwordHash" TEXT NOT NULL,
    "role" "Role" NOT NULL DEFAULT 'ANALYST',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AuditLog" (
    "id" TEXT NOT NULL,
    "actorId" TEXT,
    "actorName" TEXT,
    "action" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT,
    "detail" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AuditLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkflowAnalysis" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "workflow" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "input" JSONB NOT NULL,
    "evidence" JSONB NOT NULL,
    "evidenceHash" TEXT NOT NULL,
    "result" JSONB NOT NULL,
    "model" TEXT NOT NULL,
    "receipt" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WorkflowAnalysis_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecordReview" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "reason" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "RecordReview_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UsageBucket" (
    "id" TEXT NOT NULL,
    "calls" INTEGER NOT NULL,

    CONSTRAINT "UsageBucket_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "IssuedCredential" (
    "token" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "assertion" JSONB NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "revokedAt" TIMESTAMP(3),

    CONSTRAINT "IssuedCredential_pkey" PRIMARY KEY ("token")
);

-- CreateTable
CREATE TABLE "DomainArtifact" (
    "id" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "contentHash" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "approvedBy" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DomainArtifact_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecordApproval" (
    "id" TEXT NOT NULL,
    "version" TEXT NOT NULL,

    CONSTRAINT "RecordApproval_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DomainExecution" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "connectorId" TEXT NOT NULL,
    "action" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "result" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DomainExecution_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkSession" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "respondentId" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "questions" JSONB NOT NULL,
    "answers" JSONB NOT NULL,
    "currentQuestion" TEXT,
    "status" TEXT NOT NULL,
    "deadline" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WorkSession_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SessionMedia" (
    "id" TEXT NOT NULL,
    "sessionId" TEXT NOT NULL,
    "questionId" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "contentType" TEXT NOT NULL,
    "bytes" BYTEA NOT NULL,
    "contentHash" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "SessionMedia_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AppSetting" (
    "id" TEXT NOT NULL,
    "value" JSONB NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AppSetting_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecyclingVessel" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "imoNumber" TEXT NOT NULL,
    "flag" TEXT NOT NULL,
    "owner" TEXT NOT NULL,
    "grossTonnage" DOUBLE PRECISION NOT NULL,
    "surveyDueAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RecyclingVessel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "VesselComponent" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "componentCode" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "installedAt" TIMESTAMP(3) NOT NULL,
    "manufacturer" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "recyclingVesselId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "VesselComponent_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MaterialDeclaration" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "vesselComponentId" TEXT NOT NULL,
    "material" TEXT NOT NULL,
    "substance" TEXT NOT NULL,
    "quantityKg" DOUBLE PRECISION NOT NULL,
    "sourceReference" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "recyclingVesselId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MaterialDeclaration_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SupplierDeclaration" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "vesselComponentId" TEXT NOT NULL,
    "supplier" TEXT NOT NULL,
    "declarationAt" TIMESTAMP(3) NOT NULL,
    "scope" TEXT NOT NULL,
    "evidence" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "recyclingVesselId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SupplierDeclaration_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "HazardSample" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "vesselComponentId" TEXT NOT NULL,
    "sampledAt" TIMESTAMP(3) NOT NULL,
    "laboratory" TEXT NOT NULL,
    "substance" TEXT NOT NULL,
    "resultText" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "recyclingVesselId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "HazardSample_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "IhmSurvey" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "surveyor" TEXT NOT NULL,
    "surveyedAt" TIMESTAMP(3) NOT NULL,
    "scope" TEXT NOT NULL,
    "findings" TEXT NOT NULL,
    "nextDueAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "recyclingVesselId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "IhmSurvey_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecyclingFacility" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "permitNumber" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    "capacityTonnes" DOUBLE PRECISION NOT NULL,
    "authorizationExpiry" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "recyclingVesselId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RecyclingFacility_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecyclingPlan" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "recyclingFacilityId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "plannedAt" TIMESTAMP(3) NOT NULL,
    "handlingPlan" TEXT NOT NULL,
    "authorizationReference" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "recyclingVesselId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RecyclingPlan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecyclingTransfer" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "recyclingFacilityId" TEXT NOT NULL,
    "material" TEXT NOT NULL,
    "quantityKg" DOUBLE PRECISION NOT NULL,
    "transferredAt" TIMESTAMP(3) NOT NULL,
    "receipt" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "recyclingVesselId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RecyclingTransfer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OperationalTask" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "owner" TEXT NOT NULL,
    "priority" TEXT NOT NULL,
    "startAt" TIMESTAMP(3) NOT NULL,
    "dueAt" TIMESTAMP(3) NOT NULL,
    "done" BOOLEAN NOT NULL,
    "notes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "recyclingVesselId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "OperationalTask_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RuleVersion" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "jurisdiction" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "effectiveAt" TIMESTAMP(3) NOT NULL,
    "expiresAt" TIMESTAMP(3),
    "sourceUrl" TEXT NOT NULL,
    "requirementText" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "recyclingVesselId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RuleVersion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DocumentRequirement" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "requiredBy" TIMESTAMP(3) NOT NULL,
    "sourceReference" TEXT NOT NULL,
    "evidenceReference" TEXT,
    "reviewNotes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "recyclingVesselId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DocumentRequirement_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE INDEX "WorkflowAnalysis_workflow_createdAt_idx" ON "WorkflowAnalysis"("workflow", "createdAt");

-- CreateIndex
CREATE UNIQUE INDEX "RecordReview_entity_entityId_version_actorId_key" ON "RecordReview"("entity", "entityId", "version", "actorId");

-- CreateIndex
CREATE INDEX "IssuedCredential_entity_entityId_createdAt_idx" ON "IssuedCredential"("entity", "entityId", "createdAt");

-- CreateIndex
CREATE INDEX "DomainArtifact_subjectEntity_subjectId_idx" ON "DomainArtifact"("subjectEntity", "subjectId");

-- CreateIndex
CREATE INDEX "WorkSession_respondentId_createdAt_idx" ON "WorkSession"("respondentId", "createdAt");

-- CreateIndex
CREATE INDEX "SessionMedia_sessionId_idx" ON "SessionMedia"("sessionId");

-- CreateIndex
CREATE INDEX "RecyclingVessel_createdAt_idx" ON "RecyclingVessel"("createdAt");

-- CreateIndex
CREATE INDEX "VesselComponent_createdAt_idx" ON "VesselComponent"("createdAt");

-- CreateIndex
CREATE INDEX "VesselComponent_recyclingVesselId_idx" ON "VesselComponent"("recyclingVesselId");

-- CreateIndex
CREATE INDEX "MaterialDeclaration_createdAt_idx" ON "MaterialDeclaration"("createdAt");

-- CreateIndex
CREATE INDEX "MaterialDeclaration_recyclingVesselId_idx" ON "MaterialDeclaration"("recyclingVesselId");

-- CreateIndex
CREATE INDEX "SupplierDeclaration_createdAt_idx" ON "SupplierDeclaration"("createdAt");

-- CreateIndex
CREATE INDEX "SupplierDeclaration_recyclingVesselId_idx" ON "SupplierDeclaration"("recyclingVesselId");

-- CreateIndex
CREATE INDEX "HazardSample_createdAt_idx" ON "HazardSample"("createdAt");

-- CreateIndex
CREATE INDEX "HazardSample_recyclingVesselId_idx" ON "HazardSample"("recyclingVesselId");

-- CreateIndex
CREATE INDEX "IhmSurvey_createdAt_idx" ON "IhmSurvey"("createdAt");

-- CreateIndex
CREATE INDEX "IhmSurvey_recyclingVesselId_idx" ON "IhmSurvey"("recyclingVesselId");

-- CreateIndex
CREATE INDEX "RecyclingFacility_createdAt_idx" ON "RecyclingFacility"("createdAt");

-- CreateIndex
CREATE INDEX "RecyclingFacility_recyclingVesselId_idx" ON "RecyclingFacility"("recyclingVesselId");

-- CreateIndex
CREATE INDEX "RecyclingPlan_createdAt_idx" ON "RecyclingPlan"("createdAt");

-- CreateIndex
CREATE INDEX "RecyclingPlan_recyclingVesselId_idx" ON "RecyclingPlan"("recyclingVesselId");

-- CreateIndex
CREATE INDEX "RecyclingTransfer_createdAt_idx" ON "RecyclingTransfer"("createdAt");

-- CreateIndex
CREATE INDEX "RecyclingTransfer_recyclingVesselId_idx" ON "RecyclingTransfer"("recyclingVesselId");

-- CreateIndex
CREATE INDEX "OperationalTask_createdAt_idx" ON "OperationalTask"("createdAt");

-- CreateIndex
CREATE INDEX "OperationalTask_recyclingVesselId_idx" ON "OperationalTask"("recyclingVesselId");

-- CreateIndex
CREATE INDEX "RuleVersion_createdAt_idx" ON "RuleVersion"("createdAt");

-- CreateIndex
CREATE INDEX "RuleVersion_recyclingVesselId_idx" ON "RuleVersion"("recyclingVesselId");

-- CreateIndex
CREATE INDEX "DocumentRequirement_createdAt_idx" ON "DocumentRequirement"("createdAt");

-- CreateIndex
CREATE INDEX "DocumentRequirement_recyclingVesselId_idx" ON "DocumentRequirement"("recyclingVesselId");

-- AddForeignKey
ALTER TABLE "VesselComponent" ADD CONSTRAINT "VesselComponent_recyclingVesselId_fkey" FOREIGN KEY ("recyclingVesselId") REFERENCES "RecyclingVessel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MaterialDeclaration" ADD CONSTRAINT "MaterialDeclaration_vesselComponentId_fkey" FOREIGN KEY ("vesselComponentId") REFERENCES "VesselComponent"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MaterialDeclaration" ADD CONSTRAINT "MaterialDeclaration_recyclingVesselId_fkey" FOREIGN KEY ("recyclingVesselId") REFERENCES "RecyclingVessel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SupplierDeclaration" ADD CONSTRAINT "SupplierDeclaration_vesselComponentId_fkey" FOREIGN KEY ("vesselComponentId") REFERENCES "VesselComponent"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SupplierDeclaration" ADD CONSTRAINT "SupplierDeclaration_recyclingVesselId_fkey" FOREIGN KEY ("recyclingVesselId") REFERENCES "RecyclingVessel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "HazardSample" ADD CONSTRAINT "HazardSample_vesselComponentId_fkey" FOREIGN KEY ("vesselComponentId") REFERENCES "VesselComponent"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "HazardSample" ADD CONSTRAINT "HazardSample_recyclingVesselId_fkey" FOREIGN KEY ("recyclingVesselId") REFERENCES "RecyclingVessel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IhmSurvey" ADD CONSTRAINT "IhmSurvey_recyclingVesselId_fkey" FOREIGN KEY ("recyclingVesselId") REFERENCES "RecyclingVessel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RecyclingFacility" ADD CONSTRAINT "RecyclingFacility_recyclingVesselId_fkey" FOREIGN KEY ("recyclingVesselId") REFERENCES "RecyclingVessel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RecyclingPlan" ADD CONSTRAINT "RecyclingPlan_recyclingFacilityId_fkey" FOREIGN KEY ("recyclingFacilityId") REFERENCES "RecyclingFacility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RecyclingPlan" ADD CONSTRAINT "RecyclingPlan_recyclingVesselId_fkey" FOREIGN KEY ("recyclingVesselId") REFERENCES "RecyclingVessel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RecyclingTransfer" ADD CONSTRAINT "RecyclingTransfer_recyclingFacilityId_fkey" FOREIGN KEY ("recyclingFacilityId") REFERENCES "RecyclingFacility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RecyclingTransfer" ADD CONSTRAINT "RecyclingTransfer_recyclingVesselId_fkey" FOREIGN KEY ("recyclingVesselId") REFERENCES "RecyclingVessel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OperationalTask" ADD CONSTRAINT "OperationalTask_recyclingVesselId_fkey" FOREIGN KEY ("recyclingVesselId") REFERENCES "RecyclingVessel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RuleVersion" ADD CONSTRAINT "RuleVersion_recyclingVesselId_fkey" FOREIGN KEY ("recyclingVesselId") REFERENCES "RecyclingVessel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DocumentRequirement" ADD CONSTRAINT "DocumentRequirement_recyclingVesselId_fkey" FOREIGN KEY ("recyclingVesselId") REFERENCES "RecyclingVessel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

