$ENV:HAB_ORIGIN="jvogt-fundamentals"
if (!(Test-Path "c:/hab/cache/keys/${ENV:HAB_ORIGIN}*")) {
  hab origin key generate $HAB_ORIGIN
}
hab pkg build .
. ./results/last_build.ps1
hab pkg upload "results/${pkg_artifact}"
