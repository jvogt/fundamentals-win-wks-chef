$ENV:HAB_ORIGIN="jvogt-fundamentals"
if (!(Test-Path "~/.hab/cache/keys/${HAB_ORIGIN}*")) {
  hab origin key generate $HAB_ORIGIN
}
hab pkg build .
#source results/last_build.env
#hab pkg upload results/$pkg_artifact
