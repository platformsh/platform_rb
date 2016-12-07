require 'spec_helper'

describe "Platform.sh helper Build Environment" do

  before(:all) do
    ENV['PLATFORM_APPLICATION']='eyJyZWxhdGlvbnNoaXBzIjogeyJyZWRpcyI6ICJyZWRpczpyZWRpcyIsICJkYXRhYmFzZSI6ICJwZ3NxbDpwb3N0Z3Jlc3FsIn0sICJ3ZWIiOiB7Im1vdmVfdG9fcm9vdCI6IGZhbHNlLCAiY29tbWFuZHMiOiB7InN0YXJ0IjogImZvcmVtYW4gc3RhcnQiLCAic3RvcCI6IG51bGx9LCAibG9jYXRpb25zIjogeyIvIjogeyJwYXNzdGhydSI6IHRydWUsICJydWxlcyI6IHt9LCAiZXhwaXJlcyI6ICIxaCIsICJhbGxvdyI6IHRydWUsICJzY3JpcHRzIjogdHJ1ZSwgInJvb3QiOiAicHVibGljIn19LCAidXBzdHJlYW0iOiB7InByb3RvY29sIjogbnVsbCwgInNvY2tldF9mYW1pbHkiOiAidW5peCJ9fSwgImRpc2siOiAyMDQ4LCAibmFtZSI6ICJhcHAiLCAicHJvamVjdF9pbmZvIjogeyJzc2hfa2V5IjogIi0tLS0tQkVHSU4gUlNBIFBSSVZBVEUgS0VZLS0tLS1cbk1JSUVwd0lCQUFLQ0FRRUFwT2xUVHp6bU44SWZvVEpudWlldWdpMWl4bjlDYWJqbUhYbGNmR0psMWxDUWVtMUJcbi9oNGl5NkZjMjBqcUFhK0FFbjJTWFB0dUtXa2I3Y3dvYWltY3VVN21ET1VKajlNM2tEcXJhUEwyOVpCRHkyQk5cbng2VndnbTUwU0NqQk9rZUEvVmJkZ1Y2OVNvTHlXdlExc25JbllvTWx4UUpUUk0zSjdlVFFkUVJkeEpKeWxsNDRcbjNzZGxJaXlhc0RzYm5tZ3IvbnBoL0oyZGIxUENiUGhhRHBMdkZpQUVGeE5zeGdNVWhiV3VPN1VkWGNabmxzenVcbkZVS0F2L2hISkJJWmpnSVJweDBYZkV2V0w2SFJneUQwLy9lNU5vTE5QSzU5QTdoOTBmUHcvQnF1NlNyMmJ0OFFcbkVsMkxwdUpKaytlZXVBUTVCdnN2Wi9Bak1tR25HdUJEQ05oVmdRSURBUUFCQW9JQkFCM2RFdlVhZGlaS3hTZVBcbjFURGsxcmxFTnNyemFMZDBnRmQrRHIySHBDRjNYWEtPTHBFeUsrTHNTY0I4SjhRK1g5YjVYblB3SkRiamplYzJcblBXdGNOY0ZwQkVmNWdnM0ZsaDVNUVpZenlYMFdydkE1ZEZ4ZkhVekJhOVZWYkFoOXdtSWVST2FVblhyTTA4NmNcbndzeVoxNEFEZCtlQlVFcjVhVVBuVjhpWkRkSDIyTW5Zd1g5MmlmN1Y3cTlaanhkdE51WkFTcjB4RS9QTnFQVllcbktRRjM5U3J0QnVjRCtOWlNxdCtFb2FEMWZQNitYblMrN0pDa2xDZ2t2b0ViK0ZGRGtJelc2d1ZxNFFoZ1BodmVcbkZITzZKQnR2NTduU2dsRWpPUkJwaWIwZC9NdDNkY3pFdVgzVHV2ZTZ4SGxUNWUyYUkzeHhTTlFlUEhjNTNBK3hcbkk2UGpVUUVDZ2dDQkFNWVl0N2daSjVCTXJjKzMvWnEwZVkyQXVOVkZPMGY5aUdnT0MxZW1ETXJZd0szRldBclZcbm8zcld3OUlHN3NsZVJiRVpIeHhIbFJhL2pPZk1qTUYvZ0k5MzZPUmZLM1Y3c1VvNmd0NXZQcXF5TGU3aEZnV1VcbitCZzcwSGZEV1pOOCsxeWtONFRpMDl1VXpJcnNvSWwxZXdYZ2h2YkMrcUNtN2k1TnZzdnRLa2lKQW9JQWdRRFZcbkhXbUQ5YTdRSlNLeVdmNDB0SVJFMnZWaVVkVm83T0oxMUlFeEkyUVc0OW1sY0hrSTJKSDJwaEdBUi9MT3hlRThcbnJlR1BqRUFweXJ0NHdWWUh5Wkdhcmd6eHRGYXV6ZmduYStjcG1FS0NHZkhyc2I1WGJmRVpVaGVGS0YzWFVIdllcbjIvRmFTM2VOSTAzUzdZRG9pSUp5UU5iOHUrNHAwSmx6bDBPNzJtTDNPUUtDQUlBankxK1hFbVNGdkhWRHJWbFRcbjFQeUp4eEtlNXMyWmFvUjFXT1JQeUI5VG4rcmcrMkczUTNjd3dSSE5KNWVLSjFDc2VYK1htbytqOXFTOVZjYXhcblNCcXcwZGZ4UEFrY1IyZDNwQzcxaG1CcWM1dTlLRXJVWTJDWThHWHczZ21YanVQVWo0L0FvVVBxejI1T1JBZVdcbkR2WlZ6NFpUbkZPeEo3aXVBVHBTbXQ0akVRS0NBSUJCbkxHTXFBb3ZHUS9LbXp4Ulc3WlJRSnhGcmU0blJLOGdcbkdkSEFvQ1hEaWxqS3Y0cno5MEZSRDZYWnVjeitiaHUvUThWckhZSHZtL1FGNUhncEk1ekpZNGFtcjUvMFo0TmNcbkY3TnVzZXJnQlQ3ZkVyVUlVOWZqdE10NitvZVJyN3pCY2syblFBN0pqREg4bTVTUmd0MnVjVm4vSzVqU2xOOTVcbm4vdUJqV1hrdVFLQ0FJQllLbDNUZkFLZ1FBYjZZT0Z0NDU5QWpMcFloV2trL2t1NEpGMUN4VFZqSnRFMEZOcm9cblpBcDlKWWNsSDBKNzRUS0x6NkVic1FHNXlGcVFLVms4M2dKck91RmVSeEg5US9xN0NyclNLc3hsbS8rZHBvQjVcbldiRDJ5T2NsUEE5WHQya215MG50NURmR2R1VFFSSFI3N0JwRFFKY2xEbnBwVnpQU2FQUXU4OXY4ZkE9PVxuLS0tLS1FTkQgUlNBIFBSSVZBVEUgS0VZLS0tLS1cbiIsICJzZXR0aW5ncyI6IHsiZGV2ZWxvcG1lbnRfc2VydmljZV9zaXplIjogIlMiLCAicHJvamVjdF9jb25maWdfZGlyIjogIi5wbGF0Zm9ybSIsICJ2YXJpYWJsZXNfcHJlZml4IjogIlBMQVRGT1JNXyIsICJhcHBsaWNhdGlvbl9jb25maWdfZmlsZSI6ICIucGxhdGZvcm0uYXBwLnlhbWwiLCAicHJvZHVjdF9jb2RlIjogInBsYXRmb3Jtc2giLCAidXNlX2RydXBhbF9kZWZhdWx0cyI6IHRydWUsICJwcm9kdWN0X25hbWUiOiAiUGxhdGZvcm0uc2giLCAiYm90X2VtYWlsIjogImJvdEBwbGF0Zm9ybS5zaCJ9fSwgImhvb2tzIjogeyJidWlsZCI6ICJleHBvcnRcbmdlbSBpbnN0YWxsIGJ1bmRsZXJcbmdlbSBpbnN0YWxsIGZvcmVtYW5cbmJ1bmRsZSBpbnN0YWxsIC0tZGVwbG95bWVudCAtLWpvYnMgNiAtLXdpdGhvdXQgZGV2ZWxvcG1lbnQgdGVzdFxuI1JBQ0tfRU5WPXByb2R1Y3Rpb24gYnVuZGxlIGV4ZWMgcmFrZSBhc3NldHM6cHJlY29tcGlsZVxuIyBGdWRnZSBSYWlscyB0cnkgdG8gY29ubmVjdCB0byB0aGUgZGIuXG4iLCAiZGVwbG95IjogImV4cG9ydFxuUkFDS19FTlY9cHJvZHVjdGlvbiBidW5kbGUgZXhlYyByYWtlIGRiOm1pZ3JhdGVcbiJ9LCAiY3JvbnMiOiB7fSwgImFjY2VzcyI6IHsic3NoIjogImNvbnRyaWJ1dG9yIn0sICJkZXBlbmRlbmNpZXMiOiB7fSwgInByZWZsaWdodCI6IHsiZW5hYmxlZCI6IHRydWUsICJpZ25vcmVkX3J1bGVzIjogW119LCAiYnVpbGQiOiB7ImZsYXZvciI6IG51bGwsICJzc2hfa2V5IjogIi0tLS0tQkVHSU4gUlNBIFBSSVZBVEUgS0VZLS0tLS1cbk1JSUVwd0lCQUFLQ0FRRUFwT2xUVHp6bU44SWZvVEpudWlldWdpMWl4bjlDYWJqbUhYbGNmR0psMWxDUWVtMUJcbi9oNGl5NkZjMjBqcUFhK0FFbjJTWFB0dUtXa2I3Y3dvYWltY3VVN21ET1VKajlNM2tEcXJhUEwyOVpCRHkyQk5cbng2VndnbTUwU0NqQk9rZUEvVmJkZ1Y2OVNvTHlXdlExc25JbllvTWx4UUpUUk0zSjdlVFFkUVJkeEpKeWxsNDRcbjNzZGxJaXlhc0RzYm5tZ3IvbnBoL0oyZGIxUENiUGhhRHBMdkZpQUVGeE5zeGdNVWhiV3VPN1VkWGNabmxzenVcbkZVS0F2L2hISkJJWmpnSVJweDBYZkV2V0w2SFJneUQwLy9lNU5vTE5QSzU5QTdoOTBmUHcvQnF1NlNyMmJ0OFFcbkVsMkxwdUpKaytlZXVBUTVCdnN2Wi9Bak1tR25HdUJEQ05oVmdRSURBUUFCQW9JQkFCM2RFdlVhZGlaS3hTZVBcbjFURGsxcmxFTnNyemFMZDBnRmQrRHIySHBDRjNYWEtPTHBFeUsrTHNTY0I4SjhRK1g5YjVYblB3SkRiamplYzJcblBXdGNOY0ZwQkVmNWdnM0ZsaDVNUVpZenlYMFdydkE1ZEZ4ZkhVekJhOVZWYkFoOXdtSWVST2FVblhyTTA4NmNcbndzeVoxNEFEZCtlQlVFcjVhVVBuVjhpWkRkSDIyTW5Zd1g5MmlmN1Y3cTlaanhkdE51WkFTcjB4RS9QTnFQVllcbktRRjM5U3J0QnVjRCtOWlNxdCtFb2FEMWZQNitYblMrN0pDa2xDZ2t2b0ViK0ZGRGtJelc2d1ZxNFFoZ1BodmVcbkZITzZKQnR2NTduU2dsRWpPUkJwaWIwZC9NdDNkY3pFdVgzVHV2ZTZ4SGxUNWUyYUkzeHhTTlFlUEhjNTNBK3hcbkk2UGpVUUVDZ2dDQkFNWVl0N2daSjVCTXJjKzMvWnEwZVkyQXVOVkZPMGY5aUdnT0MxZW1ETXJZd0szRldBclZcbm8zcld3OUlHN3NsZVJiRVpIeHhIbFJhL2pPZk1qTUYvZ0k5MzZPUmZLM1Y3c1VvNmd0NXZQcXF5TGU3aEZnV1VcbitCZzcwSGZEV1pOOCsxeWtONFRpMDl1VXpJcnNvSWwxZXdYZ2h2YkMrcUNtN2k1TnZzdnRLa2lKQW9JQWdRRFZcbkhXbUQ5YTdRSlNLeVdmNDB0SVJFMnZWaVVkVm83T0oxMUlFeEkyUVc0OW1sY0hrSTJKSDJwaEdBUi9MT3hlRThcbnJlR1BqRUFweXJ0NHdWWUh5Wkdhcmd6eHRGYXV6ZmduYStjcG1FS0NHZkhyc2I1WGJmRVpVaGVGS0YzWFVIdllcbjIvRmFTM2VOSTAzUzdZRG9pSUp5UU5iOHUrNHAwSmx6bDBPNzJtTDNPUUtDQUlBankxK1hFbVNGdkhWRHJWbFRcbjFQeUp4eEtlNXMyWmFvUjFXT1JQeUI5VG4rcmcrMkczUTNjd3dSSE5KNWVLSjFDc2VYK1htbytqOXFTOVZjYXhcblNCcXcwZGZ4UEFrY1IyZDNwQzcxaG1CcWM1dTlLRXJVWTJDWThHWHczZ21YanVQVWo0L0FvVVBxejI1T1JBZVdcbkR2WlZ6NFpUbkZPeEo3aXVBVHBTbXQ0akVRS0NBSUJCbkxHTXFBb3ZHUS9LbXp4Ulc3WlJRSnhGcmU0blJLOGdcbkdkSEFvQ1hEaWxqS3Y0cno5MEZSRDZYWnVjeitiaHUvUThWckhZSHZtL1FGNUhncEk1ekpZNGFtcjUvMFo0TmNcbkY3TnVzZXJnQlQ3ZkVyVUlVOWZqdE10NitvZVJyN3pCY2syblFBN0pqREg4bTVTUmd0MnVjVm4vSzVqU2xOOTVcbm4vdUJqV1hrdVFLQ0FJQllLbDNUZkFLZ1FBYjZZT0Z0NDU5QWpMcFloV2trL2t1NEpGMUN4VFZqSnRFMEZOcm9cblpBcDlKWWNsSDBKNzRUS0x6NkVic1FHNXlGcVFLVms4M2dKck91RmVSeEg5US9xN0NyclNLc3hsbS8rZHBvQjVcbldiRDJ5T2NsUEE5WHQya215MG50NURmR2R1VFFSSFI3N0JwRFFKY2xEbnBwVnpQU2FQUXU4OXY4ZkE9PVxuLS0tLS1FTkQgUlNBIFBSSVZBVEUgS0VZLS0tLS1cbiJ9LCAibW91bnRzIjogeyIvdG1wIjogInNoYXJlZDpmaWxlcy90bXAiLCAiL3B1YmxpYy9hc3NldHMiOiAic2hhcmVkOmZpbGVzL2Fzc2V0cyIsICIvbG9nIjogInNoYXJlZDpmaWxlcy9sb2cifSwgInRpbWV6b25lIjogbnVsbCwgInJ1bnRpbWUiOiB7fSwgInR5cGUiOiAicnVieToyLjMiLCAic2l6ZSI6ICJBVVRPIn0='
    ENV['PLATFORM_APPLICATION_NAME']='app'
    ENV['PLATFORM_APP_DIR']='/app'
    ENV['PLATFORM_DOCUMENT_ROOT']='/app/public'
    ENV['PLATFORM_PROJECT']=''
    ENV['PLATFORM_TREE_ID']=''
        
    @config = PlatformSH::config
  end
  after(:all) do
    ENV.clear['PLATFORM_APPLICATION']
    ENV.clear['PLATFORM_APPLICATION_NAME']
    ENV.clear['PLATFORM_APP_DIR']
    ENV.clear['PLATFORM_DOCUMENT_ROOT']
    ENV.clear['PLATFORM_PROJECT']
    ENV.clear['PLATFORM_TREE_ID']
    @config = PlatformSH::config
  end
  
  it 'is on platform' do
    expect(PlatformSH::on_platform?).to be true 
  end
  
  it 'is a build environment' do
    expect(PlatformSH::is_build_environment?).to be true 
  end
  
  it 'has a name' do
    expect(@config["application_name"]).to eq("app")
  end

  it 'has a project id' do
    skip "fix this" do
      expect(@config["project"]).to eq("u3cwg2o536mh6")
    end
  end
  
  it 'does not have an environment' do
    expect(@config["environment"]).to be_nil
  end


end