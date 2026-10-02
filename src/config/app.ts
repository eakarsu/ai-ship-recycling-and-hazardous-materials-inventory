export interface PageConfig {
  label: string;
  href: string;
  description: string;
  entities: string[];
  workflows: string[];
}

export interface EntityConfig {
  name: string;
  label: string;
  fields: Array<{ name: string; kind: "string" | "number" | "boolean" | "date" }>;
}

export interface WorkflowConfig {
  slug: string;
  title: string;
  description: string;
  prompt: string;
  fields: string[];
}

export const appConfig = {
  "slug": "ai-ship-recycling-and-hazardous-materials-inventory",
  "title": "Ship Recycling and Hazardous Materials Inventory",
  "tagline": "Maintain vessel-specific hazardous-material inventories, supplier declarations, survey evidence and recycling-plan approvals.",
  "accent": "rose"
};
export const pages: PageConfig[] = [
  {
    "label": "Intake & registers",
    "href": "/registers",
    "description": "Maintain vessel-specific hazardous-material inventories, supplier declarations, survey evidence and recycling-plan approvals.",
    "entities": [
      "RecyclingVessel",
      "VesselComponent",
      "MaterialDeclaration"
    ],
    "workflows": [
      "material-declaration-extraction",
      "supplier-evidence-gap-review"
    ]
  },
  {
    "label": "Operational records",
    "href": "/workflow",
    "description": "Maintain vessel-specific hazardous-material inventories, supplier declarations, survey evidence and recycling-plan approvals.",
    "entities": [
      "SupplierDeclaration",
      "HazardSample",
      "IhmSurvey"
    ],
    "workflows": [
      "ihm-discrepancy-summary",
      "survey-preparation-draft"
    ]
  },
  {
    "label": "Review & delivery",
    "href": "/delivery",
    "description": "Maintain vessel-specific hazardous-material inventories, supplier declarations, survey evidence and recycling-plan approvals.",
    "entities": [
      "RecyclingFacility",
      "RecyclingPlan",
      "RecyclingTransfer"
    ],
    "workflows": [
      "recycling-plan-evidence-review",
      "material-handoff-narrative"
    ]
  },
  {
    "label": "Tasks & requirements",
    "href": "/operations",
    "description": "Assignments, versioned rules and document requirements.",
    "entities": [
      "OperationalTask",
      "RuleVersion",
      "DocumentRequirement"
    ],
    "workflows": [
      "evidence-completeness-review",
      "operations-handoff-draft"
    ]
  }
];
export const entities: Record<string, EntityConfig> = {
  "RecyclingVessel": {
    "name": "RecyclingVessel",
    "label": "Recycling Vessel",
    "fields": [
      {
        "name": "name",
        "kind": "string"
      },
      {
        "name": "imoNumber",
        "kind": "string"
      },
      {
        "name": "flag",
        "kind": "string"
      },
      {
        "name": "owner",
        "kind": "string"
      },
      {
        "name": "grossTonnage",
        "kind": "number"
      },
      {
        "name": "surveyDueAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      }
    ]
  },
  "VesselComponent": {
    "name": "VesselComponent",
    "label": "Vessel Component",
    "fields": [
      {
        "name": "name",
        "kind": "string"
      },
      {
        "name": "componentCode",
        "kind": "string"
      },
      {
        "name": "location",
        "kind": "string"
      },
      {
        "name": "installedAt",
        "kind": "date"
      },
      {
        "name": "manufacturer",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "recyclingVesselId",
        "kind": "string"
      }
    ]
  },
  "MaterialDeclaration": {
    "name": "MaterialDeclaration",
    "label": "Material Declaration",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "vesselComponentId",
        "kind": "string"
      },
      {
        "name": "material",
        "kind": "string"
      },
      {
        "name": "substance",
        "kind": "string"
      },
      {
        "name": "quantityKg",
        "kind": "number"
      },
      {
        "name": "sourceReference",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "recyclingVesselId",
        "kind": "string"
      }
    ]
  },
  "SupplierDeclaration": {
    "name": "SupplierDeclaration",
    "label": "Supplier Declaration",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "vesselComponentId",
        "kind": "string"
      },
      {
        "name": "supplier",
        "kind": "string"
      },
      {
        "name": "declarationAt",
        "kind": "date"
      },
      {
        "name": "scope",
        "kind": "string"
      },
      {
        "name": "evidence",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "recyclingVesselId",
        "kind": "string"
      }
    ]
  },
  "HazardSample": {
    "name": "HazardSample",
    "label": "Hazard Sample",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "vesselComponentId",
        "kind": "string"
      },
      {
        "name": "sampledAt",
        "kind": "date"
      },
      {
        "name": "laboratory",
        "kind": "string"
      },
      {
        "name": "substance",
        "kind": "string"
      },
      {
        "name": "resultText",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "recyclingVesselId",
        "kind": "string"
      }
    ]
  },
  "IhmSurvey": {
    "name": "IhmSurvey",
    "label": "Ihm Survey",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "surveyor",
        "kind": "string"
      },
      {
        "name": "surveyedAt",
        "kind": "date"
      },
      {
        "name": "scope",
        "kind": "string"
      },
      {
        "name": "findings",
        "kind": "string"
      },
      {
        "name": "nextDueAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "recyclingVesselId",
        "kind": "string"
      }
    ]
  },
  "RecyclingFacility": {
    "name": "RecyclingFacility",
    "label": "Recycling Facility",
    "fields": [
      {
        "name": "name",
        "kind": "string"
      },
      {
        "name": "permitNumber",
        "kind": "string"
      },
      {
        "name": "country",
        "kind": "string"
      },
      {
        "name": "capacityTonnes",
        "kind": "number"
      },
      {
        "name": "authorizationExpiry",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "recyclingVesselId",
        "kind": "string"
      }
    ]
  },
  "RecyclingPlan": {
    "name": "RecyclingPlan",
    "label": "Recycling Plan",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "recyclingFacilityId",
        "kind": "string"
      },
      {
        "name": "version",
        "kind": "string"
      },
      {
        "name": "plannedAt",
        "kind": "date"
      },
      {
        "name": "handlingPlan",
        "kind": "string"
      },
      {
        "name": "authorizationReference",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "recyclingVesselId",
        "kind": "string"
      }
    ]
  },
  "RecyclingTransfer": {
    "name": "RecyclingTransfer",
    "label": "Recycling Transfer",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "recyclingFacilityId",
        "kind": "string"
      },
      {
        "name": "material",
        "kind": "string"
      },
      {
        "name": "quantityKg",
        "kind": "number"
      },
      {
        "name": "transferredAt",
        "kind": "date"
      },
      {
        "name": "receipt",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "recyclingVesselId",
        "kind": "string"
      }
    ]
  },
  "OperationalTask": {
    "name": "OperationalTask",
    "label": "Operational Task",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "owner",
        "kind": "string"
      },
      {
        "name": "priority",
        "kind": "string"
      },
      {
        "name": "startAt",
        "kind": "date"
      },
      {
        "name": "dueAt",
        "kind": "date"
      },
      {
        "name": "done",
        "kind": "boolean"
      },
      {
        "name": "notes",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "recyclingVesselId",
        "kind": "string"
      }
    ]
  },
  "RuleVersion": {
    "name": "RuleVersion",
    "label": "Rule Version",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "jurisdiction",
        "kind": "string"
      },
      {
        "name": "version",
        "kind": "string"
      },
      {
        "name": "effectiveAt",
        "kind": "date"
      },
      {
        "name": "expiresAt",
        "kind": "date"
      },
      {
        "name": "sourceUrl",
        "kind": "string"
      },
      {
        "name": "requirementText",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "recyclingVesselId",
        "kind": "string"
      }
    ]
  },
  "DocumentRequirement": {
    "name": "DocumentRequirement",
    "label": "Document Requirement",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "category",
        "kind": "string"
      },
      {
        "name": "requiredBy",
        "kind": "date"
      },
      {
        "name": "sourceReference",
        "kind": "string"
      },
      {
        "name": "evidenceReference",
        "kind": "string"
      },
      {
        "name": "reviewNotes",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "recyclingVesselId",
        "kind": "string"
      }
    ]
  }
};
export const workflows: WorkflowConfig[] = [
  {
    "slug": "material-declaration-extraction",
    "title": "Material declaration extraction",
    "description": "Material declaration extraction using selected recycling vessel records and supplied evidence.",
    "prompt": "Material declaration extraction for Ship Recycling and Hazardous Materials Inventory. Operational scope: Maintain vessel-specific hazardous-material inventories, supplier declarations, survey evidence and recycling-plan approvals. Specific AI scope: Extract material declarations and flag undocumented components. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "supplier-evidence-gap-review",
    "title": "Supplier evidence gap review",
    "description": "Supplier evidence gap review using selected recycling vessel records and supplied evidence.",
    "prompt": "Supplier evidence gap review for Ship Recycling and Hazardous Materials Inventory. Operational scope: Maintain vessel-specific hazardous-material inventories, supplier declarations, survey evidence and recycling-plan approvals. Specific AI scope: Extract material declarations and flag undocumented components. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "ihm-discrepancy-summary",
    "title": "IHM discrepancy summary",
    "description": "IHM discrepancy summary using selected recycling vessel records and supplied evidence.",
    "prompt": "IHM discrepancy summary for Ship Recycling and Hazardous Materials Inventory. Operational scope: Maintain vessel-specific hazardous-material inventories, supplier declarations, survey evidence and recycling-plan approvals. Specific AI scope: Extract material declarations and flag undocumented components. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "survey-preparation-draft",
    "title": "Survey preparation draft",
    "description": "Survey preparation draft using selected recycling vessel records and supplied evidence.",
    "prompt": "Survey preparation draft for Ship Recycling and Hazardous Materials Inventory. Operational scope: Maintain vessel-specific hazardous-material inventories, supplier declarations, survey evidence and recycling-plan approvals. Specific AI scope: Extract material declarations and flag undocumented components. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "recycling-plan-evidence-review",
    "title": "Recycling plan evidence review",
    "description": "Recycling plan evidence review using selected recycling vessel records and supplied evidence.",
    "prompt": "Recycling plan evidence review for Ship Recycling and Hazardous Materials Inventory. Operational scope: Maintain vessel-specific hazardous-material inventories, supplier declarations, survey evidence and recycling-plan approvals. Specific AI scope: Extract material declarations and flag undocumented components. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "material-handoff-narrative",
    "title": "Material handoff narrative",
    "description": "Material handoff narrative using selected recycling vessel records and supplied evidence.",
    "prompt": "Material handoff narrative for Ship Recycling and Hazardous Materials Inventory. Operational scope: Maintain vessel-specific hazardous-material inventories, supplier declarations, survey evidence and recycling-plan approvals. Specific AI scope: Extract material declarations and flag undocumented components. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "evidence-completeness-review",
    "title": "Evidence completeness review",
    "description": "Evidence completeness review using selected recycling vessel records and supplied evidence.",
    "prompt": "Evidence completeness review for Ship Recycling and Hazardous Materials Inventory. Operational scope: Maintain vessel-specific hazardous-material inventories, supplier declarations, survey evidence and recycling-plan approvals. Specific AI scope: Extract material declarations and flag undocumented components. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "operations-handoff-draft",
    "title": "Operations handoff draft",
    "description": "Operations handoff draft using selected recycling vessel records and supplied evidence.",
    "prompt": "Operations handoff draft for Ship Recycling and Hazardous Materials Inventory. Operational scope: Maintain vessel-specific hazardous-material inventories, supplier declarations, survey evidence and recycling-plan approvals. Specific AI scope: Extract material declarations and flag undocumented components. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  }
];
export function findPage(href:string){return pages.find(p=>p.href===href);}
