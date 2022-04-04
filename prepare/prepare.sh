#!/bin/sh
#Get CompartmentID
oci iam compartment list | grep compartment-id > compartment-id.txt ; cut -f 2 -d ":" compartment-id.txt | tr -d ' ','"',',' | tee compartment-id-tee.txt &>/dev/null ; compartment_id=`cat ./compartment-id-tee.txt` ; rm -rf ./compartment-id* ; echo ${compartment_id}
#Create Policy
oci iam policy create --name OCI_DevOps_Policy_Compute --description OCI_DevOps_Policy_Compute --compartment-id "${compartment_id}" --statements '["Allow dynamic-group OCI_DevOps_Dynamic_Group to manage instance-agent-command-execution-family in compartment id '${compartment_id}'","Allow dynamic-group OCI_DevOps_Dynamic_Group to manage instance-family in compartment id '${compartment_id}'"]'