#!/bin/sh
#Get CompartmentID
oci iam compartment list | grep compartment-id > compartment-id.txt ; cut -f 2 -d ":" compartment-id.txt | tr -d ' ','"',',' | tee compartment-id-tee.txt &>/dev/null ; compartment_id=`cat ./compartment-id-tee.txt` ; rm -rf ./compartment-id* ; echo ${compartment_id}

#Create Dynamic-Group
oci iam dynamic-group create --name OCI_DevOps_Policy_Compute --description OCI_DevOps_Policy_Compute --matching-rule "any {instance.compartment.id = '${compartment_id}'}"

#Create Policy
oci iam policy create --name OCI_DevOps_Policy_Compute --description OCI_DevOps_Policy_Compute --compartment-id "${compartment_id}" --statements '["Allow dynamic-group OCI_DevOps_Dynamic_Group_Compute to manage all-resources in compartment id '${compartment_id}'", "Allow dynamic-group OCI_DevOps_Dynamic_Group_Compute to to manage instance-agent-command-family in compartment '${compartment_id}'"]'
