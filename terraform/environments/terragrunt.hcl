remote_state {
  backend = "gcs"
  config  = {
    location = "eu"
    project = "${get_env("TF_VAR_project_id", "")}"
    bucket = "${get_env("TF_VAR_project_id", "")}_terraform-state"
    prefix = "${path_relative_to_include()}/"
  }
}

inputs = {
  project_id                               = "CHANGEME"
  github_demo_owner                        = "nholuongut"
  github_demo_reponame                     = "gke-demo"
  argocd_ver                               = "1.3.6"
  argo_rollouts_ver                        = "0.6.2"
  hipstershop_namespace                    = "hipstershop"
  microservices = [
    "adservice",
    "cartservice",
    "checkoutservice",
    "currencyservice",
    "emailservice",
    "frontend",
    "paymentservice",
    "productcatalogservice",
    "recommendationservice",
    "shippingservice",
  ]
}

skip = true


















#                                                 __
#                                             ╓▄▌▌▓▓▌▌▄
#                                   ,╗▄▄▓▓▓▄▄▌▓▓▓▓▓▓▓▓█▌▄▄▄╥_
#                                 ╓▌▓▓▓▓▓▓▓▓███▓█▓▓▓▓▓████▓██▌╦
#                                ╔█▓▓▓██▓▓▓▓▓▓███████▓▌▀▌███▄ ▐                  ╔▌
#                               ,█▓▓▓▓▓▓▓▓███▓▓▓▌▀▀▀▀└ ]█████▓╙                 ▐▌╫_
#                               ▐▓▓▓▓▓▓▓██▓▓▌╣▌█▌▌╖▄▄▄▄▓█╬▓▓▌╙                  ╓▌▄Ñ
#                              _╫▓▓▓▓▓██▓▌▀╙ ███████▓▓▓▓███▓▌▓▄_                ╫▒Ü
#                             ;▌▓▓▓▓▓▓▓▓▓▌▌▌▌███▓█▓▓▓▓▓▓▓▓▓▓▓▓▓█▄_      ╓█▄  _╓╗φ▓▌_
#                             ╣▓▌▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓▓╨  █▌▄▄/██▌▓╬▓▓█▀╙
#                             ▌▌▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███▓▓▓╬▌   └██████▓▄█▀`
#                            .█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓████▓▓▓▓▓▓▓▓▓▓▓▌▀┘  ╓▓▓▓████████▄
#                             █▌▓▓▓▓▓▓▓▓▓▓█▓▓▓▓▓▓▓▓▓▓▓▓╣▓▓▓▓▓▌      ▀▀▀_▄████████─
#                 ___,,,,,,___╫▓▌▓▓▓▓▓▓▓▓█▓▓╣████▓▓▓▓▓▓▓▓▓▌▀┘        ╓▌██████████▌_
#     _,╓▄▄▌▌███████████████████▓▓▓▓▓▓▓▓▓█▓▓▓▓▓▓▓▓▓▓▓▓▌▀▀╙           ╫█████████████
#  ,▄████╬╬╬╬▀▀▌▌▌▌▌▓╬███████████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▀▀╨╙                ╙████████████Ü
#╔██▓█████▌▒▒▒▒▒╟╣▌▌▌▌▌▌▓██████╬█▓▓▓▓▓▓▓▓▓▓▓▓▓▓██,                   "███████████╜
#██▌▌▌▌╬███▌▒▒▒▒▒▒╣▌▌▓▓╬▌████╬█▓▒╬▀█╬▓▓▓▓▓▓▓▌▓█▌█▒██▌▄_               ▀████████▌
#█▓▌▌▌▌▌▓███▌▒▒▒▓▌▓╬██████████▌╬█▄▓▒╬▀████████╝▒╚█▒▒▒╬▀█▌╦             ╟██████▌
#██▌▌▌▌▌▌▌███▓▓▌▓▓╬██╬╬████████▌╬██▌▓▓▓▓▒╨╨▀█▌▄▒▒╦▌▒▒▒▒▒▒╬▀─          ,███████▌
#██▓▌▌▌▌▌▌▌╬█▓▌╣█▓▓▓▓▓╬███████████▌╬██▌▓▓▒▄█████▌██▒▒▒▒▒▒▒▒╝▌_       _▄▌▓╬█████_
#╙██▌▌▌▌▌▌▌▌▓▌████╬▓▓▓▓▓▓▓▓▓▓▓▓▓╬██████╬▀▀▀▀▀█▀▀▀▒▒▒▒▒▒▒▒▒▒▒╬█µ      ███▌▒▓▒╬▀▀█▀
# ██▓▌▌▌▌▌▌▌▌╣██████▓▓▓╬▌╬▓▓▓▓▓▓▓▓▓▓╬╬██████▓▓▓▒▒▒▒▒▒▒▒▒▒▒▌▓▒╢█╦     ╫█▓╬╬▌▀▓▒▒█╦
# ║██▌▌▌▌▌▌▌▌██╬▓▓╬███╬▓╬███▌╬▓▓▓▓▓▓▓▓╬╬╬╟▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█▌▓╬█▄    ██▌▓╬▌▌▓▓▒▒╫▌
#  ██▓▌▌▌▌▌▌▌██▓▓▓▓╬████▓▓▒▀███▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒╣█▓▓╬█▌  ███╬▓▓╬███████
#  ╟██▌▌▌▌▌▌▌╣█▌▓▓▓▓▓╬███▌▒▒╢███▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█▌▓▓╬█████▓▓▓▓╬╬╟╠▒▒▒█Ω
#   ██▓▌▌▌▌▌▌▌██▓▓▓▓▓▓▓╬╬╬▓▓▒▒▀██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▓▓██▓▓▓╬██╬▓▓▓▓▓▓▓▓▓▒▒▌█▌
#   ╟██▌▌▌▌▌▌▌▓██▓▓▓▓▓▓▓▓██▌▓▒▒╬██▓▓▓▓▓▓▓▓╠▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒╫╣███▓▓██╬▓▓▓▓▓▓▓▓▓▓╣███╝
#    ███▌▌▌▌▌▌▌▓██▓▓▓▓▓▓▓╬█████▌▓███╬▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒╬███▓█▌▓▓▓▓▓▓▓▓▓▓╣███▀
#    ╙██▓▌▌▌▌▌▌▌▓██▌▓▓▓▓▓▓▓╬╬███████████▌╬▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒╠╬███▓▓▓▓▓▓▓▓▓▓▓███▀
#     ███▌▌▌▌▌▌▌▌▓███▓▓▓▓▓▓▓▓▓╬╬╠▒▒▒▒▒╬▀▀██████▌╬▓▓▓▓▓▓▓▓▓▓▓▓▓▓╬██▓▓▓▓▓▓▓▓▓▓▓╣██
#     ²███▌▌▌▌▌▌▌▌╣███╬▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▀▀██████████████╬▓▓▓██╬▓▓▓▓▓▓▓▓▓▓▓█▌
#      ╟██▓▌▌▌▌▌▌▌▌████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒╬▀▀▀▀╬╬╬╬████▌╣██▌▓▓▓▓▓▓╬██████
#       ███▓▌▌▌▌▌▌▌▓████▓▓▓▓▓▓▓▓▓▓▓╠▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓╬████▀▀▌█▌▌█████▓██████▄_
#       └███▌▌▌▌▌▌▌▌████▌▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓█▀╨▒▓████████████▓███████▌▄_
#        ╟███▌▌▌▌▌▌▌█████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓████████████████████████▄╥
