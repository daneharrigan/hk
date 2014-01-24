#!/bin/bash

heroku() {
  heroku_command=$1
  shift
  arguments=($@)

  case $heroku_command in
  "list"    | "apps")               hk_command=apps ;;
  "create"  | "apps:create")        hk_command=create ;;
  "destroy" | "apps:destroy")       hk_command=destroy ;;
  "info"    | "apps:info")          hk_command=info ;;
  "restart" | "apps:restart")       hk_command=restart ;;
  "rename"  | "apps:rename")        hk_command=rename ;;
  "releases:rollback" | "rollback") hk_command=rollback ;;
  "releases:info")                  hk_command=release-info ;;
  "config:remove" | "config:unset") hk_command=unset ;;
  "config:set")                     hk_command=set ;;
  "domains:add")                    hk_command=domain-add ;;
  "domains:remove")                 hk_command=domain-remove ;;
  "keys:add")                       hk_command=sshkey-add ;;
  "addons:add")                     hk_command=addons-add ;;
  "addons:remove")                  hk_command=addons-remove ;;
  "logs")                           hk_command=log ;;
  "env")                            hk_command=config ;;
  "ps")                             hk_command=dynos ;;
  "ps:scale" | "scale")             hk_command=scale ;;
  "pg:psql")                        hk_command=psql ;;
  "fork" | "help" | "regions" | "status" | "update" | "version" | "addons" | "run" | "domains" | "log" | "releases")
    hk_command=$heroku_command
  ;;
  *)
    hk_command=help
  ;;
  esac

  hk $hk_command $arguments
}
