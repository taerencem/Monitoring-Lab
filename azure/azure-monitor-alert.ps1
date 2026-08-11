param(
    [string]$VMName,
    [string]$RG
)

az monitor metrics alert create `
  --name "CPUAlert-$VMName" `
  --resource-group $RG `
  --scopes "/subscriptions/<SUB-ID>/resourceGroups/$RG/providers/Microsoft.Compute/virtualMachines/$VMName" `
  --condition "avg Percentage CPU > 80"
