Runs Jenkins listener on port $HTTP_PORT using standard http protocol. The default is port 8080. To disable (because you're using https), use port -1. This option does not impact the root URL being generated within Jenkins logic (UI, JNLP files, etc.); it  is defined by the Jenkins URL specified in the global configuration.