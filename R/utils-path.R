#' Path of Program Files on Windows
#' @inheritDotParams base::file.path
#' @return Existing directory path
#' @export
program_files.path <- function(...) {
  path <- Sys.getenv("PROGRAMFILES", unset = NA)
  stopifnot(!is.na(path))
  file.path(path, ...)
}

#' Path of Eagle Dynamics
#'
#' Fails if \emph{no} Eagle Dynamics simulators or other products have not yet
#' been installed.
#'
#' Any addition dot parameters append to Eagle Dynamics as sub-path components
#' \emph{prior} to checking for directory existence. Hence any sub-path must
#' address a directory and not a file.
#'
#' @inheritDotParams program_files.path
#' @return Existing directory path; fails if Eagle Dynamics with Program Files
#'   does not exist
#' @export
eagle_dynamics.path <- function(...) {
  program_files.path("Eagle Dynamics", ...)
}

#' Path of OpenBeta Server
#'
#' Fails if the OpenBeta Server product has not been installed.
#'
#' @inheritDotParams eagle_dynamics.path
#' @return Existing directory path
#' @export
#'
#' @examples
#' \dontrun{
#' library(dcsworldr)
#'
#' # List all files with extension `.miz` found recursively under the OpenBeta
#' # Server folder. Escape the full stop and match the end of the file name.
#' # Name the vector of paths by the base name.
#' file.miz <- openbeta_server.path() %>%
#'   list.files(pattern = "\\.miz$", full.names = TRUE, recursive = TRUE)
#' names(file.miz) <- basename(file.miz)
#'
#' # Are any duplicated by base name? Not at the time of writing.
#' basename(file.miz) %>%
#'   duplicated() %>%
#'   any()
#' #> [1] FALSE
#' }
openbeta_server.path <- function(...) {
  eagle_dynamics.path("DCS World OpenBeta Server", ...)
}
