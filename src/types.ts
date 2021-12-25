export interface ProcessorNode {
    id: string;
    processorVersionId: string;
    key: string;
    name: string;
}

export interface JobType {
    id: string;
    key: string;
    name: string;
}

export interface AssetType {
    id: string;
    key: string;
    name: string;
}

export interface ProcessorNodeCapability {
    id: string;
    processorNodeId: string;
    jobTypeId: string;
    assetTypeId: string | null;
    mediaType: string;
    processorNode: ProcessorNode;
    jobType: JobType;
    assetType: AssetType;
}
