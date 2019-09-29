$pkg_name="windows-workstation-chef"
$pkg_origin="jvogt-fundamentals"
$pkg_version="0.1.0"
$pkg_maintainer="Jeff Vogt"
$pkg_license=@("Apache-2.0")
$pkg_scaffolding="chef/scaffolding-chef-infra"
$pkg_build_deps=@("core/chef-dk")
$pkg_deps=@(
  "core/cacerts"
  "stuartpreston/chef-client" # https://github.com/habitat-sh/habitat/issues/6671
)
$scaffold_policy_name="windows-workstation"
$scaffold_policyfile_path="$PLAN_CONTEXT/../" # habitat/../windows-workstation.rb
$scaffold_chef_license="accept-no-persist"